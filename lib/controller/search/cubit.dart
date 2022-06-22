import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/search/states.dart';
import 'package:iiii/controller/service/constant.dart';
import 'package:iiii/controller/service/dio_hellper.dart';
import 'package:iiii/model/end_point.dart';
import 'package:iiii/model/search/search_model.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());
  static SearchCubit  get(context)=>BlocProvider.of(context);

  SearchModel? model;
  void Search( String? Text){
    emit(SearchLodingState());
    DioHelper.postDataAPI(
      url: SEARCH,
      data: {
        'text':Text,
      },
      token: token,
    ).then((value) {
      model=SearchModel.Fromjson(value.data);
      emit(SearchSucssesState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}