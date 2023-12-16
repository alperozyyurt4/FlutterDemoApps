import 'package:flutter/material.dart';

class MusicAppHomePage extends StatelessWidget {
  MusicAppHomePage({super.key});

  final _title = 'Music Player';
  final _itemCount = 10;
  final _cardRadius = 5.0;

  final songName = [
    'When The Night is Over',
    'Never Mind',
    'Painted Red',
    'PCH',
    'Psalms',
    'Ptsd',
    'Boneboyz Nightz',
    'I Guess You Moved On',
    'Walk Away',
    'The Cheri Cheri Lady'
  ];
  final singerName = [
    'Lord Huron',
    'Dennis Lloyd',
    'ill Nicky',
    'Jaden',
    'Vudu Sister',
    'Pop Smoke',
    'Chaze Sharp',
    'Papithbk',
    'Aiko',
    'Modern Talking'
  ];
  final avatarImage = [
    'lord_huron.png',
    'never_mind.png',
    'painted_red.png',
    'pch.png',
    'psalms.jpeg',
    'ptsd.png',
    'boneboyz_nightz.png',
    'igymon.png',
    'walk_away.png',
    'cheri_lady.png'
  ];
  final songDuration = ['5:12', '2:37', '3:51', '5:51', '3:41', '3:20', '2:47', '1:12', '2:00', '3:46'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyleUtility().titleText),
        actions: [
          Container(
            alignment: Alignment.centerRight,
            child: const Icon(Icons.library_music),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _itemCount,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.green,
            shadowColor: Colors.blue[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_cardRadius)),
            child: ListTile(
                tileColor: Colors.black38,
                leading: CircleAvatar(
                  backgroundImage: assetsSelectImage(index),
                ),
                title: Text(songName[index], style: TextStyleUtility().songNameText),
                subtitle: Text('By ${singerName[index]}', style: TextStyleUtility().singerNameText),
                trailing: Text(songDuration[index])),
          );
        },
      ),
    );
  }

  AssetImage assetsSelectImage(int index) => AssetImage('assets/images/${avatarImage[index]}');
}

class TextStyleUtility {
  TextStyle titleText = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle songNameText = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic);
  TextStyle singerNameText = const TextStyle(fontSize: 17, fontWeight: FontWeight.w400);
}
