import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var sayac=0;
  var kontrol=false;

  Future<int> toplam(int sayi1,int sayi2) async{
      return sayi1+sayi2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: const Text("Anasayfa", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sayaç: $sayac"),
            ElevatedButton(onPressed: (){
              setState(() {
                sayac++;
              });
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: const Text("Arttır", style: TextStyle(color: Colors.white),)),

            ElevatedButton(onPressed: (){
              setState(() {
                var kisi=Kisiler("Ali",75);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OyunEkrani(kisi))).then((value) => {
                  //anasayfaya dönüldü
                });
              });
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: const Text("Başla", style: TextStyle(color: Colors.white),)),
            Visibility(
                visible: kontrol,
                child: Text("Merhaba")),
            Text(kontrol?"Merhaba":"Güle Güle", style: TextStyle(color: kontrol ? Colors.blueAccent:Colors.redAccent),),
            ((){
              if(kontrol){
                return Text("Merhaba",style: TextStyle(color: Colors.amberAccent),);
              }else{
                return Text("Güle Güle",style: TextStyle(color: Colors.indigo),);
              }
            }()),
            ElevatedButton(onPressed: (){setState(() {kontrol=true;});}, child: Text("True yap")),
            ElevatedButton(onPressed: (){setState(() {kontrol=false;});}, child: Text("False yap")),
            FutureBuilder(future: toplam(10, 20), builder: (context,snapshot){
              if(snapshot.hasError){
                return Text("Hata Oluştu");
              }
              if(snapshot.hasData){
                return Text("Sonuç: ${snapshot.data}");
              }else{
                return Text("Sonuç Yok!");
              }
            }),
            
          ],
        ),
      ),
    );
  }
}
