import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../modalclass/todos_modalclass.dart';
part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial());
  List<Todos>todo=[];
  Future<void>gettodos()async{
    print('obvudhvh');
    try{
      emit(TodosLoading());
      final response = await http.get(Uri.parse('https://dummyjson.com/todos/'));
      print('sss$response');
      final data=convert.jsonDecode(response.body);
      print('data$data');
      // Map<String,dynamic>
      List<dynamic>rr=data['todos'];

      for(var elements in rr){
        print('nnn$rr');
        print('bv$elements');
        Todos fal=Todos.fromJson(elements);
        todo.add(fal);
        emit(TodosLoaded(todo));
      }
      // if(data['todos']==true){
      //   print('load');
      //   emit(TodosLoaded(todo));
      // }else{
      //   emit(Todosfailed());
      // }
    }catch(e){
      emit(Todosfailed());
      print('errror$e');
    }
  }
}


