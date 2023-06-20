import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../modalclass/quotes_modalclass.dart';
part 'qutos_state.dart';

class QutosCubit extends Cubit<QutosState> {
  QutosCubit() : super(QuotsInitial());
  List<Quotes>quotes=[];
  Future<void>getquotes()async{
    print('obvudhvh');
    try{
      emit(QuotsLoading());
      final response = await http.get(Uri.parse('https://dummyjson.com/quotes/'));
      print('sss$response');
      final data=convert.jsonDecode(response.body);
      print('data$data');
      // Map<String,dynamic>
      List<dynamic>rr=data['quotes'];

      for(var elements in rr){
        print('nnn$rr');
        print('bv$elements');
        Quotes fal=Quotes.fromJson(elements);
        quotes.add(fal);
        emit(QuotsLoaded(quotes));
      }
      // if(data['todos']==true){
      //   print('load');
      //   emit(TodosLoaded(todo));
      // }else{
      //   emit(Todosfailed());
      // }
    }catch(e){
      emit(Quotsfailed());
      print('errror$e');
    }
  }
}
