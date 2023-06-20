import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../modalclass/comments_modalclass.dart';
part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());
  List<Comments>comments=[];
  Future<void>getcomments()async{
    print('obvudhvh');
    try{
      emit(CommentsLoading());
      final response = await http.get(Uri.parse('https://dummyjson.com/comments'));
      print('sss$response');
      final data=convert.jsonDecode(response.body);
      print('data$data');
      // Map<String,dynamic>
      List<dynamic>rr=data['comments'];

      for(var elements in rr){
        print('nnn$rr');
        print('bv$elements');
        Comments fal=Comments.fromJson(elements);
        comments.add(fal);
        emit(CommentsLoaded(comments));
      }
      // if(data['todos']==true){
      //   print('load');
      //   emit(TodosLoaded(todo));
      // }else{
      //   emit(Todosfailed());
      // }
    }catch(e){
      emit(Commentsfailed());
      print('errror$e');
    }
  }
}






