import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyListApp());

class MyListApp extends StatelessWidget {
  const MyListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double textSize = 24.0;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Первый список'),
        ),

        // Виджет ListView представляет прокручиваемый список элементов.
        // Класс ListView имеет несколько конструкторов с большим количеством параметров, поэтому отметим только некоторые параметры:
        // body: const ListVueSimple(),

        // Конструктор по умолчанию класса List, который использован в примере выше, подходит для создания списков с небольшим
        // количеством элементов, поскольку в данном случае нам приходится настраивать каждый элемент списка. Однако даже в
        // примере выше с небольшим количеством элементов мы видим, что все элементы Text отличаются только текстом. И было бы неплохо,
        // если бы мы просто могли бы один раз определить виджет Text и каким-то образом передать ему все необходимые строки для отображения.
        // И в этом случае мы можем использовать другой конструктр класса ListView - ListView.builder()

        // Например, переделаем предыдущий пример с применением конструктора ListView.builder():
        // body: const ListVueBuilder(),

        // При наполнении ListView мы можем по своему стилизовать виджет, который применяется для каждого элемента списка - задать
        // отступы, границы, какую-то графику. Но если речь идет о простом создании разделителя между элементами в ListView, то мы
        // можем воспользоваться еще одним конструктором класса - ListView.separated. Этот конструктор также, как и конструктор
        // ListView.builder позволяет задать с помощью параметра itemBuilder функцию для создания элементов в ListView. Но кроме того
        // с помощью дополнительного параметра separatorBuilder он позволяет задать функцию для создания границы между элементами.

        // Итак, применим конструктор ListView.separated:
        // body: const ListVueSeparated(),

        // Практика
        body: const ClassWork(),
      ),
    );
  }
}

class ListVueSimple extends StatelessWidget {
  const ListVueSimple({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double textSize = 24;
    return ListView(
      // children: объект List<Widget>, который представляет список виджетов, добавляемых в ListView
      children: const <Widget>[
        Text("Имя ученика1", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика", style: TextStyle(fontSize: textSize)),
        Text("Имя ученика2", style: TextStyle(fontSize: textSize)),
      ],

      // scrollDirection: устанавливает направление элементов. Представляет перечисление Axis, которое определяет две константы:

      // Axis.horizontal: устанавливает горизонтальный список - элементы располагаются слева направо (или справо налево)
      scrollDirection: Axis.horizontal,
      // Axis.vertical: устанавливает вертикальный список - элементы располагаются сверху вниз
      // scrollDirection: Axis.vertical,

      // Значение по умолчанию - Axis.vertical.

      // padding: устанавливает отступы элементов от границ ListView, представляет объект EdgeInsetsGeometry
      padding: const EdgeInsets.all(40),

      // reverse: если равен true, располагает элементы в обратном порядке
      reverse: true,

      // physics: задает параметры скроллинга с помощью объекта ScrollPhysics
      physics: const BouncingScrollPhysics(), // Скоролл как на IOS
      // physics: NeverScrollableScrollPhysics(), // Запрет скролла
    );
  }
}

class ListVueBuilder extends StatelessWidget {
  const ListVueBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double textSize = 24;
    const List<String> users = <String>["Tom", "Alice", "Bob", "Sam", "Kate"];
    const List<String> companies = <String>[
      "Microsoft",
      "Google",
      "Apple",
      "JetBrains",
      "Amazon"
    ];

    return ListView.builder(
      itemCount: users.length,
      // Количество элементов
      itemBuilder: (context, index) {
        // ListView.builder() в качестве параметра itemBuilder принимает объект IndexedWidgetBuilder, который создает элементы списка.
        // Этот конструктор более удобен для создания больших списков.

        // return Text(
        //   users[index],
        //   style: const TextStyle(fontSize: textSize),
        // );

        // При этом мы можем использовать несколько источников для создания ListView:

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(users[index], style: TextStyle(fontSize: 22)),
              Text("Место работы: ${companies[index]}",
                  style: TextStyle(fontSize: 18))
            ],
          ),
        );
      },
    );
  }
}

class ListVueSeparated extends StatelessWidget {
  const ListVueSeparated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double textSize = 24;
    const List<String> users = <String>["Tom", "Alice", "Bob", "Sam", "Kate"];
    const List<String> companies = <String>[
      "Microsoft",
      "Google",
      "Apple",
      "JetBrains",
      "Amazon"
    ];

    return ListView.separated(
      // Параметр separatorBuilder также представляет функцию типа IndexedWidgetBuilder, то есть функцию
      // Widget Function(BuildContext context, int index).

      separatorBuilder: (context, index) {
        return Container(
          height: 20,
          margin: const EdgeInsets.all(10),
          color: Colors.amberAccent,
        );
      },
      itemCount: users.length,
      // Количество элементов
      itemBuilder: (context, index) {
        // ListView.builder() в качестве параметра itemBuilder принимает объект IndexedWidgetBuilder, который создает элементы списка.
        // Этот конструктор более удобен для создания больших списков.

        // return Text(
        //   users[index],
        //   style: const TextStyle(fontSize: textSize),
        // );

        // При этом мы можем использовать несколько источников для создания ListView:

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                users[index],
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "Место работы: ${companies[index]}",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        );
      },
    );
  }
}

class ClassWork extends StatelessWidget {
  const ClassWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return ListTile(
          leading: const Icon(Icons.legend_toggle), // Виджет с левой стороны
          title: Text('Элемент №$i'), // Виджет для заголовка(обычно по центру)
          // Виджет для подзаголовка
          subtitle: Text('Подзаголовок элемента №$i'),
          // Не обязательно использовать только текст
          enabled: true, // Определяет можно ли нажать на ListTile или нет
          // Определяет выбран ли элемент или нет (так можно менять стили)
          selected: false,
          style: ListTileStyle.list,

          // Обработка нажатия
          onTap: () => print('Индекс $i'),
          // Обработка долгого нажатия нажатия
          onLongPress: () => print('Долгое нажатие на $i'),
          // Виджет с правой стороны
          trailing: Icon(Icons.delete),
        );
      },
      separatorBuilder: (context, i) => const Divider(
        color: Colors.red,
        thickness: 3,
      ),
      itemCount: 12,
    );
  }
}
