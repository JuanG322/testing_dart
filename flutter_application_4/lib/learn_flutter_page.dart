import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola"),
      ),
      body: Column(
        children: [
          //Image.asset("images/AMOGUS.png"),Funciona pero tengo que buscar una imagen mas pequeña
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.red,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.red,
            child: const Center(
              child: Text(
                "This is AMOGUS",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.red : Colors.deepPurple,
              ),
              onPressed: () {
                debugPrint('Elevated Button');
              },
              child: Text(isSwitch ? 'HOT MOD ACTIVATE' : 'Elevated Button')),
          OutlinedButton(
              onPressed: () {
                debugPrint('Outline Button');
              },
              child: Text(isSwitch ? " " : 'WARNING')),
          TextButton(
              onPressed: () {
                debugPrint('Text Button');
              },
              child: const Text("CLICK HERE")),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              debugPrint("This is the row");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.local_fire_department_outlined,
                  color: Colors.red,
                ),
                Text(
                  "Hot Mode",
                  style: TextStyle(color: Colors.red),
                ),
                Icon(
                  Icons.local_fire_department_outlined,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Switch(
            value: isSwitch,
            onChanged: (bool newBool) {
              setState(() {
                isSwitch = newBool;
              });
            },
          )
        ],
      ),
    );
  }
}
