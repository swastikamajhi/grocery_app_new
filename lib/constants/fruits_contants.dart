import 'package:new_app/models/fruit_model.dart';

class FruitsContants {
  static const appleUrl = 'assets/fruits/apple.jpg';
  static const avocardoUrl = 'assets/fruits/avocardo.jpg';
  static const bananaUrl = 'assets/fruits/banana.jpg';
  static const coconutUrl = 'assets/fruits/cocnut.jpg';
  static const grapesUrl = 'assets/fruits/grapes.jpg';
  static const lichiUrl = 'assets/fruits/lichi.jpg';
  static const mangoUrl = 'assets/fruits/mango.jpg';
  static const strawberryUrl = 'assets/fruits/strawberry.jpg';
  static const watermelonUrl = 'assets/fruits/watermelon.jpg';

  //this is the fruit list
  static final fruitList = [
    FruitModel(name: 'Apple', price: '200', imageUrl: FruitsContants.appleUrl),
    FruitModel(name: 'Banana', price: '60', imageUrl: FruitsContants.bananaUrl),
    FruitModel(
      name: 'Coconut',
      price: '70',
      imageUrl: FruitsContants.coconutUrl,
    ),
    FruitModel(
      name: 'Watermelon',
      price: '300',
      imageUrl: FruitsContants.watermelonUrl,
    ),
    FruitModel(
      name: 'Strawberry',
      price: '500',
      imageUrl: FruitsContants.strawberryUrl,
    ),
    FruitModel(name: 'Grapes', price: '80', imageUrl: FruitsContants.grapesUrl),
    FruitModel(
      name: 'Avocardo',
      price: '1000',
      imageUrl: FruitsContants.avocardoUrl,
    ),
    FruitModel(name: 'Mango', price: '170', imageUrl: FruitsContants.mangoUrl),
    FruitModel(name: 'Lichi', price: '250', imageUrl: FruitsContants.lichiUrl),
  ];
}
