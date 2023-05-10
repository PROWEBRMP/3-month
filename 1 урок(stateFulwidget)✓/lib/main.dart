import 'package:flutter/material.dart';

void main() {
  // runApp(MaterialApp(home: Scaffold(body: Counter())));

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Счётчик'),
        ),
        body: const Center(
          child: MyApp(),
        ),
      ),
    ),
  );
}

/*Класс StatefulWidget предназначен для создания виджетов, которые хранят состояние. При этом несмотря на то, что объекты класса StatefulWidget являются неизменяемыми (immutable), их состояние является изменяемым (mutable).

Что представляет собой состояние? Состояние - это некоторая информация, которая может быть считана синхронно при создании виджета и которая в процессе жизненного цикла виджета может измениться. Состояние может храниться в виде отдельных объектов State, либо в других объектах, на которые объект State подписывается.

Объекты State создаются с помощью метода createState, который вызывается фреймворком и который связывает их с виджетом StatefulWidget. 
Например, определим простейший виджет StatefulWidget:*/

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // Конструктор содержащий один параметр key
  @override
  _MyAppState createState() => _MyAppState();
  /*В данном случае это объект класса _MyAppState. (Классы или члены классов, которые предваряются знаком прочерка (_), являются приватными по отношению к классам из других библиотек.) */
}

class _MyAppState extends State<MyApp> {
  // /Сам класс состояния унаследован от класса State, который типизирован классом класса виджета.
  int count = 0;
  int increment = 4;
  /*В самом классе определена переменная count, которая условно представляет данные, которые хранит класс состояния. */

/*Итак,здесь определен класс Count, который наследуется от StatefulWidget.
Его конструктор содержит один параметр - key, хотя при необходимости мы можем определять какие-то другие параметры, исходя из наших потребностей.
Также класс виджета должен переопределить метод createState(), который должен возвращать состояние для этого виджета */
  @override
  /*Но ключевая идея StatefulWidget состоит в том, что мы можем менять его состояние. Поэтому добавим изменение переменной value по нажатию на кнопку: */
  Widget build(BuildContext context) {
    //Также нам надо переопределить метод build(), который возвращает виджет:
    return FloatingActionButton.extended(
      /*Здесь мы просто возвращаем виджет Center, который выводит значение переменной Count. Но естественно возвращаемая иерархия виджетов может быть более сложной.
      Затем виджет MyApp() встравивается в приложение в элемент Scaffold: */
      label: Text('value $count'),
      /*Теперь для простоты значение переменной value выводится в качестве текста на кнопку. При нажатии на кнопку будет вызываться функция, которая увеличит значение value на единицу. Чтобы указать, что состояние изменилось, виджет вызывает метод State.setState(). В этот метод передается функция, которая не принимает параметров и ничего не возвращает. И именно в ней мы можем изменить значение value. */
      onPressed: () {
        setState(() {
          count++;
          // count = count + increment;
        });
      },
    );
  }
}




// void main(List<String> args) => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
        
//         floatingActionButton: FloatingActionButton.extended(
//           // id
//           heroTag: 'Кнопка 1',
//           // Функция при нажатии
//           onPressed: () {},
//           // Задний фон 
//           backgroundColor: Colors.black,
//           // Текст кнопки(Аналог child)
//           label: const Text('Какой-то текст'),
//         ),
//       ),
//     );
//   }
// }
