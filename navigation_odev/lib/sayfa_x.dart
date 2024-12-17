import 'package:flutter/material.dart';
import 'package:navigation_odev/sayfa_y.dart';

class SayfaX extends StatefulWidget {
  const SayfaX({super.key});

  @override
  State<SayfaX> createState() => _SayfaXState();
}

class _SayfaXState extends State<SayfaX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Sayfa X",style: TextStyle(fontSize: 30,color: Colors.white),),
            SizedBox(
                width: 250,height:150,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SayfaY()));
                },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: const Text("Git > Y",style: TextStyle(fontSize: 20,color: Colors.white)),
                )),
          ],
        ),
      ),
    );
  }
}
