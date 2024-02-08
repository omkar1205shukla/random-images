import 'package:flutter/material.dart';
import 'package:random_image/network/repository,.dart';

import '../models/dog_response_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RepositoryImpl repositoryImpl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DogResponseModel>(
          future: repositoryImpl.getRandomImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Column(
                children: [
                  Image.network(snapshot.data!.message!),
                  ElevatedButton(
                      onPressed: () {
                        retry();
                      },
                      child: const Text(
                        "Fetch",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    repositoryImpl = RepositoryImpl();
  }

  void retry() {
    setState(() {});
  }
}
