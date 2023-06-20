part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {
  @override
  List<Object>get  props=>[];
}
class TodosLoading extends TodosState {
  @override
  List<Object>get  props=>[];
}
class TodosLoaded extends TodosState {
  List<Todos>todos;
  TodosLoaded(this.todos);
  @override
  List<Object>get  props=>[todos];
}
class Todosfailed extends TodosState {
  @override
  List<Object>get  props=>[];
}
