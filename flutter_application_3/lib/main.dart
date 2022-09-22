import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}

//El titulo
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checklist with random words"),
      ),
      body: Column(
        children: [
          TaskList(),
          RandomWords(),
        ],
      ),
    );
  }
}

//acaba de combinar los 2

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(label: "Uno"),
        TaskItem(label: "Dos"),
        TaskItem(label: "Tres"),
        TaskItem(label: "Cuatro"),
        TaskItem(label: "Cinco"),
        TaskItem(label: "Seis"),
        TaskItem(label: "Siete"),
        TaskItem(label: "Ocho"),
      ],
    );
  }
}

//para poner el check

class TaskItem extends StatefulWidget {
  final String label;

  TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  //valor de true or false
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    //EL chulito
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() => _value = newValue),
          value: _value,
        ),
        Text(widget.label),
      ],
    );
  }
}
