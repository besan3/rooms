import 'package:rooms/features/home/domain/entities/comment_entity.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
class GetPostCommentUseCase{
  final HomeRepository homeRepository;

  const GetPostCommentUseCase({
    required this.homeRepository,
  });
  Future<Either<Failure,Comment>>call(int post_id)async{
    return await homeRepository.getPostComments(post_id);

  }
}