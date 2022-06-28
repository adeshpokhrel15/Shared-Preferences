import 'package:flutter/material.dart';
import 'package:sharedlocal/formModel.dart';
import 'package:sharedlocal/service.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key, required this.formmodel}) : super(key: key);
  final FormModel formmodel;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: formmodel.name);
    final addressController = TextEditingController(text: formmodel.address);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Page'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your Name',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your Address',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                final FormModel formModel = FormModel(
                  name: nameController.text,
                  address: addressController.text,
                );
                await Service().saveData(data: formModel.toJson());
              },
              child: Text('Save Data'))
        ],
      ),
    );
  }
}
