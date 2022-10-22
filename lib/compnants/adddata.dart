import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({super.key});

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _imagecontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        SizedBox(
          height: 44,
        ),
        Center(
          child: Text(
            "Add the Subject information ",
            style: TextStyle(fontSize: 27, fontFamily: 'GreatVibes'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: _namecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "instructor Name",
              hintText: 'Enter instructor Name',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            cursorWidth: 33,
            controller: _numbercontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Number of student",
              hintText: 'Enter Number of student',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: _imagecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Link of Image",
              hintText: 'Enter Link of Image',
            ),
          ),
        ),
        Center(
          child: MaterialButton(
            onPressed: () {
              CollectionReference SubjectRef =
                  FirebaseFirestore.instance.collection('subject');
              SubjectRef.add({
                'image': _imagecontroller.text,
                'instructorname': _namecontroller.text,
                'number_students': _numbercontroller.text
              });
            },
            child: Icon(Icons.create),
          ),
        )
      ],
    ));
  }
}
