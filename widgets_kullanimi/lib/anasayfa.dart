import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController=TextEditingController();
  var text="";
  var resimAdi="kofte.png";
  var switchKontrol=false;
  var checkboxKontrol=false;
  var radioDeger=0;
  var progressbarKontrol=false;
  var slider=30.0;
  var tfSaat=TextEditingController();
  var tfTarih=TextEditingController();
  var ulkeler=<String>[];
  var secilenUlke="Türkiye";

  @override
  void initState() {
    ulkeler.add("Türkiye");
    ulkeler.add("Japonya");
    ulkeler.add("İtalya");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widgets Kullanımı"),backgroundColor: Colors.amberAccent,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("${text}"),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                child: TextField(
                  controller: tfController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Şifre"),),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  text=tfController.text;
                });
              }, child: Text("Veriyi Al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi="kofte.png";
                    });
                  }, child: Text("Resim 1")),
                  SizedBox(
                      width: 60,height: 60,
                      child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),
                      //Image.asset("resimler/${resimAdi}")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi="ayran.png";
                    });
                  }, child: Text("Resim 2")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: SwitchListTile(
                        value: switchKontrol,
                        title: Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (veri){
                          setState(() {
                            switchKontrol=veri;
                          });
                        }
                    ),
                  ),
                  SizedBox(width: 200,
                    child: CheckboxListTile(
                        value: checkboxKontrol,
                        title: Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (veri){
                          setState(() {
                            checkboxKontrol=veri!;
                          });
                    }),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: RadioListTile(
                        value: 1,
                        groupValue: radioDeger,
                        title: Text("Barcelona"),
                        onChanged: (veri){
                          setState(() {
                            radioDeger=veri!;
                          });
                        }),
                  ),
                  SizedBox(width: 200,
                    child: RadioListTile(
                        value: 2,
                        groupValue: radioDeger,
                        title: Text("Real Madrid"),
                        onChanged: (veri){
                          setState(() {
                            radioDeger=veri!;
                          });
                        }),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressbarKontrol=true;
                    });
                  }, child: Text("Göster")),

                  Visibility(
                      visible: progressbarKontrol,
                      child: CircularProgressIndicator()),

                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressbarKontrol=false;
                    });
                  }, child: Text("Gizle"))
                ],
              ),
              Text(slider.toInt().toString()),
              Slider(
                  max: 100.0,
                  min:0.0,
                  value: slider,
                  onChanged: (veri){
                    setState(() {
                      slider=veri;
                    });
                  }),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 120, child: TextField(controller: tfSaat,decoration: InputDecoration(hintText: "Saat"),)),
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((value) {
                      tfSaat.text="${value!.hour} : ${value.minute}";
                    });
                  }, icon: Icon(Icons.access_time)),
                  SizedBox(width: 120, child: TextField(controller: tfTarih,decoration: InputDecoration(hintText: "Tarih"),)),
                  IconButton(onPressed: (){
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025)
                    ).then((value) =>
                      tfTarih.text="${value!.day}/${value.month}/${value.year}"
                    );
                  }, icon: Icon(Icons.date_range)),
                ],
              ),
              DropdownButton(
                  value: secilenUlke,
                  icon: Icon(Icons.arrow_drop_down),
                  items:ulkeler.map((e) {
                    return DropdownMenuItem(child: Text(e),value: e);
                  }).toList(),
                  onChanged: (veri){
                    setState(() {
                      secilenUlke=veri!;
                    });

              }),
              GestureDetector(
                  onTap: (){
                    print("Tek tıklandı");
                  },
                  onDoubleTap: (){
                    print("çift tıklandı");
                  },
                  onLongPress: (){
                    print("uzun basıldı");
                  },
                  child: Container(width: 300,height: 500,color: Colors.redAccent,)),

              ElevatedButton(onPressed: (){
                print("Switch durum: $switchKontrol");
                print("Checkbox durum: $checkboxKontrol");
                print("RadioButton durum: $radioDeger");
                print("Slider durum: $slider");
                print("Ülke durum: $secilenUlke");
              }, child: Text("Göster"))
            ],
          ),
        ),
      ),
    );
  }
}
