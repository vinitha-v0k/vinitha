part of 'qutos_cubit.dart';

@immutable
abstract class QutosState {}

class QuotsInitial extends QutosState {
  @override
  List<Object>get  props=>[];
}
class QuotsLoading extends QutosState {
  @override
  List<Object>get  props=>[];
}
class QuotsLoaded extends QutosState {
  List<Quotes>quotes;
  QuotsLoaded(this.quotes);
  @override
  List<Object>get  props=>[quotes];
}
class Quotsfailed extends QutosState {
  @override
  List<Object>get  props=>[];
}
