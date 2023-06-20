import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../modalclass/post_modalclass.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  List<Posts>posts=[];
  Future<void>getpost()async{
    print('obvudhvh');
    try{
      emit(PostLoading());
      final response = await http.get(Uri.parse('https://dummyjson.com/posts'));
      print('sss$response');
      final data=convert.jsonDecode(response.body);
      print('data$data');
      // Map<String,dynamic>
      List<dynamic>rr=data['posts'];

      for(var elements in rr){
        print('nnn$rr');
        print('bv$elements');
        Posts fal=Posts.fromJson(elements);
        posts.add(fal);
        emit(PostLoaded(posts));
      }
      // if(data['todos']==true){
      //   print('load');
      //   emit(TodosLoaded(todo));
      // }else{
      //   emit(Todosfailed());
      // }
    }catch(e){
      emit(Postfailed());
      print('errror$e');
    }
  }
}
