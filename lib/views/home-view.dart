import 'package:flutter/material.dart';
import 'package:hiveExamble/views/family-list-view.dart';
import 'package:hiveExamble/widgets/add-or-edit-widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hive (Family App)",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true, // local storage
      ),
      body: FamilyListView(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddOrEditWidget()));
          },
          label: Row(
            children: [Text("Add Member"), Icon(Icons.add)],
          )),
    );
  }
}
