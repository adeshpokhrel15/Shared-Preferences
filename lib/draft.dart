import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharedlocal/dataSource.dart';
import 'package:sharedlocal/editPage.dart';
import 'package:sharedlocal/formModel.dart';
import 'package:sharedlocal/service.dart';

class Draft extends StatelessWidget {
  const Draft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Draft'),
        ),
        body: FutureBuilder<FormModel>(
            future: DataSource().getFormData(),
            builder: (context, snap) {
              if (snap.hasData) {
                return Column(
                  children: [
                    Text(snap.data!.name),
                    Text(snap.data!.address),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => EditPage(
                                    formmodel: snap.data!,
                                  )));
                        },
                        child: Text("Edit"))
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
