import 'package:flutter/material.dart';
/* План урока:
 1)Тесты по пройденному материалу(30мин)
 2)Мы поговорим с вами о том что такое buildContext
 3)Как получить context
 4)Рассказать про mediaQuery
 5)PageView
 */

/* Абсолютно у каждого виджета есть свой контекст но не каждого виджета контекст мы можем получить  */

/* 1)Контекст это такая вещь которая позволяет смотреть что происходит вокруг виджета и все что с ним связано а связано с ним довольно много если говорить о том что написано в официальной документации то там говорится о том что контекст позволяет определить позицию виджета в дереве элементов и получить связанную с этой позицией информацию а именно:
1)size - можно получить реальный размер виджета (как он отображается на экране)
2)Widget - можно получить виджет если вдруг у нас есть контекст но нет виджета
3)InheritElement
4)InheritWidget
5)State - состояние 
6)RenderObject
7)Element - элемент
*/

/* Как получить контекст.
Есть несколько способов как получить контекст 
1)В методе build StatelessWidget 
2)Это различные билдеры такие как ListView.Builder,LayoutBuilder,Builder
3)Свойство State Или в методе Build внутри State
4)GlobalKey-как только вы создаете GlobalKey и осоцитируете его с каким то виджетом то через GlobalKey вы можете получить context
 */

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Пишем нашу базовую разметку */
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Context and PageView'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
