import 'package:flutter/material.dart';

enum TypeSnackbar { success, error }

void showSnackbar(context, msg, TypeSnackbar type) {
  ScaffoldMessenger.of(context).showSnackBar(snackBar(msg, type));
}

SnackBar snackBar(msg, TypeSnackbar type) {
  return SnackBar(
    backgroundColor:
        type == TypeSnackbar.success ? Colors.blueGrey : Colors.orange,
    content: Text("$msg"),
    duration: Duration(seconds: 3),
    action: SnackBarAction(label: "tutup", onPressed: () {}),
  );
}

