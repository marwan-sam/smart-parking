import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


PreferredSizeWidget appBarWidget( {required  context}) => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop(); // Handle the action when the back arrow is pressed
      },
    ),
  );
