import 'package:consultations_app/features/main/data/models/main_category_model.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.mainCategories,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      mainCategories: json['categories']
          .map<MainCategoryModel>(
            (item) => MainCategoryModel.fromJson(item),
          )
          .toList(),
    );
  }
}
