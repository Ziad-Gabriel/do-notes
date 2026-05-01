import 'package:flutter/material.dart';

AlertDialog customAlertDialog(BuildContext context,{required String message}){
  return AlertDialog(
      title: Text('Invalid input'),
      content: Text(message),
      actions: [
      ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text('OK'),
      ),
    ],
    );}

