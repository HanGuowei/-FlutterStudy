import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _dataArray = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('task 2'),
      ),
      body: SafeArea(
        child: _dataArray.isNotEmpty ? ListView.builder(
          itemBuilder: (context, index) {
            return _TodoCell(
              index: index,
              todoContent: _dataArray[index],
              deleteCallBack: (deleteIndex) => _deleteContent(deleteIndex),
              editCallBack: (editIndex) => _changeContent(isAdd: false, index: editIndex),
            );
          },
          itemCount: _dataArray.length,
        ) : Center(child: Text('Please add content'),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeContent(),
        child: Icon(Icons.add),
      ),
    );
  }

  void _deleteContent(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure delete?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _dataArray.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('sure'),
            ),
          ],
        );},
    );
  }

  void _changeContent({bool isAdd = true, int index = 0}) {
    final title = isAdd ? Text('add content') : Text('edit content');
    final initialValue = isAdd ? '' : _dataArray[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: Form(
            key: _formKey,
            child: TextFormField(
              initialValue: initialValue,
              validator: (value) =>
              isAdd ? _addValidator(value) : _editValidator(_dataArray[index], value),
              decoration: const InputDecoration(
                hintText: 'please input content',
              ),
              onSaved: (value) {
                setState(() {
                  if (value != null && value.isNotEmpty) {
                    if (isAdd) {
                      _dataArray.add(value);
                    } else {
                      _dataArray[index] = value;
                    }
                  }
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                if (!(_formKey.currentState?.validate() ?? false)) {
                  return;
                }
                _formKey.currentState?.save();
                Navigator.of(context).pop();
              },
              child: Text('sure'),
            ),
          ],
        );},
    );
  }

  String? _addValidator(String? value) => switch (value) {
  _ when value == null || value.isEmpty => 'Please input some text',
  _ when _dataArray.contains(value) => 'This content is in list',
  _ => null,
  };

  String? _editValidator(String oldValue, String? newValue) {
    if (oldValue == newValue) {
      return null;
    }

    return _addValidator(newValue);
  }
}

class _TodoCell extends StatelessWidget {
  const _TodoCell({
  super.key,
  required this.index,
  required this.todoContent,
  required this.deleteCallBack,
  required this.editCallBack,
  });

  final int index;
  final String todoContent;
  final ValueChanged<int> deleteCallBack;
  final ValueChanged<int> editCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoContent),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => deleteCallBack(index),
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () => editCallBack(index),
            icon: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
