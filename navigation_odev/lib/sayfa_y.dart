import 'package:flutter/material.dart';

class SayfaY extends StatefulWidget {
  const SayfaY({super.key});

  @override
  State<SayfaY> createState() => _SayfaYState();
}

class _SayfaYState extends State<SayfaY> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()=> geriTusu(context),
      child: const Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Center(
          child: Text("Sayfa Y",style: TextStyle(fontSize: 30,color: Colors.white),),
          ),
        ),
    );
  }

  Future<bool> geriTusu(BuildContext context) async{
     Navigator.of(context).popUntil((route) => route.isFirst);
     return false;
  }

}
