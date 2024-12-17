import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/data/repo/filmler_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>>{
  AnasayfaCubit():super(<Filmler>[]);
  var frepo=FilmlerRepository();

  Future<void> filmleriYukle() async {
    var liste=await frepo.filmleriYukle();
    emit(liste);
  }


}