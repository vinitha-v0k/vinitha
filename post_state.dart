part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {
  @override
  List<Object>get  props=>[];
}
class PostLoading extends PostState {
  @override
  List<Object>get  props=>[];
}
class PostLoaded extends PostState {
  List<Posts>posts;
  PostLoaded(this.posts);
  @override
  List<Object>get  props=>[posts];
}
class Postfailed extends PostState {
  @override
  List<Object>get  props=>[];
}
