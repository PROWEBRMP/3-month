import 'package:flutter/material.dart';
import 'package:template_for_lessons/ui/template/page_template.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context)?.settings;
    String answer = settings?.arguments as String;

    answer = answer.isEmpty ? 'Нет данных' : answer;

    return PageTemplate(
      title: 'Second Page',
      child: Center(
        child: Text(
          answer,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 23,
            height: 1.4,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
