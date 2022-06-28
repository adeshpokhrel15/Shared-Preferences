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
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: FutureBuilder<FormModel>(
              future: DataSource().getFormData(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return Center(
                    child: Column(
                      children: [
                        Text(snap.data!.name),
                        SizedBox(
                          height: 6,
                        ),
                        Text(snap.data!.address),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => EditPage(
                                        formmodel: snap.data!,
                                      )));
                            },
                            child: Text("Edit"))
                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ));
  }
}
