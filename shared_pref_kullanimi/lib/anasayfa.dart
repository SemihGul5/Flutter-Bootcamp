import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Açılış sayısı: $sayac",style: TextStyle(fontSize: 35),),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    test();
    sayacKontrol();
  }
  Future<void> sayacKontrol() async{
    var sp=await SharedPreferences.getInstance();
    sayac=sp.getInt("sayac")??0;
    setState(() {
      sayac+=1;
    });
    sp.setInt("sayac", sayac);
  }
  Future<void> test() async{
    var sp= await SharedPreferences.getInstance();
    // veri kaydı
    sp.setString("ad", "ali");
    sp.setInt("yas", 23);
    sp.setDouble("boy", 178);
    sp.setBool("bekar", false);

    var arkadasList=<String>[];
    arkadasList.add("veli");
    arkadasList.add("deli");
    sp.setStringList("arkadaslar", arkadasList);
    //veri silme
    sp.remove("ad");
    //veri okuma
    String gelenAd=sp.getString("ad")??"isim yok";
    print(gelenAd);
    int gelenYas=sp.getInt("yas")??0;
    double gelenBoy=sp.getDouble("boy")??0.0;
    bool gelenBekar=sp.getBool("bekar")??false;

    var gelenArkadaslar=sp.getStringList("arkadaslar") ?? <String>[];
    if(gelenArkadaslar!=null){
      for(var a in gelenArkadaslar){
        print(a);
      }
    }

  }
}
