import 'package:get/get.dart';
import 'package:news_getx/features/domain/entities/news_entity.dart';
import 'package:news_getx/features/domain/usecase/get_news.dart';

class NewsController extends GetxController {
  final GetNews getNews;
  NewsController(this.getNews);

  var data = <NewsEntity>[].obs;
  var loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    final data = Get.parameters['sources'];
    print("get data: $data");
    super.onInit();
    fetchNews(data!);
  }

  void fetchNews(String query) async {
    loading(true);
    final request = await getNews.execute(query);
    request.fold((l) {
      loading(false);
      data([]);
    }, (r) {
      loading(false);
      data(r);
    });
  }
}
