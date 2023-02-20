import 'package:dartz/dartz.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/strings/failures.dart';
import '../entities/post_entity.dart';

class GetAllPostsUsecase{
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure,List<PostEntity>>> call() async {
    return await repository.getAllPosts();
  }
}

 