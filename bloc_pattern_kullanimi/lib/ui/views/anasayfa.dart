import 'package:bloc_pattern_kullanimi/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tf1=TextEditingController();
  var tf2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Bloc Pattern"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //dinleme yapısı
              BlocBuilder<AnasayfaCubit,int>(
                  builder: (context,sonuc){
                    return Text(sonuc.toString(),style:const TextStyle(fontSize: 50),);
                  }

              ),

              TextField(controller: tf1,decoration: const InputDecoration(hintText: "Sayı 1"),),
              TextField(controller: tf2,decoration: const InputDecoration(hintText: "Sayı 2"),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    context.read<AnasayfaCubit>().toplama(tf1.text, tf2.text);
                  }, child: const Text("Topla")),
                  ElevatedButton(onPressed: (){
                    context.read<AnasayfaCubit>().carpma(tf1.text, tf2.text);
                  }, child: const Text("Çarp"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
