import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  final TextEditingController searchController;
  final VoidCallback onSearch;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  final FocusNode _commentFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextField(
          focusNode: _commentFocus,
          controller: widget.searchController,
          decoration: InputDecoration(
            hintText: 'Keyword Search',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _commentFocus.unfocus();
                widget.onSearch();
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
