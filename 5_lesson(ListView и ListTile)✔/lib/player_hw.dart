import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('My Music Player'),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.expand_more_rounded,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        body: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 209, 188, 1),
                Color.fromRGBO(112, 225, 245, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: MusicPlayer(),
        ),
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Cover(),
        SizedBox(
          height: 30,
        ),
        MusicController(),
        SizedBox(
          height: 30,
        ),
        CollectionOfTracks(),
      ],
    );
  }
}

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.network(
          'https://www.rap.ru/upload/img/15146.jpg',
          width: 250,
          height: 250,
        ),
      ),
      padding: const EdgeInsets.all(25),
    );
  }
}

class MusicController extends StatefulWidget {
  const MusicController({Key? key}) : super(key: key);

  @override
  State<MusicController> createState() => _MusicControllerState();
}

class _MusicControllerState extends State<MusicController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          IconButtonWidget(
            curentColor: Colors.red,
            icon: Icons.favorite,
          ),
          IconButtonWidget(
            curentColor: Colors.blue,
            icon: Icons.cut,
          ),
          IconButtonWidget(
            curentColor: Colors.blue,
            icon: Icons.timer,
          ),
          IconButtonWidget(
            curentColor: Colors.greenAccent,
            icon: Icons.mobile_screen_share_rounded,
          ),
        ],
      ),
    );
  }
}

class IconButtonWidget extends StatefulWidget {
  final Color curentColor;
  final IconData icon;
  const IconButtonWidget({
    Key? key,
    required this.curentColor,
    required this.icon,
  }) : super(key: key);

  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    Color defaulColor = Colors.grey;
    var iconColor = isChange ? widget.curentColor : defaulColor;

    return IconButton(
      onPressed: () {
        setState(() {
          isChange = !isChange;
        });
      },
      iconSize: 36,
      icon: Icon(
        widget.icon,
        color: iconColor,
      ),
    );
  }
}

class CollectionOfTracks extends StatelessWidget {
  const CollectionOfTracks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemBuilder: (_, index) {
          return const TrackItem();
        },
        itemCount: 15,
      ),
    );
  }
}

class TrackItem extends StatelessWidget {
  const TrackItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        // style: ListTileStyle.list,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.genius.com/ca1fd0db40d331ce2c214b8478ad6109.1000x1000x1.jpg',
              ),
            ),
          ),
        ),
        title: const Text('Хоп-механика'),
        subtitle: const Text('Oxxxymiron'),
        onTap: () {},
        trailing: FloatingActionButton.small(
          onPressed: () {},
          child: const Icon(Icons.play_arrow),
          backgroundColor: const Color.fromRGBO(255, 209, 188, 1),
          elevation: 0,
        ),
      ),
    );
  }
}
