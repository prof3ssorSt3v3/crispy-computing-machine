import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.amber,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Context?')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('HOME PAGE'),
              ElevatedButton(
                child: const Text('Open Drawer'),
                onPressed: () {
                  //results in an error
                  //because this context has no Scaffold
                  Scaffold.of(context).openDrawer();
                },
              ),
              ElevatedButton(
                child: const Text('Show Message'),
                onPressed: () {
                  //results in an error
                  //because this context has no Scaffold
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('This is a message.'),
                      action: SnackBarAction(
                        label: 'Close',
                        onPressed: () {
                          //what to do
                        },
                      ),
                    ),
                  ); //showSnackBar
                }, //onPressed
              ),
            ],
          ),
        ),
        drawer: const Drawer(
          child: Column(
            children: [
              Text('one'),
              Text('two'),
              Text('three'),
            ],
          ),
        ),
      ),
    );
  }
}

/*
To fix the context issue with Scaffold.of and ScaffoldMessenger.of
1. Wrap a Builder( builder: (BuildContext context){ }) widget around it
2. Wrap a new Stateless or Stateful Widget around it which will provide 
    a build(BuildContext context) method.
*/