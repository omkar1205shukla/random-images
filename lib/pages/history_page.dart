import 'dart:io';

import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> imageLocalPaths = [];
  void addImageToLocalPaths(String imagePath) {
    setState(() {
      imageLocalPaths.add(imagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        itemCount: imageLocalPaths.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Image.file(File(imageLocalPaths[index])),
          );
        },
      ),
    );
  }
}
