part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {
  @override
  List<Object>get  props=>[];
}
class ProductLoading extends ProductState {
  @override
  List<Object>get  props=>[];
}
class ProductLoaded extends ProductState {
  List<products>product;
  ProductLoaded(this.product);
  @override
  List<Object>get  props=>[product];
}
class Productfailed extends ProductState {
  @override
  List<Object>get  props=>[];
}
