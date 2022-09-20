import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AppPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
