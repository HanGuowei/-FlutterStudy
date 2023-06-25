import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task8/model/task.dart';
import 'package:flutter_study/task8/state/tasks.dart';
import 'package:flutter_study/task8/util/formDateTime.dart';
import 'package:flutter_study/task8/widget/category_selector.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class NewTaskScreen extends ConsumerStatefulWidget {
  const NewTaskScreen({super.key});

  @override
  ConsumerState<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends ConsumerState<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  final _newCategoryTextController = TextEditingController();
  String _selectedCategoryText = '';
  int _categoryTypeIndex = 0;
  DateTime _dueDateTime = DateTime.now();

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    _newCategoryTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Task'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleTextController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                controller: _descriptionTextController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              _categoryBuild(),
              _dueDateTimeBuild()
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryBuild() {
    final existCategories = ref.watch(getTasksCategoriesProvider);
    if (_selectedCategoryText.isEmpty) {
      _selectedCategoryText = existCategories.firstOrNull ?? '';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text('Category'),
        const SizedBox(
          height: 5,
        ),
        FlutterToggleTab(
          width: 80,
          borderRadius: 30,
          height: 30,
          selectedIndex: _categoryTypeIndex,
          selectedBackgroundColors: const [Colors.blue, Colors.blueAccent],
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          unSelectedTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labels: [
            'new category',
            (existCategories.isNotEmpty)
                ? 'exist category'
                : 'no exist category',
          ],
          selectedLabelIndex: (index) {
            setState(() {
              if (existCategories.isNotEmpty) {
                _categoryTypeIndex = index;
              }
            });
          },
          isScroll: false,
        ),
        const SizedBox(
          height: 10,
        ),
        _categoryTypeIndex == 0
            ? TextFormField(
                controller: _newCategoryTextController,
                decoration:
                    const InputDecoration(hintText: 'Input New Category'),
              )
            : CategorySelector(
                value: existCategories.first,
                categories: existCategories.toList(),
                onChanged: (category) {
                  _selectedCategoryText = category ?? '';
                },
              )
      ],
    );
  }

  Widget _dueDateTimeBuild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text('Due DateTime ${_dueDateTime.formatDateTime()}'),
        SizedBox(
          height: 140,
          child: ScrollDatePicker(
            selectedDate: _dueDateTime,
            options: DatePickerOptions(
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            onDateTimeChanged: (DateTime value) {
              setState(() {
                _dueDateTime = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: _createNewTask,
              child: const Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Create Task'),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  void _createNewTask() {
    final category = (_categoryTypeIndex == 0)
        ? _newCategoryTextController.text
        : _selectedCategoryText;
    final task = Task(
      null,
      _titleTextController.text,
      _descriptionTextController.text,
      DateTime.timestamp(),
      DateTime.timestamp(),
      null,
      _dueDateTime,
      category,
    );
    ref.read(tasksProvider.notifier).addTask(task);
    Navigator.pop(context);
  }
}
