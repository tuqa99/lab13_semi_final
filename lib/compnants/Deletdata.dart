import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeletData extends StatelessWidget {
  DeletData({super.key});
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
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 33,
                          backgroundImage: NetworkImage(
                              "${snapshot.data!.docs[i]['image']}"),
                        ),
                        title: Text(
                            "Instructor Name    ${snapshot.data!.docs[i]['instructorname']}"),
                        subtitle: Text(
                            "Number of student   ${snapshot.data!.docs[i]['number_students']}"),
                        trailing: IconButton(
                            onPressed: () async {
                              await studentRef
                                  .doc(snapshot.data!.docs[i].id)
                                  .delete();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'You have successfully deleted a product')));
                            },
                            icon: Icon(Icons.delete)),
                      )),
                  // Center(
                  //     child:
                  //         Text("${snapshot.data!.docs[i]['number_students']}")),
                  // Center(
                  //     child:
                  //         Text("${snapshot.data!.docs[i]['instructorname']}")),
                  // Center(child: Text("${snapshot.data!.docs[i]['image']}")),
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
