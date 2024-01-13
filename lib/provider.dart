import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Provider Example')),
        body: Center(child: CounterText()),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Provider.of<Counter>(context, listen: false).increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                Provider.of<Counter>(context, listen: false).decrement();
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Counter: ${Provider.of<Counter>(context).count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
