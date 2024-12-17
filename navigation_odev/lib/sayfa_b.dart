import 'package:flutter/material.dart';
import 'package:navigation_odev/sayfa_y.dart';

class SayfaB extends StatefulWidget {
  const SayfaB({super.key});

  @override
  State<SayfaB> createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Sayfa B",style: TextStyle(fontSize: 30,color: Colors.white),),
            SizedBox(
                width: 250,height:150,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SayfaY()));
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
