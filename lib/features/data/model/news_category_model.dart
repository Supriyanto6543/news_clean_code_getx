import 'package:equatable/equatable.dart';

import '../../domain/entities/news_category_entity.dart';

class NewsCategoryModel extends Equatable {
  NewsCategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String url;
  late final String category;
  late final String language;
  late final String country;

  NewsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

  NewsCategoryEntity toEntity() => NewsCategoryEntity(
      id: id,
      name: name,
      description: description,
      url: url,
      category: category,
      language: language,
      country: country);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, description, url, category, language, country];
}
