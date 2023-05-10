import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String title;
  final bool haveSettingsButton;
  final Widget? child;

  const PageTemplate({
    Key? key,
    required this.title,
    this.haveSettingsButton = true,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          if (haveSettingsButton)
            IconButton(
              splashRadius: 20,
              onPressed: () => Navigator.of(context).pushNamed('/settings'),
              icon: const Icon(Icons.settings),
            ),
        ],
      ),
      body: child,
    );
  }
}
