import 'package:flutter/material.dart';
import '../shared/widgets/streams_builder/hello_stream.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HelloStreamWidget(),
    );
  }
}
