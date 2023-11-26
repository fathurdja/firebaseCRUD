import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/pageDatabase/data.dart';
import 'package:flutter_application_5/pageDatabase/navigatorTool.dart';

class dataBase extends StatefulWidget {
  const dataBase({super.key});

  @override
  State<dataBase> createState() => _dataBaseState();
}

class _dataBaseState extends State<dataBase> {
  final db = FirebaseFirestore.instance;

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
              return Card(
                  child: ListTile(
                title: Text(data["nama"]),
                trailing: Container(
                  width: 98,
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          navigatorPush(
                              context,
                              DataPage(
                                id: listData[index]["id"],
                                nama: data["nama"],
                                nik: data["nik"],
                              ));
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          delete(listData[index]["id"]);
                        },
                        icon: const Icon(Icons.remove))
                  ]),
                ),
              ));
            }),
          ))
        ],
      ),
    );
  }
}
