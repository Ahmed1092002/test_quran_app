import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_quran_app/Models/SurahDataModel.dart';
import 'package:test_quran_app/utils/ApiService.dart';

part 'get_surah_state.dart';

class GetSurahCubit extends Cubit<GetSurahState> {
  GetSurahCubit() : super(GetSurahInitial());

  static GetSurahCubit get(context) => BlocProvider.of(context);
  SurahDataModel? surahDataModel;
  Future getSurahData({required int id}) async{
    emit(GetSurahLoading());
    try{
      var result = await ApiService.get(endPoints: "/surah/$id/ar.alafasy");
      if (result.statusCode == 200) {
        surahDataModel = SurahDataModel.fromJson(result.data);
        emit(GetSurahSuccess(message: "Get Success"));
      }
      else{
        emit(GetSurahError(
          errorMessage: "erro"
        ));
      }
    }catch(e){
      emit(GetSurahError(
          errorMessage: e.toString()
      ));
    }

  }
  
}
