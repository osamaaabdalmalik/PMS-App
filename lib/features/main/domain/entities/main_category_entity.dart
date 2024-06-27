import 'package:pms_app/features/main/domain/entities/sub_category_entity.dart';

class MainCategory {
  final int id;
  final String name;
  final String description;
  final String image;
  final List<SubCategory> subCategories;

  const MainCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.subCategories,
  });
}
