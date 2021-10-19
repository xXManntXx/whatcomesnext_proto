import 'package:flutter/material.dart';

import 'package:whatcomesnext_proto/timer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WCNext',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'What Comes Next'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var _counter = 0;
  AnimationController? _timerController;
  final gameDuration = 40;

  @override
  void dispose() {
    _timerController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _timerController = AnimationController(
        vsync: this,
        // Modify this value to modify game duration
        duration: Duration(
          seconds: gameDuration,
        ));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: _timerController!.isAnimating ? _timerController!.stop : _timerController!.forward,
              child: Text(_timerController!.isAnimating ? 'Stop' : 'Start'), //TODO faire en sorte que le bouton se mette à jour tout seul
            ),
            Timer(
              animation: StepTween(
                begin: 0,
                end: gameDuration,
              ).animate(_timerController!),
            ),
            // TODO faire en sorte que ça réagisse à un moment particulier pour l'arréter
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
