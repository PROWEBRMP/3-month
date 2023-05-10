import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
1)Обработка событий через замыкание 
2)Обработка событий и управления через контроллер 
3)Работа с фокусом FocusNode
 */

/* План на урок:
   1)Привести пример замыканий
   замыканием называются те ф-ции которые могут использовать переменное окружение в разных местах  
      а)Замыкание _onChanged - срабатывает приизменение текстового поля
      b)Замыкание _onEditingComplete  - срабатывает при завершение изменения текстового поля
      с)Замыкание _onSubmitted - срабатывает при клике на кнопку ☑ на клавиатуре
      d)Замыкание _onTap - срабатывает при каждом клике на текстовое поле
    2)Привести пример с контролерром
    3)Привести пример работы с focusNode
 */

void main() {
  // запускаем наше приложение
  runApp(const MyForm());
}

// создаем StatelessWidget
class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // Подключаем отдельный виджет с нашими полями для ввода данных TextFields()
        body: TextFields(),
      ),
    );
  }
}

// class TextFields extends StatelessWidget {
//   const TextFields({Key? key}) : super(key: key);

// // пример замыканий функций

//   //onChanged , он вызывается в момент изменения текстового поля
//   void _onChanged(String text) {
//     print('_onChanged $text');
//   }

//   // onEditingComplete , вызывается в тот момент когда мы завершили редактирование в текстовом поле
//   void _onEditingComplete() {
//     print('_oneEditingComplete');
//   }

//   // onSubmitted:_onSubmitted, вызывается момент нажатия кнопки на клавиатуре (кнопка ☑)(Работу этого замыкания мы пройдем позже)
//   void _onSubmitted(String text
//) {
//     print('_onSubmitted');
//   }

//   // при клике на текстовое поле срабатывает замыкание onTap:_onTap,
//   void _onTap() {
//     print('_onTap');
//   }
//   // пример замыканий функций

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding:const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: _onChanged,
//               onEditingComplete: _onEditingComplete,
//               onTap: _onTap,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 40),
//             TextField(
//               onChanged: _onChanged,
//               onEditingComplete: _onEditingComplete,
//               onTap: _onTap,
//               decoration:const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Все это время виджет был StatelessWidget но так как мы теперь будем хранить состояние ввода в контроллер т.е наше изменение текстового поля будет вызывать изменения свойства текст внутри этого контроллера и соответсвенно оно будет менятся и значит то что лежит в этом контроллере тоже меняется так как мы значение от контроллера хотим сохранить для этого нам нужно сохранить весь контроллер а чтобы он сохранялся нам нужно преоброзовать наш StatelessWidget в StatefulWidget

// class TextFields extends StatefulWidget {
//   const TextFields({Key? key}) : super(key: key);

//   @override
//   State<TextFields> createState() => _TextFieldsState();
// }

// class _TextFieldsState extends State<TextFields> {
//   final controller = TextEditingController();
//   final controllerTwo = TextEditingController();
// работа через focusNode
/* Focus node тоже хранит в себе состояние и виджет должн быть  StatefulWidget(необязательно) теперь давайте посмотрим на сетоды которые тут есть(в функции)*/
// final _nodeOne = FocusNode();
// final _nodeTwo = FocusNode();

// void _onChanged(String text) {
//   print('_onChanged $text');
// }

// void _onEditingComplete() {
//   print('_oneEditingComplete');
// }

// void _onTap() {
//   print('_onTap');
// }

// void _onListen() {
//   controllerTwo.text = controller.text.toUpperCase();
// }

// void _onButtonTab() {
// controller.text нужен для добавления текста в текстовое поле
// controller.text = 'некий текст';

// addListener мы вызываем подписку и подписка вызывается только один раз
// Например при записи такой функции у нас будет происходить следующее при изменение текста в первом текстовом поле будет меняться состояние второго текстового поля
//  controller.addListener(() {
//    controllerTwo.text = controller.text;
//  });
//  controller.addListener(_onListen);
// controller.removeListener(_onListen);
// controllerTwo.clear();

// textEditionValue то что на самом деле хранится в текстовом контроллере
// controller.value = const TextEditingValue(
//   text: 'dskhjflkadhflkjas',
//   // выделенный текст baseOffset: от extentOffset: до
//   selection: TextSelection(baseOffset: 4,extentOffset: 8),
//   // Местоположение курсора
//   // selection: TextSelection.collapsed(offset: 6)
// );

/* Например есть метод  _nodeOne.hasFocus - данный метод показывает нам поле активно или нет при нажатии на кнопку выводит в консоль значение true или false главное чтобы у каждого поля была разная focusNode*/
// print(_nodeOne.hasFocus);
// print(_nodeTwo.hasFocus);
/* _nodeOne.nextFocus(); Вызывает фокус у следуещего текстового поля */
// _nodeOne.nextFocus();
// _nodeOne.previousFocus(); Вызывает фокус с конца
// _nodeOne.previousFocus();
//  _nodeOne.unfocus(); Деактивирует текстовое поле
// _nodeOne.unfocus();
// С помощью _nodeOne.addListener(() мы будем узнавать какое текстовое поле активно
// _nodeOne.addListener(() {
//   print(_nodeOne.hasFocus);
// });
// }

// @override
// Widget build(BuildContext context) {
//   return Center(
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
// Можно подключить один контроллер на два поля ввода но этого делать крайне не рекомендуются потому что контроллер связан со значением поля т.к два разных поля имеют разные текстовые значения (привести пример с одним контроллером)
// ElevatedButton(
//   onPressed: _onButtonTab,
//   child: const Text('Press'),
// ),
// TextField(
/*Ничего пока не изменилось давайте сначала посмотрим на конструктор нашего focusNode  */
// focusNode: _nodeOne,
// onTap: _onTap,
// onEditingComplete: _onEditingComplete,
// onChanged: _onChanged,
// onSubmitted: _oneSubmitted,
// С помощью контроллера мы можем
// 1)Поставить первоначальное значение в текстовое поле
// 2)очистить текстовое поле вызвав метод clear()
// 3)Мы можем поставить новый текст вызвав text = 'text'
// 4)Мы можем подписатся и следить за изменением состояния
//               controller: controller,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 40),
//             TextField(
//               focusNode: _nodeTwo,
//               onTap: _onTap,
//               onEditingComplete: _onEditingComplete,
//               onChanged: _onChanged,
//               controller: controllerTwo,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// InputFormaters - Это вещь которая позволяет форматировать ввод прямо на лету т.е править все что мы туда вводим
class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          inputFormatters: [
            // TextInputFormatter - это базовый класс сам по себе он ничего не делает но давайте посмотрим на структуру
            //  FilteringTextInputFormatter.digitsOnly, позволяет сделать ввод только цифровых значений
            // FilteringTextInputFormatter.digitsOnly,
            // Позволяет вводить любые значения только в одну строку
            // FilteringTextInputFormatter.singleLineFormatter,
            // FilteringTextInputFormatter.allow(RegExp(r'[\d]+')),позволяет нам вводить только разрешенную часть
            // RegExp(r'[\d]+')-регулярное выражение это строка которая отфармотирована по определенным правилам (google https://ru.wikipedia.org/wiki/%D0%A0%D0%B5%D0%B3%D1%83%D0%BB%D1%8F%D1%80%D0%BD%D1%8B%D0%B5_%D0%B2%D1%8B%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F) и увидеть правила написания
            // FilteringTextInputFormatter.allow(RegExp(r'[\d]+')),
            //  FilteringTextInputFormatter.deny(RegExp(r'[\d]+')), работает в обратном порядке т.е то что написено в regexp мы не можем ввести в текстовое поле
            // FilteringTextInputFormatter.deny(RegExp(r'[\d]+')),
            PhoneInput(),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

// кроме того что можно использовать стандартные форматоры мы можем написать свой форматор давайте напишем свой класс

// TextInputFormatter для него нужен особый import давайте добавим его
class PhoneInput extends TextInputFormatter {
  @override
  // formatEditUpdate он принимает два TextEditingValue
  // когда мы меняем наше тескстовое поле до изменения и после изменения
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Создаем символ разделения
    const String char = ' ';
    // Создаем переменную с обработкой вводимых значений
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[\d]+'), '');
    // Разбиваем полученное значение на массив
    List strList = digitsOnly.split('');
    // Удаляем разделяющий символ()
    strList.removeWhere((element) => element == char);
    // Создаем переменную для хранения результата
    String resultStr = '';
    // Циклом пробегаемся по массиву и реализуем наше разделение
    for (var i = 0; i < strList.length; i++) {
      if (i % 3 == 0 && i != 0) {
        // Если индекс символа кратен 3м и не равен 0 то к нашей строке добавляется символ с элементом массива
        resultStr += '$char${strList[i]}';
      } else {
        // в противном случае мы просто добавляем элемент массива
        resultStr += '${strList[i]}';
      }
    }
    int cursorPosition = resultStr.length;
    return TextEditingValue(
      text: resultStr,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}