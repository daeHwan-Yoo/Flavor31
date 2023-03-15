import 'package:flutter/material.dart';

class AddFlavorForm extends StatefulWidget {
  final Function onSubmit;

  AddFlavorForm({@required this.onSubmit});

  @override
  _AddFlavorFormState createState() => _AddFlavorFormState();
}

class _AddFlavorFormState extends State<AddFlavorForm> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _description;
  String _photoUrl;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Flavor Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a flavor name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Flavor Description',
            ),
            maxLines: 3,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a flavor description';
              }
              return null;
            },
            onSaved: (value) {
              _description = value;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Flavor Photo URL',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a photo URL';
              }
              return null;
            },
            onSaved: (value) {
              _photoUrl = value;
            },
          ),
          SizedBox(height: 32),
          ElevatedButton(
            child: Text('Add Flavor'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                widget.onSubmit(_name, _description, _photoUrl);
              }
            },
          ),
        ],
      ),
    );
  }
}