import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              text: 'Кно',
              children: <TextSpan>[
                TextSpan(
                  text: 'П',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: 'ки'),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Buttons(),
        ),
        drawer: const CustomMenu(),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void funck() {
      Scaffold.of(context).openDrawer();
    }

    ButtonStyle _style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
      foregroundColor: MaterialStateProperty.all(Colors.red),
      overlayColor: MaterialStateProperty.all(Colors.green),
      shadowColor: MaterialStateProperty.all(Colors.blue),
      elevation: MaterialStateProperty.all(20),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      minimumSize: MaterialStateProperty.all(const Size(200, 200)),
      maximumSize: MaterialStateProperty.all(const Size(210, 210)),
      textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.red)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.orange,
            width: 20,
            style: BorderStyle.solid,
          ),
        ),
      ),
      alignment: Alignment.center,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: funck,
          child: const Text('ElevatedButton'),
          // style: _style,
        ),
        const SizedBox(height: 40),
        TextButton(
          onPressed: funck,
          child: const Text('TextButton'),
          // style: _style,
        ),
        const SizedBox(height: 40),
        FloatingActionButton.small(
          onPressed: funck,
          child: const Icon(Icons.insert_photo),
        ),
        const SizedBox(height: 40),
        IconButton(
          onPressed: funck,
          icon: const Icon(Icons.insert_photo),
          splashRadius: 25,
        ),
      ],
    );
  }
}

class CustomMenu extends StatelessWidget {
  const CustomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Либо SafeArea(если её прошли)
      child: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: const Text('ElevatedButton'),
              // style: _style,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: const Text('ElevatedButton'),
              // style: _style,
            ),
          ],
        ),
      ),
    );
  }
}
