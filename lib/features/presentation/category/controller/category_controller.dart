import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_getx/features/domain/entities/news_category_entity.dart';
import 'package:news_getx/features/domain/usecase/get_news_category.dart';

class CategoryController extends GetxController {
  final GetNewsCategory getNewsCategory;
  CategoryController(this.getNewsCategory);

  var data = <NewsCategoryEntity>[].obs;
  var loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final data = Get.parameters['category'];
    log("get data: $data");
    fetchNewsCategory(data!);
  }

  void fetchNewsCategory(String query) async {
    loading(true);
    final request = await getNewsCategory.execute(query);
    request.fold((l) {
      loading(false);
      data([]);
    }, (r) {
      loading(false);
      data(r);
    });
  }
}
