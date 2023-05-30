import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _addFormKey = GlobalKey<FormState>();
  final _addFormController = TextEditingController();
  final List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return buildTodoLitItem(index);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: buildAddTodoTextField(),
        )
      ],
    );
  }

  Widget buildTodoLitItem(int index) {
    return ListTile(
      title: Text(
        todoList[index],
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              showEditDialog(index);
            },
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                todoList.removeAt(index);
              });
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddTodoTextField() {
    return Row(
      children: [
        Expanded(
          child: Form(
            key: _addFormKey,
            child: TextFormField(
              controller: _addFormController,
              validator: _createTodoValidator,
              decoration: const InputDecoration(
                hintText: 'Input a new todo',
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            if (_addFormKey.currentState!.validate()) {
              setState(() {
                todoList.add(_addFormController.text);
                FocusScope.of(context).unfocus();
                _addFormController.clear();
              });
            }
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  void showEditDialog(int index) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final editFormKey = GlobalKey<FormState>();
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: Form(
            key: editFormKey,
            child: TextFormField(
              initialValue: todoList[index],
              onSaved: (value) {
                setState(() {
                  todoList[index] = value!;
                });
              },
              validator: (value) => _editTodoValidator(todoList[index], value),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (editFormKey.currentState!.validate()) {
                  editFormKey.currentState!.save();
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  String? _createTodoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (todoList.contains(value)) {
      return 'This Todo is in list';
    }
    return null;
  }

  String? _editTodoValidator(String oldValue, String? newValue) {
    if (oldValue == newValue) {
      return null;
    }
    if (newValue == null || newValue.isEmpty) {
      return 'Please enter some text';
    }
    if (todoList.contains(newValue)) {
      return 'This Todo is in list';
    }
    return null;
  }
}
