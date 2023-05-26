import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_getx/extension/news_extension.dart';
import 'package:news_getx/features/presentation/category/controller/category_controller.dart';
import 'package:news_getx/routes/router_name.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  final category = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category News'),
      ),
      body: Obx(() => category.loading.value
          ? Center(child: CircularProgressIndicator())
          : 0.toList(
              length: category.data.length,
              builder: (_, i) {
                var model = category.data[i];
                if (category.data.isNotEmpty) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.news,
                          parameters: {'sources': model.id});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.sp),
                      margin: EdgeInsets.symmetric(
                          horizontal: 6.sp, vertical: 8.sp),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          model.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.sp),
                          child: Text(model.description),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Belum ada category berita'),
                  );
                }
              })),
    );
  }
}
