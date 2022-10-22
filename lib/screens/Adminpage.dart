import 'package:flutter/material.dart';
import 'package:lab_13_1/compnants/Deletdata.dart';
import 'package:lab_13_1/compnants/adddata.dart';
import 'package:lab_13_1/compnants/readedata.dart';
import 'package:lab_13_1/compnants/updatadata.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 226, 233, 236),
          appBar: AppBar(
            title: Text(
              'Admin Page',
              style: TextStyle(fontFamily: 'GreatVibes'),
            ),
            bottom: TabBar(tabs: [
              IconButton(onPressed: () {}, icon: Icon(Icons.create)),
              IconButton(onPressed: () {}, icon: Icon(Icons.read_more_sharp)),
              IconButton(onPressed: () {}, icon: Icon(Icons.update)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ]),
          ),
          body: TabBarView(children: [
            AddSubject(),
            ReadData(),
            UpdateData(),
            DeletData(),
          ]),
        ));
  }
}
