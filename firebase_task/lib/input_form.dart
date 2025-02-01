import 'package:firebase_task/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _hobbyController = TextEditingController();

  // Save data to Firestore
  void _saveData() {
    final name = _nameController.text;
    final age = _ageController.text;
    final hobby = _hobbyController.text;

    if (name.isNotEmpty && age.isNotEmpty && hobby.isNotEmpty) {
      FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'age': age,
        'hobby': hobby,
      });

      // Clear fields after saving
      _nameController.clear();
      _ageController.clear();
      _hobbyController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter User Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: _hobbyController,
              decoration: InputDecoration(labelText: 'Favorite Hobby'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _saveData,
                  child: Text('Save Data'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreenPage()),
                    );
                  },
                  child: Text('View Data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
