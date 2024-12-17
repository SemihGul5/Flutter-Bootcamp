import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriYukle(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmlers=snapshot.data;
            return GridView.builder(
              itemCount: filmlers!.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.8),
                itemBuilder: (context,pos){
                var film=filmlers[pos];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("resimler/${film.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${film.fiyat} ₺",style: const TextStyle(fontSize: 24),),
                            ElevatedButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${film.ad} sepete eklendi"))
                              );
                            }, child: const Text("Sepete Ekle"))
                          ],
                        )
                      ],


                    ),
                  ),
                );

            });
          }else{
            return const Center();
          }
        },
      ),
    );
  }

  Future<List<Filmler>> filmleriYukle() async {
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png", fiyat: 24);
    var f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar.png", fiyat: 32);
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png", fiyat: 16);
    var f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight.png", fiyat: 28);
    var f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png", fiyat: 18);
    var f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 10);
    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    return filmlerListesi;
  }

}
