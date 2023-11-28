import 'package:bukatokoid/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> category = [];
  SliderModel sliderModel = SliderModel();

  sliderModel.name = "Men's Clothes";
  sliderModel.image = "assets/images/men_example.jpg";
  category.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "Women's Clothes";
  sliderModel.image = "assets/images/women_example.jpg";
  category.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "Jewelry";
  sliderModel.image = "assets/images/jewelry_example.jpg";
  category.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "Electronic";
  sliderModel.image = "assets/images/electronic_example.jpg";
  category.add(sliderModel);
  sliderModel = SliderModel();

  return category;
}
