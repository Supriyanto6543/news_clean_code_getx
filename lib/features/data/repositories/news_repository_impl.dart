import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_getx/common/failure.dart';
import 'package:news_getx/features/data/datasource/news_remote_data.dart';
import 'package:news_getx/features/domain/entities/news_category_entity.dart';
import 'package:news_getx/features/domain/entities/news_entity.dart';
import 'package:news_getx/features/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDateImpl newsRemoteDateImpl;
  NewsRepositoryImpl(this.newsRemoteDateImpl);

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews(String query) async {
    // TODO: implement getNews
    try {
      final result = await newsRemoteDateImpl.getNews(query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsCategoryEntity>>> getNewsCategory(
      String query) async {
    // TODO: implement getNewsCategory
    try {
      final result = await newsRemoteDateImpl.getNewsCategory(query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }
}
