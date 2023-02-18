import 'package:flutter/material.dart';

class AddFlavorScreen extends StatefulWidget {
  @override
  _AddFlavorScreenState createState() => _AddFlavorScreenState();
}

class _AddFlavorScreenState extends State<AddFlavorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Flavor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Flavor Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a flavor name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // Save the new flavor to the database
                    // ...
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}