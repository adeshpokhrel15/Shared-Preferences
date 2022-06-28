import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharedlocal/draft.dart';
import 'package:sharedlocal/formModel.dart';
import 'package:sharedlocal/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController nameController;
  late TextEditingController addressController;

  @override
  void initState() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => Draft()));
            },
          ),
        ],
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
                child: Text('Save Data'))
          ],
        ),
      ),
    ));
  }
}
