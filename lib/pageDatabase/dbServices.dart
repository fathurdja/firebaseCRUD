import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/pageDatabase/data.dart';
import 'package:flutter_application_5/pageDatabase/navigatorTool.dart';
import 'package:flutter_application_5/pageDatabase/tambah/snackBars.dart';

class dataBase extends StatefulWidget {
  const dataBase({super.key});

  @override
  State<dataBase> createState() => _dataBaseState();
}

class _dataBaseState extends State<dataBase> {
  final db = FirebaseFirestore.instance;
  final TextEditingController nama = TextEditingController();
  final TextEditingController nik = TextEditingController();

  List listData = [];
  @override
  initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    super.initState();

    await db.collection("users").snapshots().listen((event) {
      List d = [];
      for (var doc in event.docs) {
        d.add({"id": doc.id, "data": doc.data()});
        print("${doc.id} => ${doc.data()}");
      }
      setState(() {
        listData = d;
      });
    });
  }

  void delete(String id) {
    db.collection("users").doc(id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("database")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    navigatorPush(context, DataPage());
                  },
                  child: const Text("tambah data"))
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: ((context, index) {
              final data = listData[index]["data"];
              final id = listData[index]["id"];
              return Card(
                  child: ListTile(
                title: Text(data["nama"]),
                trailing: Container(
                  width: 98,
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Edit',
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      inputData(
                                          controller: nama, title: "nama"),
                                      inputData(controller: nik, title: "nik")
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Approve'),
                                    onPressed: () async {
                                      await db
                                          .collection("users")
                                          .doc(id)
                                          .update({
                                        "nama": nama.text,
                                        "nik": nik.text
                                      });
                                      showSnackbar(context, "berhasi",
                                          TypeSnackbar.success);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          delete(listData[index]["id"]);
                          showSnackbar(context, "berhasil menghapus data",
                              TypeSnackbar.success);
                        },
                        icon: const Icon(Icons.delete))
                  ]),
                ),
              ));
            }),
          ))
        ],
      ),
    );
  }

  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Edit',
  //         ),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               inputData(controller: nama, title: "nama"),
  //               inputData(controller: nik, title: "nik")
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Approve'),
  //             onPressed: () async{
  //             await  db
  //                         .collection("users")
  //                         .doc(id)
  //                         .update({"nama": nama.text, "nik": nik.text});

  //             },
  //           ),
  //           TextButton(
  //             child: const Text('cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
