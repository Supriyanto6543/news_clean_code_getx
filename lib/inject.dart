import 'package:get_it/get_it.dart';
import 'package:news_getx/features/data/datasource/news_remote_data.dart';
import 'package:news_getx/features/data/repositories/news_repository_impl.dart';
import 'package:news_getx/features/domain/repositories/news_repository.dart';
import 'package:news_getx/features/domain/usecase/get_news.dart';
import 'package:news_getx/features/domain/usecase/get_news_category.dart';
import 'package:news_getx/features/presentation/category/controller/category_controller.dart';
import 'package:news_getx/features/presentation/news/controller/news_controller.dart';

final locator = GetIt.instance;

void init() {
  //getx state
  locator.registerFactory(() => CategoryController(locator()));
  locator.registerFactory(() => NewsController(locator()));

  //use case
  locator.registerFactory(() => GetNewsCategory(locator()));
  locator.registerFactory(() => GetNews(locator()));

  //data source
  locator.registerFactory(() => NewsRemoteDateImpl());

  //repo
  locator.registerFactory<NewsRepository>(() => NewsRepositoryImpl(locator()));
}
