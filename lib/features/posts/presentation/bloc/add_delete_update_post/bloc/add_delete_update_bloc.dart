import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/strings/failures.dart';
import 'package:posts_app/core/strings/messages.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post.dart';

import '../../../../../../core/strings/strings_failures.dart';

part 'add_delete_update_event.dart';
part 'add_delete_update_state.dart';

class AddDeleteUpdateBloc
    extends Bloc<AddDeleteUpdateEvent, AddDeleteUpdateState> {
  final AddPostUseCase addPost;
  final DeletePostUseCase deletePost;
  final UpdatePostUseCase updatePost;

  AddDeleteUpdateBloc(
      {required this.addPost,
      required this.deletePost,
      required this.updatePost})
      : super(AddDeleteUpdateInitial()) {
    on<AddDeleteUpdateEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdateState());
        final failureOrDoneMessage = await updatePost(event.postEntity);
        // failureOrDoneMessage.fold(
        //     (failure) => {
        //           emit(ErrorAddDeleteUpdateState(
        //               message: _mapFailureToMessage(failure)))
        //         },
        //     (_) => {
        //           emit(const MessageAddDeleteUpdateState(
        //               message: ADD_SUCCESS_MESSAGE))
        //         });
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdateState());
        final failureOrDoneMessage = await addPost(event.postEntity);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE));
        // failureOrDoneMessage.fold(
        //     (failure) => {
        //           emit(ErrorAddDeleteUpdateState(
        //               message: _mapFailureToMessage(failure)))
        //         },
        //     (_) => {
        //           emit(const MessageAddDeleteUpdateState(
        //               message: UPDATE_SUCCESS_MESSAGE))
        //         });
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdateState());
        final failureOrDoneMessage = await deletePost(event.postId);
        // failureOrDoneMessage.fold(
        //     (failure) => {
        //           emit(ErrorAddDeleteUpdateState(
        //               message: _mapFailureToMessage(failure)))
        //         },
        //     (_) => {
        //       emit(const MessageAddDeleteUpdateState(message: DELETE_SUCCESS_MESSAGE))
        //     });
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, DELETE_SUCCESS_MESSAGE));
      }
    });
  }
}

AddDeleteUpdateState _eitherDoneMessageOrErrorState(
    Either<Failure, Unit> either, String message) {
  return either.fold(
    (failure) => ErrorAddDeleteUpdateState(
      message: _mapFailureToMessage(failure),
    ),
    (_) => MessageAddDeleteUpdateState(message: message),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
