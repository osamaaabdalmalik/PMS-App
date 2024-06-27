import 'package:pms_app/features/main/data/models/sub_category_model.dart';
import 'package:pms_app/features/main/domain/entities/main_category_entity.dart';

class MainCategoryModel extends MainCategory {
  const MainCategoryModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.subCategories,
  });

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      subCategories: json['sub_categories']
          .map<SubCategoryModel>(
            (item) => SubCategoryModel.fromJson(item),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
