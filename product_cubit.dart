import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../modalclass/products_modalclass.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  List<products>product=[];
  Future<void>getproducts()async{
    print('obvudhvh');
    try{
      emit(ProductLoading());
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      print('sss$response');
      final data=convert.jsonDecode(response.body);
      print('data$data');
      // Map<String,dynamic>
      List<dynamic>rr=data['products'];

      for(var elements in rr){
        print('nnn$rr');
        print('bv$elements');
        products fal=products.fromJson(elements);
        product.add(fal);
        emit(ProductLoaded(product));
      }
      // if(data['todos']==true){
      //   print('load');
      //   emit(TodosLoaded(todo));
      // }else{
      //   emit(Todosfailed());
      // }
    }catch(e){
      emit(Productfailed());
      print('errror$e');
    }
  }
}
