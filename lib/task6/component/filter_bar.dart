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
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextField(
          controller: widget.searchController,
          decoration: InputDecoration(
            hintText: 'Keyword Search',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: widget.onSearch,
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
