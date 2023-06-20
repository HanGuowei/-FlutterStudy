import 'package:flutter/material.dart';
import 'package:flutter_study/task8/widget/category_selector.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  int _categoryTypeIndex = 0;
  DateTime _dueDateTime = DateTime.now();

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
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
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
          labels: const ['new category', 'exist category'],
          selectedLabelIndex: (index) {
            setState(() {
              _categoryTypeIndex = index;
            });
          },
          isScroll: false,
        ),
        const SizedBox(
          height: 10,
        ),
        _categoryTypeIndex == 0
            ? TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Input New Category'),
              )
            : CategorySelector(
                value: '仕事',
                categories: const ['仕事', '日常の雑務', '記念日の計画'],
                onChanged: (v) {},
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
        Text('Due DateTime ${_formatDateTime(_dueDateTime)}'),
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
              onPressed: () {},
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

  String _formatDateTime(DateTime dateTime) =>
      DateFormat('yyyy/MM/dd').format(_dueDateTime);
}
