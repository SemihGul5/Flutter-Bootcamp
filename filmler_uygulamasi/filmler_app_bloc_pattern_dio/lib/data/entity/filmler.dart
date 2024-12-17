class Filmler{
  int id;
  String ad;
  String resim;
  int fiyat;

  Filmler({required this.id,required this.ad,required this.resim,required this.fiyat});

  factory Filmler.fromJson(Map<String,dynamic> json){
    return Filmler(id: json["id"], ad: json["ad"], resim: json["resim"], fiyat: json["fiyat"]);
  }
}