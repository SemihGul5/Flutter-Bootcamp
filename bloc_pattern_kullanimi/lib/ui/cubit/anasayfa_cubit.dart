import 'package:bloc_pattern_kullanimi/data/repo/matematik_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int>{
  AnasayfaCubit():super(0);

  var repo=MatematikRepository();

  void toplama(String s1,String s2){
    emit(repo.toplama(s1, s2));
  }
  void carpma(String s1,String s2){
    emit(repo.carpma(s1, s2));
  }
}