import 'package:dartz/dartz.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/strings/failures.dart';

class AddPostUseCase {
  final PostsRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(PostEntity postEntity) async {
    return await repository.addPost(postEntity);
  }
}
