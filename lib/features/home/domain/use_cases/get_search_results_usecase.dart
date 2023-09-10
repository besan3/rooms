import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/entities/search_entity.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';

class GetSearchResultUseCase{
  final HomeRepository homeRepository;
  Future<Either<Failure,SearchEntity>>call(String key)async{
    return await homeRepository.getSearchResults(key);
}

  const GetSearchResultUseCase({
    required this.homeRepository,
  });
}