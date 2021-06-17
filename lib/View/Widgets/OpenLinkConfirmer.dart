import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showSnackBar(String link, BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text('This link will open in browser'),
      action: SnackBarAction(
        label: 'Open',
        onPressed: () => launch(link),
      ),
    ),
  );
}
