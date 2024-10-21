import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_quran_app/Models/SurahListModel.dart';
import 'package:test_quran_app/utils/ApiService.dart';


part 'surah_list_state.dart';

class SurahListCubit extends Cubit<SurahListState> {
  SurahListCubit() : super(SurahListInitial());
  static SurahListCubit get(context)=> BlocProvider.of(context);
  SurahListModel? surahListModel;
  Future getSurahList() async {
    emit(SurahListDataLoading());
    try {
      var data = await ApiService.get(endPoints: "/surah");
      print(data.data);

      var resuilt = await DioHelper.getData(
        url: "/surah",
      );
      if(resuilt.statusCode==200){
      surahListModel=SurahListModel.fromJson(data.data);
      print(resuilt.data);
      emit(SurahListDataSuccess());
      }else{
        emit(SurahListDataFailed());
      }

    }catch(e){
      emit(SurahListDataFailed());
    }

  }

}
