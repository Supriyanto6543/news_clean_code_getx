import 'package:dartz/dartz.dart';
import 'package:news_getx/common/failure.dart';
import 'package:news_getx/features/domain/entities/news_category_entity.dart';
import 'package:news_getx/features/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsCategoryEntity>>> getNewsCategory(
      String query);
  Future<Either<Failure, List<NewsEntity>>> getNews(String query);
}
