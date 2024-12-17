import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRepository{

  var collectionKisiler = FirebaseFirestore.instance.collection("Kisiler");

  Future<void> kaydet(String kisi_ad,String kisi_tel) async{
    var kisi=HashMap<String,dynamic>();
    kisi["kisi_id"]="";
    kisi["kisi_ad"]=kisi_ad;
    kisi["kisi_tel"]=kisi_tel;
    collectionKisiler.add(kisi);
  }
  Future<void> guncelle(String kisi_id,String kisi_ad,String kisi_tel) async{
    var kisi=HashMap<String,dynamic>();
    kisi["kisi_ad"]=kisi_ad;
    kisi["kisi_tel"]=kisi_tel;
    collectionKisiler.doc(kisi_id).update(kisi);
  }

  Future<void> sil(String kisi_id) async {
    collectionKisiler.doc(kisi_id).delete();
  }
}