import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_study/task5/api/github.dart';
import 'package:flutter_study/task5/model/repository_issue.dart';
import 'package:flutter_study/ui_state/load_ui_state_scaffold.dart';
import 'package:flutter_study/ui_state/ui_state.dart';

class RepositoryScreen extends StatefulWidget {
  const RepositoryScreen({super.key, required this.fullName});

  final String fullName;

  @override
  State<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  final _githubApi = GithubApi();
  LoadUIState _loadReadmeUIState = Loading();
  int _currentIssuePage = 1;
  bool _isIssuesLoading = true;
  final List<RepositoryIssue> _issues = [];

  final ScrollController _issuesScrollController = ScrollController();

  @override
  void initState() {
    _issuesScrollController.addListener(_issuesScrollListener);
    _loadReadme();
    _loadMoreIssues();
    super.initState();
  }

  @override
  void dispose() {
    _issuesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.fullName),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Readme'),
              Tab(text: 'Issues'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _readmeBuild(),
            _issuesBuild(),
          ],
        ),
      ),
    );
  }

  Widget _readmeBuild() {
    return LoadUIStateScaffold(
      loadUIState: _loadReadmeUIState,
      successBuilder: (data) {
        return Markdown(data: data as String);
      },
    );
  }

  Widget _issuesBuild() {
    return ListView.builder(
      itemCount: _issues.length + 1,
      controller: _issuesScrollController,
      itemBuilder: (context, index) {
        if (index < _issues.length) {
          final issue = _issues[index];
          final isClosed = issue.state == 'closed';
          return ListTile(
            title: Text(
              issue.title ?? '',
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            subtitle: Row(
              children: [
                isClosed
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.purple,
                      )
                    : const Icon(
                        Icons.radio_button_checked,
                        color: Colors.green,
                      ),
                Expanded(
                  child: Text(
                    issue.body ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          );
        } else {
          if (_isIssuesLoading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return null;
          }
        }
      },
    );
  }

  Future<void> _loadReadme() async {
    final readmeResult = await _githubApi.getRepositoryReadme(widget.fullName);
    final readmeEncodedContent = readmeResult.content;
    final readmeContent = utf8.decode(
      base64.decode(readmeEncodedContent.replaceAll(RegExp(r'\s'), '')),
    );
    setState(() {
      _loadReadmeUIState = Success(readmeContent);
    });
  }

  Future<void> _loadMoreIssues() async {
    final issues = await _githubApi.getRepositoryIssues(
      widget.fullName,
      _currentIssuePage,
      100,
    );
    _currentIssuePage++;
    setState(() {
      _issues.addAll(issues);
    });
  }

  void _issuesScrollListener() {
    if (_issuesScrollController.offset >=
            _issuesScrollController.position.maxScrollExtent &&
        !_issuesScrollController.position.outOfRange) {
      if (_isIssuesLoading) {
        _isIssuesLoading = false;
      } else {
        _isIssuesLoading = true;
        _loadMoreIssues();
      }
    }
  }
}
