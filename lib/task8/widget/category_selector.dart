import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FittedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: const DropdownMenu(
            textStyle: TextStyle(
              fontSize: 17,
            ),
            menuStyle: MenuStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              elevation: MaterialStatePropertyAll(4),
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
            ),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: 'わりまし'),
              DropdownMenuEntry(value: 2, label: '確認して'),
              DropdownMenuEntry(value: 3, label: 'お疲れ'),
            ],
          ),
        ),
      ),
    );
  }
}
