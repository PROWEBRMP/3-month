import 'package:flutter/material.dart';
import 'package:template_for_lessons/ui/template/page_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

    return PageTemplate(
      title: 'Home',
      child: Center(
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/second',
                    arguments: _controller.text,
                  );
                },
                child: const Text('Отправить данные'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
