import 'package:flutter/material.dart';

class SayfaBir extends StatefulWidget {
  const SayfaBir({super.key});

  @override
  State<SayfaBir> createState() => _SayfaBirState();
}

class _SayfaBirState extends State<SayfaBir> {
  var tfControl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Silmek istiyor musunuz?"),
                action: SnackBarAction(label: "Evet", onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Silindi")));
                }),
              )
            );
          }, child: Text("Snackbar")),
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Silmek istiyor musunuz?",style: TextStyle(color: Colors.blueAccent),),
                  backgroundColor: Colors.white,
                  action: SnackBarAction(label: "Evet",textColor: Colors.redAccent, onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Silindi")));
                  }),
                )
            );
          }, child: Text("Snackbar - özel")),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Başlık"),
                content: Text("İçerik"),
                actions: [
                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text("İptal")),
                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Tamam"))
                ],
              );
            });
          }, child: Text("Alert")),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Başlık"),
                content: TextField(controller: tfControl,decoration: InputDecoration(hintText: "İsim"),),
                backgroundColor: Colors.white,
                actions: [
                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text("İptal")),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    tfControl.text="";
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${tfControl.text}")));
                    }, child: Text("Tamam"))
                ],
              );
            });
          }, child: Text("Alert - özel")),

        ],
      )
    );
  }
}
