import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadData extends StatelessWidget {
  ReadData({super.key});

  CollectionReference studentRef =
      FirebaseFirestore.instance.collection("subject");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          return Container(
              child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i) {
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 44,
                  ),
                  Center(
                    child: Container(
                      height: 300,
                      width: 240,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Center(
                        child: Column(
                          children: [
                            Image.network(
                              "${snapshot.data!.docs[i]['image']}",
                              height: 200,
                              width: 200,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Instructor'),
                                  SizedBox(
                                    width: 22,
                                  ),
                                  Text(
                                      "${snapshot.data!.docs[i]['instructorname']}"),
                                ],
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 55,
                                  ),
                                  Text('Number of students'),
                                  SizedBox(
                                    width: 22,
                                  ),
                                  Text(
                                      "${snapshot.data!.docs[i]['number_students']}"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 44,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ));
        },
        future: studentRef.get(),
      ),
    );
  }
}
