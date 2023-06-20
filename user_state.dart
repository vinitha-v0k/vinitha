part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {

}
class UserLoading extends UserState {
  @override
  List<Object>get  props=>[];
}
class UserLoaded extends UserState {
  List<Users>user;
  UserLoaded(this.user);
  @override
  List<Object>get  props=>[user];
}
class Userfailed extends UserState {
  @override
  List<Object>get  props=>[];
}
