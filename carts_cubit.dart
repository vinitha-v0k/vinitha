import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import '../modalclass/carts_modalclass.dart';

part 'carts_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit() : super(CartsInitial());

  List<carts>cart=[];
  Future<void>getcarts()async{
    print('obvudhvh');
    try{
      emit(CartsLoading());
      final response = await http.get(Uri.parse('https://dummyjson.com/carts'));
      print('sss$response');
      final data=convert.jsonDecode(response.body);
      print('data$data');
      // Map<String,dynamic>
      List<dynamic>rr=data['carts'];

      for(var elements in rr){
        print('nnn$rr');
        print('bv$elements');
        carts fal=carts.fromJson(elements);
        cart.add(fal);
        emit(CartsLoaded(cart));
      }
      // if(data['todos']==true){
      //   print('load');
      //   emit(TodosLoaded(todo));
      // }else{
      //   emit(Todosfailed());
      // }
    }catch(e){
      emit(Cartsfailed());
      print('errror$e');
    }
  }
}
