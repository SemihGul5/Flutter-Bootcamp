import 'package:flutter/material.dart';
import 'package:navigation_odev/sayfa_a.dart';
import 'package:navigation_odev/sayfa_x.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Anasayfa",style: TextStyle(fontSize: 30),),
            SizedBox(
                width: 250,height:150,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SayfaA()));
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text("Git > A",style: TextStyle(fontSize: 20,color: Colors.white)))),
            SizedBox(
                width: 250,height: 150,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SayfaX()));
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text("Git > X",style: TextStyle(fontSize: 20,color: Colors.white)))),
          ],
        ),
      ),
    );
  }
}
