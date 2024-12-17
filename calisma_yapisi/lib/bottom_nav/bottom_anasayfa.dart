import 'package:calisma_yapisi/bottom_nav/sayfa_bir.dart';
import 'package:calisma_yapisi/bottom_nav/sayfa_iki.dart';
import 'package:calisma_yapisi/bottom_nav/sayfa_uc.dart';
import 'package:flutter/material.dart';

class BottomAnasayfa extends StatefulWidget {
  const BottomAnasayfa({super.key});

  @override
  State<BottomAnasayfa> createState() => _BottomAnasayfaState();
}

class _BottomAnasayfaState extends State<BottomAnasayfa> {
  int secilenIndex=0;
  var sayfalar=[const SayfaBir(),const SaydaIki(),const SayfaUc()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation", style: TextStyle(color: Colors.white),),backgroundColor: Colors.blueAccent,),
      body: sayfalar[secilenIndex],
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.looks_one_outlined),label: "Bir"),
        BottomNavigationBarItem(icon: Icon(Icons.looks_two_outlined),label: "İki"),
        BottomNavigationBarItem(icon: Icon(Icons.looks_3_outlined),label: "Üç")
      ],
        currentIndex: secilenIndex,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        onTap: (i){
          setState(() {
            secilenIndex=i;
          });
        },
      ),
    );
  }
}
