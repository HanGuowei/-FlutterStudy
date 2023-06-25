import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    super.key,
    required this.value,
    required this.onChanged,
    required this.categories,
  });

  final String value;
  final List<String> categories;
  final ValueChanged<String?> onChanged;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: DropdownMenu(
          initialSelection: widget.value,
          textStyle: const TextStyle(
            fontSize: 17,
          ),
          menuStyle: const MenuStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            elevation: MaterialStatePropertyAll(4),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            isDense: true,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
          dropdownMenuEntries: [
            const DropdownMenuEntry(value: null, label: 'all'),
            for (String item in widget.categories)
              DropdownMenuEntry(value: item, label: item),
          ],
          onSelected: (value) {
            widget.onChanged(value);
          },
        ),
      ),
    );
  }
}
