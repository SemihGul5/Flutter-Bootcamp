import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var aramaYapiliyorMu=false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu?//true ise ara text field gözükecek, aranan kelimeyi fonksyiona gönderilecek
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            ara(aramaSonucu);
          },
        ) :
        const Text("Kişiler"),// yukarıdaki : ile false durumunda arama yapılmıyor o yüzden kişiler text gözükecek
        actions: [
          aramaYapiliyorMu? IconButton(onPressed: (){// true ise arama yapılıyordur, çıkmak için false yap
            setState(() {
              aramaYapiliyorMu=false;
            });
          }, icon: const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu=true;
            });
          }, icon: const Icon(Icons.search))
        ],
      ),
      body:FutureBuilder<List<Kisiler>>(
        future: kisileriYukle(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kisilerListesi=snapshot.data;
            return ListView.builder(
                itemCount: kisilerListesi!.length,
                itemBuilder: (context,position){
                  var kisi=kisilerListesi[position];// listedeki pozisyonuna göre kişiyi aldık
                  return SizedBox(height: 100,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(kisi)))
                        .then((value) {
                          //detay sayfasından dönüldüğünde, tekrar kişileri yükle!
                        });
                      },
                      child: Card(// kart tasarımı yapılır
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(kisi.kisi_ad, style:const TextStyle(fontSize: 20),),
                                  Text(kisi.kisi_tel,)
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("${kisi.kisi_ad} silinsin mi?"),
                                    action: SnackBarAction(label: "Evet", onPressed: (){setState(() {
                                      sil(kisi.kisi_id);
                                    });}),
                                )
                              );
                            }, icon:const Icon(Icons.clear, color: Colors.black54,))
                          ],
                        ),
                      ),
                    ),
                  );

                });
          }else{
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const KayitSayfa()))
            .then((value) {
              //Anasayfaya dönüldüğünde, tekrar kişileri yükle!
            });
          
      }),
    );
  }
  
  Future<void> ara(String kelime) async{
    print(kelime);
  }
  Future<List<Kisiler>> kisileriYukle() async{
    var kisilerListesi=<Kisiler> [];
    var k1=Kisiler(kisi_id: 1, kisi_ad: "ali", kisi_tel: "1111");
    var k2=Kisiler(kisi_id: 2, kisi_ad: "veli", kisi_tel: "2222");
    var k3=Kisiler(kisi_id: 3, kisi_ad: "deli", kisi_tel: "4444");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  Future<void> sil(int kisi_id) async {
    print(kisi_id);
  }
  
  
  
  
}
