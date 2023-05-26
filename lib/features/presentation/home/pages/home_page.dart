import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_getx/extension/news_extension.dart';

import '../../../../routes/router_name.dart';
import '../../../data/model/category_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: CategoryModel.data.isNotEmpty
          ? 0.toGrid(
              children: CategoryModel.data.map((data) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.categoryNews,
                      parameters: {'category': data.title});
                },
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: data.image,
                              fit: BoxFit.cover,
                              height: 120.sp,
                              placeholder: (context, url) => Center(
                                child: SizedBox(
                                    height: 34.sp,
                                    width: 34.sp,
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            Container(
                              height: 120.sp,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            data.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
              );
            }).toList())
          : const CircularProgressIndicator(),
    );
  }
}
