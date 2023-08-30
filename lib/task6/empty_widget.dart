import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.tip = 'no data',
  });

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        tip,
      ),
    );
  }
}
