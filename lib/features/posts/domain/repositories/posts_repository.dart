import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/strings/failures.dart';
import '../entities/post_entity.dart';

abstract class PostsRepository {
  Future<Either<Failure,List<PostEntity>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int id);
  Future<Either<Failure,Unit>> updatePost(PostEntity postEntity);
  Future<Either<Failure,Unit>> addPost(PostEntity postEntity);
}

//<Failure,List<Post>>
//we added dartz to get functionnal programming things 
//Unit hiya presque kima void maaneha manich bech nraaja chay ema nhotouha fi blasset l void bech najmou naamlou return 