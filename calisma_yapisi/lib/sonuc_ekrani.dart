import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  const SonucEkrani({super.key});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Sonuç Ekranı"),) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Geri Dön")),
            TextButton(onPressed: (){
              Navigator.of(context).popUntil((route) => route.isFirst);
            }, child: Text("Anasayfaya Geri Dön")),
          ],
        ),
      ),
    );
  }
}
