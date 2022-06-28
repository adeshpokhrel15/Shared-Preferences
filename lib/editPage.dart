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
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: ' Name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  hintText: 'Enter your  Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: addressController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Address',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  hintText: 'Enter your Address',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final FormModel formModel = FormModel(
                      name: nameController.text,
                      address: addressController.text,
                    );
                    await Service().saveData(data: formModel.toJson());
                  },
                  child: Text('Edit Data'))
            ],
          ),
        ));
  }
}
