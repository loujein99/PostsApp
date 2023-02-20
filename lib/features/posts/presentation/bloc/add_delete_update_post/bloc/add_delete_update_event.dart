part of 'add_delete_update_bloc.dart';

abstract class AddDeleteUpdateEvent extends Equatable {
  const AddDeleteUpdateEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdateEvent {
  final PostEntity postEntity;

  const AddPostEvent({required this.postEntity});

  @override
  List<Object> get props => [postEntity];
}

class UpdatePostEvent extends AddDeleteUpdateEvent {
  final PostEntity postEntity;

  const UpdatePostEvent({required this.postEntity});

  @override
  List<Object> get props => [postEntity];
}

class DeletePostEvent extends AddDeleteUpdateEvent {
  final int postId;

  const DeletePostEvent({required this.postId});
   @override
  List<Object> get props => [postId];

}
