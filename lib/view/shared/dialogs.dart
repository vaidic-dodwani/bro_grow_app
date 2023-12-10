import 'package:flutter/material.dart';

Future<dynamic> showLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text("Fetching Data.."),
        content: LinearProgressIndicator(),
      );
    },
  );
}
