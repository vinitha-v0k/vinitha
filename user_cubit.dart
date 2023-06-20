import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../modalclass/users_modalclass.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  List<Users>user=[];
  Future<void>getusers(String index, String first, String madien, String phone, String email, String ip, String username, String password, )async{
    print('obvudhvh');
    try{
      emit(UserLoading());
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));
      print('sss$response');
      final data=convert.jsonDecode(response.body);
      print('data$data');

      List<dynamic>rr=data['users'];

      for(var elements in rr){
        print('nnn$rr');
        print('bv$elements');
        Users fal=Users.fromJson(elements);
        user.add(fal);
        emit(UserLoaded(user));
      }

    }catch(e){
      emit(Userfailed());
      print('errror$e');
    }
  }
}


