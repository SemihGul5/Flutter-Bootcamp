import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    var lng=AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza", style: TextStyle(color: yaziRenkBeyaz, fontFamily: "Pacifico",fontSize: 24),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(lng!.pizzaBaslik,style: TextStyle(fontSize: ekranGenisligi/11, color: anaRenk, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Image.asset("resimler/pizza_resim.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(icerik: lng.peynirYazi),
                Chip(icerik: lng.sucukYazi),
                Chip(icerik: lng.zeytinYazi),
                Chip(icerik: lng.biberYazi),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(lng.teslimatSure,style: TextStyle(fontSize: 22, color: yaziRenkGray, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(lng.teslimatBaslik,style: TextStyle(fontSize: 22, color: anaRenk, fontWeight: FontWeight.bold),),
                ),
                Text(lng.pizzaAciklama,
                  style: TextStyle(fontSize: 22, color: yaziRenkGray),textAlign: TextAlign.center,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(lng.fiyat,style: TextStyle(fontSize: 44, color: anaRenk, fontWeight: FontWeight.bold),),
                const Spacer(),
                SizedBox(width: ekranGenisligi/2,height: 50,
                  child: TextButton(onPressed: (){},
                      style: TextButton.styleFrom(
                        backgroundColor: anaRenk,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                      ),
                      child: Text(lng.buttonYazi, style: TextStyle(color: yaziRenkBeyaz, fontSize: 18),)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Chip extends StatelessWidget {
  String icerik;
  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
        style: TextButton.styleFrom(backgroundColor: anaRenk),
        child: Text(icerik, style: TextStyle(color: yaziRenkBeyaz),));
  }
}

