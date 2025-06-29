import 'package:new_app/models/vegetable_model.dart';

class VegetableConstants {
  static const broccoliUrl = 'assets/vegetables/broccoli.png';
  static const cabbageUrl = 'assets/vegetables/cabbage.png';
  static const carrotUrl = 'assets/vegetables/carrot.png';
  static const eggplantUrl = 'assets/vegetables/eggplant.png';
  static const mushroomUrl = 'assets/vegetables/mushroom.png';
  static const peaUrl = 'assets/vegetables/pea.png';
  static const potatoUrl = 'assets/vegetables/potato.png';
  static const pumpkinUrl = 'assets/vegetables/pumpkin.png';
  static const saladUrl = 'assets/vegetables/salad.png';

  //this is the fruit list
  static final vegetableList = [
    VegetableModel(
      name: 'Broccoli',
      price: '200',
      imageUrl: VegetableConstants.broccoliUrl,
    ),
    VegetableModel(
      name: 'Cabbage',
      price: '60',
      imageUrl: VegetableConstants.cabbageUrl,
    ),
    VegetableModel(
      name: 'Carrot',
      price: '70',
      imageUrl: VegetableConstants.carrotUrl,
    ),
    VegetableModel(
      name: 'Eggplant',
      price: '300',
      imageUrl: VegetableConstants.eggplantUrl,
    ),
    VegetableModel(
      name: 'Mushroom',
      price: '500',
      imageUrl: VegetableConstants.mushroomUrl,
    ),
    VegetableModel(
      name: 'salad',
      price: '80',
      imageUrl: VegetableConstants.saladUrl,
    ),
    VegetableModel(
      name: 'Pea',
      price: '1000',
      imageUrl: VegetableConstants.peaUrl,
    ),
    VegetableModel(
      name: 'Potato',
      price: '170',
      imageUrl: VegetableConstants.potatoUrl,
    ),
    VegetableModel(
      name: 'Pumpkin',
      price: '250',
      imageUrl: VegetableConstants.pumpkinUrl,
    ),
  ];
}
