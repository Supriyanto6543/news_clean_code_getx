import 'package:flutter/cupertino.dart';

extension ListExtension on int {
  toList({int length = 1, NullableIndexedWidgetBuilder? builder}) =>
      ListView.builder(
        itemCount: length,
        itemBuilder: builder!,
      );

  toGrid({List<Widget>? children}) => GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(4.0),
        childAspectRatio: 9.0 / 7.0,
        children: children!,
      );
}
