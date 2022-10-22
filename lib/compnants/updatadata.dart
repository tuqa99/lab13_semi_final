import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatelessWidget {
  UpdateData({super.key});
  CollectionReference studentRef =
      FirebaseFirestore.instance.collection("subject");
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _imagecontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();
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
                      height: 155,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: ListTile(
                        // leading: Image(
                        //     // height: 22,
                        //     // width: 22,
                        //     image: NetworkImage(
                        //         ' ${snapshot.data!.docs[i]['image']}')),
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
                              await showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                          right: 20,
                                          bottom: MediaQuery.of(ctx)
                                                  .viewInsets
                                                  .bottom +
                                              20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            controller: _namecontroller,
                                            decoration: const InputDecoration(
                                                labelText: 'Name'),
                                          ),
                                          TextField(
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            controller: _numbercontroller,
                                            decoration: const InputDecoration(
                                              labelText: 'number',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextField(
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            controller: _imagecontroller,
                                            decoration: const InputDecoration(
                                              labelText: 'Image',
                                            ),
                                          ),
                                          ElevatedButton(
                                            child: const Text('Update'),
                                            onPressed: () async {
                                              final String name =
                                                  _namecontroller.text;
                                              final String image =
                                                  _imagecontroller.text;
                                              final double? number_students =
                                                  double.tryParse(
                                                      _numbercontroller.text);
                                              if (number_students != null) {
                                                await studentRef
                                                    .doc(snapshot
                                                        .data!.docs[i].id)
                                                    .update({
                                                  "instructorname": name,
                                                  "number_students":
                                                      number_students,
                                                  'image': image,
                                                });
                                                _namecontroller.text = '';
                                                _numbercontroller.text = '';
                                                _imagecontroller.text = '';
                                                Navigator.of(context).pop();
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(Icons.edit)),
                      )),
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
