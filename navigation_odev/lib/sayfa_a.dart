import 'package:flutter/material.dart';
import 'package:navigation_odev/sayfa_b.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Sayfa A",style: TextStyle(fontSize: 30),),
            SizedBox(
                width: 250,height:150,
                child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SayfaB()));
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text("Git > B",style: TextStyle(fontSize: 20,color: Colors.white)))),
          ],
        ),
      ),
    );
  }
}
