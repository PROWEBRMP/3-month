/* Ключ - это идинтификатор виджета который может подсказать flutter что этот виджет является особенным в том плане если у вас есть два обычных виджета (допустим container) но одному из них мы можем поставить ключ и это уже юудет не просто контейнер а контейнер с конкретным ключом и когда флаттер увидит что у него есть ключ он сможет отличить его от других контейнеров*/

// Ключи нужны для того чтобы их сравнивать между собой и в зависимости от того равны они или же не равны flutter может сделать какую нибудь интересную вещь

/*  Для начала мы разберем какие бывают ключи 
У нас есть корневой абстрактный класс это key от него ничего нельзя сделать и мы никак не можем его использовать и от него уже идут два наследника это GlobalKey и LocalKey отличаются они тем что локальный должен быть использован где-то а конкретном месте а глобальный может быть использован во всем приложение 
*/

// GlobalKey это глобальный ключ у GlobalKey есть еще несколько наследников это GlobalObjectKey и LabeledGlobalkey
// GlobalObjectKey - глобальный ключ который будет сравниватся на основе объекта внутри него
// LabeledGlobalkey -

// LocalKey это локальный ключ он тоже является абстрактным и его использовать нельзя но мы можем использовать его наследников это
// 1)ObjectKey - ключ с объектом
// 2)UniqueKey - уникальный ключ
// 3)ValueKey - ключ с премитивным значением

// 1)Что такое ключи
// 2)какие бывают ключи
// 3)Категории на которые делятся ключи
// 4)Практика:
//   а)Локальные ключи простой пример
//   b)Локальные ключи ReorderableListView
//   с)Глобальные ключи получения состояния
//   d)PageStorageKey запоминаем скролл
//   e)PageStorageKey Запоминаем любые действия
// 5)В какиз ситуациях применять коючи а в каких нет
// 6)Какой ключ для чего нужен
import 'dart:math';
import 'package:flutter/material.dart';

// как правило глобальные ключи создаются на верхнем уровне чтобы иметь доступ ко всему приложению
// final key = GlobalKey();
// Ключ всегда равен только самому себе
// Обязательно нужно где-либо хранить ключ но не всегда это возможно иногда ключ пересоздается то мы получаем новый ключ который не равен старому и с этим нужно что-то делать для этого и существует целая группа конкретных ключей
// final localKey = UniqueKey();
// final valueKey = ValueKey('some');
// Самая главная фишка ключей в том что они сравниваются
void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({ Key? key }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//      this.key == key;
//     //  ValueKey(); Он интересен тем что у него есть какое то знаение т.е value какой-то простий тип данный (число,строка и т.д)
//     //  И здесь есть очень интересный моммент если я создам этот ключ final valueKey = ValueKey('some'); то я могу сравнить его так valueKey == valueKey; на самом этот valueKey он уже не уникальный он сравнивается по значению внутри  т.е имея значение вы можете создавать ключи в любой подходящий для вас момент и они будут одинаковые даже если это два разных экземпляра ключа главное чтобы значение было одинаковым
//valueKey == ValueKey('some');
//return Container(

//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: PositionedTiles(),
        ),
      ),
    );
  }
}

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({Key? key}) : super(key: key);
  @override
  _PositionedTilesState createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    // flutter проверяет по названию виджета и если преобразовать stateleswidget в StatefulWidget то изменений мы не заметим он перерисовывает каждый элемент заново на тоже место для этого нам нужно использовать UniqueKey
    StatrelessColorFulTile(key: UniqueKey()),
    StatrelessColorFulTile1(key: UniqueKey()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            swapTiles();
          },
          child: const Text('Press me'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ],
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatrelessColorFulTile extends StatefulWidget {
  StatrelessColorFulTile({Key? key}) : super(key: key);
  @override
  State<StatrelessColorFulTile> createState() => _StatrelessColorFulTileState();
}

class _StatrelessColorFulTileState extends State<StatrelessColorFulTile> {
  final myColor = UniqueColorGenerator.getColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor,
    );
  }
}

class StatrelessColorFulTile1 extends StatefulWidget {
  const StatrelessColorFulTile1({Key? key}) : super(key: key);

  @override
  _StatrelessColorFulTile1State createState() =>
      _StatrelessColorFulTile1State();
}

class _StatrelessColorFulTile1State extends State<StatrelessColorFulTile1> {
  final myColor1 = UniqueColorGenerator1.getColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor1,
    );
  }
}

class StatrelessColorFulTile2 extends StatefulWidget {
  const StatrelessColorFulTile2({Key? key}) : super(key: key);

  @override
  _StatrelessColorFulTile1State createState() =>
      _StatrelessColorFulTile1State();
}

class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Colors.red;
  }
}

class UniqueColorGenerator1 {
  static final _random = Random();
  static Color getColor() {
    return Colors.black;
  }
}



// домашняя работа сделать RGB генератор цветов
// class UniqueColorGenerator {
//   static final _random = Random();
//   static Color getColor() {
//     return Color.fromRGBO(
//       _random.nextInt(256),
//       _random.nextInt(256),
//       _random.nextInt(256),
//       1.0,
//     );
//   }
// }


