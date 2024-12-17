import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRepository{

  Future<void> kaydet(String kisi_ad,String kisi_tel) async{
    print(kisi_ad+" - "+kisi_tel);
  }
  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    print("$kisi_id - $kisi_ad - $kisi_tel");
  }
  Future<List<Kisiler>> kisileriYukle() async{
    var kisilerListesi=<Kisiler> [];
    var k1=Kisiler(kisi_id: 1, kisi_ad: "ali", kisi_tel: "1111");
    var k2=Kisiler(kisi_id: 2, kisi_ad: "veli", kisi_tel: "2222");
    var k3=Kisiler(kisi_id: 3, kisi_ad: "deli", kisi_tel: "4444");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }
  Future<List<Kisiler>> ara(String kelime) async{
    var kisilerListesi=<Kisiler> [];
    var k1=Kisiler(kisi_id: 1, kisi_ad: "ali", kisi_tel: "1111");
    kisilerListesi.add(k1);
    return kisilerListesi;
  }

  Future<void> sil(int kisi_id) async {
    print(kisi_id);
  }
}