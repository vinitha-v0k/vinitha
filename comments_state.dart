part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {
  @override
  List<Object>get  props=>[];
}
class CommentsLoading extends CommentsState {
  @override
  List<Object>get  props=>[];
}
class CommentsLoaded extends CommentsState {
  List<Comments>comments;
  CommentsLoaded(this.comments);
  @override
  List<Object>get  props=>[comments];
}
class Commentsfailed extends CommentsState {
  @override
  List<Object>get  props=>[];
}
