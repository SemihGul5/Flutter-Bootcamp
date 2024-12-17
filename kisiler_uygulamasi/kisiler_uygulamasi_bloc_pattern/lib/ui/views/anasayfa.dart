import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/cubit/anasayfa_cubit.dart';
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
  void initState() {// sayfa yüklendiği anda kişilerin yüklenmesi için
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu?//true ise ara text field gözükecek, aranan kelimeyi fonksyiona gönderilecek
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ) :
        const Text("Kişiler"),// yukarıdaki : ile false durumunda arama yapılmıyor o yüzden kişiler text gözükecek
        actions: [
          aramaYapiliyorMu? IconButton(onPressed: (){// true ise arama yapılıyordur, çıkmak için false yap
            setState(() {
              aramaYapiliyorMu=false;
            });
            context.read<AnasayfaCubit>().kisileriYukle();
          }, icon: const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu=true;
            });
          }, icon: const Icon(Icons.search))
        ],
      ),
      body:BlocBuilder<AnasayfaCubit,List<Kisiler>>(// future builder'ı bloc builder'a çeviriyoruz
        builder: (context,kisilerListesi){
          if(kisilerListesi.isNotEmpty){
            return ListView.builder(
                itemCount: kisilerListesi!.length,
                itemBuilder: (context,position){
                  var kisi=kisilerListesi[position];// listedeki pozisyonuna göre kişiyi aldık
                  return SizedBox(height: 100,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(kisi)))
                        .then((value) {
                          context.read<AnasayfaCubit>().kisileriYukle(); //detay sayfasından dönüldüğünde, tekrar kişileri yükle!
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
                                      context.read<AnasayfaCubit>().sil(kisi.kisi_id);
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
              context.read<AnasayfaCubit>().kisileriYukle(); //Anasayfaya dönüldüğünde, tekrar kişileri yükle!
            });
          
      }),
    );
  }

}
