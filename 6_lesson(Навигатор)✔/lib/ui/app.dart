import 'package:flutter/material.dart';
import 'package:template_for_lessons/ui/screens/home_page/home_page.dart';
import 'package:template_for_lessons/ui/screens/second_page/second_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Навигация через роутинг
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const SecondPage(),
      },
      // home: null,
      // Если мы используем роуты, то нам не обязательно указывать home
      // В таком случае у нас есть два варианта как указать первый роут:
      //      1. Дать ему название: "/"
      //      2. Задать его через параметр initialRoute
      initialRoute: "/second",

      // Функция для генирации роутов
      onGenerateRoute: (settings) {

        var data = settings.arguments as String?;
        // Таким образом мы можем передавать данные напрямую в конструктор


        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => const HomePage();
            break;

          case '/second':
            builder = (BuildContext _) => const SecondPage();
            break;

          // Обработка исключения 404(Страница не найдена)
          default:
            builder = (context) {
              return const Scaffold(
                body: Center(
                  child: Text('Страница не найдена'),
                ),
              );
            };
            break;
        }
        // Вызываем страницу которую получили на выходе
        return MaterialPageRoute(
          // Передаём сам билдер
          builder: builder,
          // А тут параметры(настройки) текущего роута
          settings: settings,
          // !!! Для корректной работы обязательно передаёс настройки !!!
        );
      },
    );
  }
}
