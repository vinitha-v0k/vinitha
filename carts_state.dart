part of 'carts_cubit.dart';

@immutable
abstract class CartsState {}

class CartsInitial extends CartsState {
  @override
  List<Object>get  props=>[];
}
class CartsLoading extends CartsState {
  @override
  List<Object>get  props=>[];
}
class CartsLoaded extends CartsState {
  List<carts>cart;
  CartsLoaded(this.cart);
  @override
  List<Object>get  props=>[carts];
}
class Cartsfailed extends CartsState {
  @override
  List<Object>get  props=>[];
}
