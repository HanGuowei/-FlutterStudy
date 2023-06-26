import 'package:flutter/material.dart';
import 'package:flutter_study/task6/api/category.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
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
            for (String item in Category.values.map((e) => e.name))
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
