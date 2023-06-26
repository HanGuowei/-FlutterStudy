import 'package:flutter/material.dart';
import 'package:flutter_study/ui_state/ui_state.dart';

typedef LoadUIStateSuccessWidgetBuilder = Widget Function(dynamic data);

class LoadUIStateScaffold extends StatefulWidget {
  const LoadUIStateScaffold({
    super.key,
    required this.loadUIState,
    required this.successBuilder,
  });

  final LoadUIState loadUIState;
  final LoadUIStateSuccessWidgetBuilder successBuilder;

  @override
  State<LoadUIStateScaffold> createState() => _LoadUIStateScaffoldState();
}

class _LoadUIStateScaffoldState extends State<LoadUIStateScaffold> {
  @override
  Widget build(BuildContext context) {
    switch (widget.loadUIState.runtimeType) {
      case Loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Error:
        final error = (widget.loadUIState as Error).message;
        return Center(
          child: Column(
            children: [
              Text(error),
              IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
            ],
          ),
        );
      case Success:
        final data = widget.loadUIState as Success;
        return widget.successBuilder(data.data);
      default:
        return const Center(
          child: Text('Empty'),
        );
    }
  }
}
