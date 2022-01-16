import 'package:news_feed/models/catogory_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'assets/images/image1.jpg';
  category.add(categoryModel);
  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl = 'assets/images/image2.jpg';
  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'General';
  categoryModel.imageUrl = 'assets/images/image3.jpeg';
  category.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl = 'assets/images/image4.jpg';
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl = 'assets/images/image5.jpeg';
  category.add(categoryModel);

  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl = 'assets/images/image6.jpeg';
  category.add(categoryModel);

  //7
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl = 'assets/images/image7.jpeg';
  category.add(categoryModel);

  return category;
}
