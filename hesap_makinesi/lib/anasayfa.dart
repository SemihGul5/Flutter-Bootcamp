import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<String> sayilar=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hesap Makinesi"),backgroundColor: Colors.limeAccent,),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 32,top: 16,bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(sayilar.join(""),style: TextStyle(fontSize: 22),),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 90,height: 55,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          sayilar.add("7");
                        });
                      },
                      child: Text("7",style: TextStyle(fontSize: 20)))),
              SizedBox(
                  width: 90,height: 55,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          sayilar.add("8");
                        });
                      },
                      child: Text("8",style: TextStyle(fontSize: 20)))),
              SizedBox(
                  width: 90,height: 55,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          sayilar.add("9");
                        });
                      },
                      child: Text("9",style: TextStyle(fontSize: 20)))),
              SizedBox(
                  width: 90,height: 55,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          sayilar.clear();
                        });
                      },
                      child: Text("AC",style: TextStyle(fontSize: 20))))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            sayilar.add("4");
                          });
                        },
                        child: Text("4",style: TextStyle(fontSize: 20)))),
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            sayilar.add("5");
                          });
                        },
                        child: Text("5",style: TextStyle(fontSize: 20)))),
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            sayilar.add("6");
                          });
                        },
                        child: Text("6",style: TextStyle(fontSize: 20)))),
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            sayilar.add("+");
                          });
                        },
                        child: Text("+",style: TextStyle(fontSize: 20))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16,bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            sayilar.add("1");
                          });
                        },
                        child: Text("1",style: TextStyle(fontSize: 20)))),
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            sayilar.add("2");
                          });
                        },
                        child: Text("2",style: TextStyle(fontSize: 20)))),
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            sayilar.add("3");
                          });
                        },
                        child: Text("3",style: TextStyle(fontSize: 20)))),
                SizedBox(
                    width: 90,height: 55,
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            // Toplama işlemi
                            sayilar=sayilar.join("").split("+").where((e) => e.isNotEmpty).toList();
                            var toplam=0;
                            for(var s in sayilar){
                              toplam+=int.parse(s);
                            }
                            sayilar.clear();
                            sayilar.add(toplam.toString());

                          });
                        },
                        child: Text("=",style: TextStyle(fontSize: 20))))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 90,height: 55,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          sayilar.add("0");
                        });
                      },
                      child: Text("0",style: TextStyle(fontSize: 20))))
            ],
          ),
        ],
      ),
    );
  }
}


