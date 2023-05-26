import 'package:dartz/dartz.dart';
import 'package:news_getx/common/failure.dart';
import 'package:news_getx/features/domain/entities/news_category_entity.dart';
import 'package:news_getx/features/domain/repositories/news_repository.dart';

class GetNewsCategory {
  final NewsRepository repository;
  GetNewsCategory(this.repository);
  Future<Either<Failure, List<NewsCategoryEntity>>> execute(String query) {
    return repository.getNewsCategory(query);
  }
}
