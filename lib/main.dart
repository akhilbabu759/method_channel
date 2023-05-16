import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var methodeChannel = const MethodChannel('sample');

  showToast() async {
    await methodeChannel.invokeMethod('changeColor');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 136, 14, 55),
                Color.fromARGB(115, 30, 16, 228),
              ]),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: showToast,
              child: const Text(
                'Show Toast',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
