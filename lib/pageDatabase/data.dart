import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/pageDatabase/navigatorTool.dart';

import 'tambah/snackBars.dart';

class DataPage extends StatefulWidget {
  final String? nama, nik, id;
  DataPage({super.key, this.nama, this.nik, this.id});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController nik = TextEditingController();

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    if (widget.nama != null && widget.nik != null) {
      nama.text = widget.nama!;
      nik.text = widget.nik!;

      setState(() {
        isEdit = true;
      });
    }
  }

  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Data" : "Tambah Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            inputData(
              controller: nama,
              title: "nama",
            ),
            const SizedBox(
              height: 40,
            ),
            inputData(
              controller: nik,
              title: "nik",
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    if (isEdit) {
                      await db
                          .collection("users")
                          .doc(widget.id)
                          .update({"nama": nama.text, "nik": nik.text});
                    } else {
                      await db
                          .collection("users")
                          .add({"nama": nama.text, "nik": nik.text});
                    }
                    showSnackbar(context, "sukses", TypeSnackbar.success);
                    navigatorPop(context);
                  } catch (e) {
                    showSnackbar(context, e, TypeSnackbar.error);
                  }
                },
                child: Text(isEdit ? "Edit data" : "tambah data"))
          ],
        ),
      ),
    );
  }
}

class inputData extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  const inputData({super.key, required this.controller, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: title),
    );
  }
}
