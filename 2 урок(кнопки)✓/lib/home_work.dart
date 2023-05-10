import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int count;

  @override
  void initState() {
    count = 0;
    super.initState();
  }

  String space(int num) {
    List _arr = [...num.toString().split('').reversed];
    String _res = '';

    for (var i = 0; i < _arr.length; i++) {
      _res += (i + 1) % 3 == 1 ? ' ${_arr[i]}' : _arr[i];
    }

    return _res.split('').reversed.join('');
  }

  void clear() => setState(() {
        count = 0;
      });

  void inkr() => setState(() {
        count++;
      });

  void dikr() => setState(() {
        count--;
      });

  void powTwo() => setState(() {
        count *= count;
      });

  void deli() => setState(() {
        count ~/= 2;
      });

  void ran() => setState(() {
        count = Random().nextInt(10000);
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Display(
            text: space(count),
          ),
          ButtonSection(
            rowButtonList: <Row>[
              Row(
                children: <RowButton>[
                  RowButton(label: 'Сброс', func: clear, flex: 2),
                  RowButton(label: '+', func: inkr),
                  RowButton(label: '-', func: dikr),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: <RowButton>[
                  RowButton(label: 'Квадрат', func: powTwo, flex: 2),
                  RowButton(label: '/2', func: deli),
                  RowButton(label: 'Ran', func: ran),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  final String text;

  const Display({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(35),
      alignment: Alignment.center,
      constraints: const BoxConstraints(
        maxWidth: 300,
        maxHeight: 250,
      ),
      color: Colors.grey.shade300,
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final List<Row> rowButtonList;
  // final List<RowButton> rowButtonListTwo;

  const ButtonSection({
    Key? key,
    required this.rowButtonList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      color: Colors.indigo,
      constraints: const BoxConstraints(
        maxWidth: 300,
        // maxHeight: 250,
      ),
      child: Column(
        children: rowButtonList,
      ),
    );
  }
}

class RowButton extends StatelessWidget {
  final Function func;
  final MaterialColor color;
  final int flex;
  final String label;

  const RowButton({
    Key? key,
    this.color = Colors.lightGreen,
    required this.func,
    this.flex = 1,
    this.label = 'Кнопка',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton.extended(
          onPressed: () => func(),
          label: AutoSizeText(
            label,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
