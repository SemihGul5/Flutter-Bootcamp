import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Job Detail", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white60,),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset("resimler/job_detail.png"),
            ),
          ),
          const Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
            children: [
              Column(children: [
                Text("\$500",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22)),
                Text("Sallary",style: TextStyle(color: Colors.grey,fontSize: 18)),
              ],),
              Column(children: [
                Text("75",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                Text("Applications",style: TextStyle(color: Colors.grey,fontSize: 18)),
              ],),
              Column(children: [
                Text("Remote",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                Text("Job Type",style: TextStyle(color: Colors.grey,fontSize: 18)),
              ],),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: MainPageButtons(buttonTitle:"About The Role"),
          ),
          MainPageButtons(buttonTitle:"Expertise Specifications"),
          MainPageButtons(buttonTitle:"Assignment Of Responsibilities")
        ],
      ) ,
      backgroundColor: Colors.white,
    );
  }
}
class MainPageButtons extends StatelessWidget {
  String buttonTitle;
  MainPageButtons({required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton(onPressed: (){},
            style: TextButton.styleFrom(backgroundColor: Colors.white60,side: BorderSide(color: Colors.grey,width: 1)),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(buttonTitle,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,),),
                Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,)
              ],
            ),),
      ),
    );
  }
}
