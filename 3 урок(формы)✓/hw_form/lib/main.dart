import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 350, maxHeight: 450),
              padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 33),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: Offset(3, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const MyForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Добро пожаловать',
          style: TextStyle(
            fontSize: 18,
            height: 1.6,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.zero,
            prefixIcon: Icon(Icons.email),
            hintText: 'Логин',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 24,
            ),
          ),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.indigo,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.zero,
            hintText: 'Пароль',
            prefixIcon: Icon(Icons.lock),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 24,
            ),
          ),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.indigo,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ButtonsCollection(),
      ],
    );
  }
}

class ButtonsCollection extends StatelessWidget {
  const ButtonsCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        Colors.green,
      ),
      minimumSize: MaterialStateProperty.all(const Size(215, 50)),
      maximumSize: MaterialStateProperty.all(const Size(215, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(
        const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
    return Column(
      children: [
        ElevatedButton(
          style: _style.copyWith(
            overlayColor: MaterialStateProperty.all(
              Colors.blue,
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/flat-color-icons_google.png'),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Авторизация',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: _style.copyWith(),
          onPressed: () {},
          child: const Text(
            'Войти',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
