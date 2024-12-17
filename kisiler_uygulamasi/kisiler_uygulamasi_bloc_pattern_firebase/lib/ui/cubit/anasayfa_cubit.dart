import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{
  AnasayfaCubit():super(<Kisiler>[]);
  var krepo=KisilerDaoRepository();
  var collectionKisiler = FirebaseFirestore.instance.collection("Kisiler");

  Future<void> kisileriYukle() async{// arayüze kişileri yükleyecek, dinleme yapısı olduğundan void olmalıdır.
    collectionKisiler.snapshots().listen((event) {
      var kisiler=<Kisiler>[];
      var docs=event.docs;
      for(var d in docs){
        var key=d.id;
        var data = d.data();
        var kisi=Kisiler.fromJson(data, key);
        kisiler.add(kisi);
      }
      emit(kisiler);
    });
  }
  Future<void> ara(String kelime) async{
    collectionKisiler.snapshots().listen((event) {
      var kisiler=<Kisiler>[];
      var docs=event.docs;
      for(var d in docs){
        var key=d.id;
        var data = d.data();
        var kisi=Kisiler.fromJson(data, key);
        if(kisi.kisi_ad.toLowerCase().contains(kelime.toLowerCase())){
          kisiler.add(kisi);
        }
      }
      emit(kisiler);
    });
  }
  Future<void> sil(String kisi_id) async {
    await krepo.sil(kisi_id);
  }
}