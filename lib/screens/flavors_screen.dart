import 'package:flutter/material.dart';

class FlavorsScreen extends StatelessWidget {
  final List<String> _specialFlavors = [
    'Mint Chocolate Chip',
    'Pralines \'n Cream',
    'Rocky Road',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Special Flavors'),
      ),
      body: ListView.builder(
        itemCount: _specialFlavors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_specialFlavors[index]),
            onTap: () {
              // Navigate to flavor details screen
            },
          );
        },
      ),
    );
  }
}