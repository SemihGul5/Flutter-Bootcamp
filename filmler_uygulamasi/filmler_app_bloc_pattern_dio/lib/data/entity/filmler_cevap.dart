import 'package:filmler_app/data/entity/filmler.dart';

class FilmlerCevap{
  List<Filmler> filmler;
  int success;

  FilmlerCevap({required this.filmler,required this.success});

  factory FilmlerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray=json["filmler"] as List;
    var success=json["success"] as int;

    var filmler=jsonArray.map((e) => Filmler.fromJson(e)).toList();

    return FilmlerCevap(filmler: filmler, success: success);
  }
}