import 'package:dartz/dartz.dart';
import 'package:news_getx/common/failure.dart';
import 'package:news_getx/features/domain/entities/news_entity.dart';
import 'package:news_getx/features/domain/repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;
  GetNews(this.repository);
  Future<Either<Failure, List<NewsEntity>>> execute(String query) {
    return repository.getNews(query);
  }
}
