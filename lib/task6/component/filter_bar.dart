import 'package:flutter/material.dart';
import 'package:flutter_study/task6/api/news_api.dart';

typedef CategoryChangeCallback = void Function(Category?);

class FilterBar extends StatefulWidget {
  const FilterBar({
    super.key,
    required this.searchController,
    required this.onSearch,
    required this.category,
    required this.onCategoryChange,
  });

  final TextEditingController searchController;
  final VoidCallback onSearch;
  final Category? category;
  final CategoryChangeCallback onCategoryChange;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  Category? category;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(fontSize: 16),
              controller: widget.searchController,
              decoration: InputDecoration(
                hintText: 'Keyword Search',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: widget.onSearch,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            _filterBuild()
          ],
        ),
      ),
    );
  }

  Widget _filterBuild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownButton(
          items: [
            const DropdownMenuItem(
              // ignore: avoid_redundant_argument_values
              value: null,
              child: Text('All'),
            ),
            for (final value in Category.values)
              DropdownMenuItem(
                value: value,
                child: Text(value.name),
              )
          ],
          onChanged: (category) {
            widget.onCategoryChange(category);
          },
          value: widget.category,
        )
      ],
    );
  }
}
