import 'package:equatable/equatable.dart';

class NewsCategoryEntity extends Equatable {
  NewsCategoryEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, description, url, category, language, country];
}
