import 'package:flutter/material.dart';
import 'package:new_app/constants/fruits_contants.dart';
import 'package:new_app/models/fruit_model.dart';
import 'package:new_app/views/fruits_detail_page.dart';
import 'package:new_app/widgets/search_bar_widget.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  void searchFruit(String searchQuery) {
    if (searchQuery == '') {
      setState(() {
        filteredFruitList = fruitList;
      });
    } else {
      setState(() {
        filteredFruitList = fruitList.where((e) {
          return e.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              e.price.contains(searchQuery.toLowerCase());
        }).toList();
      });
    }
  }

  List<FruitModel> filteredFruitList = [];

  final fruitList = [
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

  @override
  void initState() {
    filteredFruitList = fruitList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View Page'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SearchBarWidget(
              onSearch: (String searchQuery) {
                searchFruit(searchQuery);
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
                crossAxisCount: 3,
                childAspectRatio: 8 / 9,
              ),
              padding: EdgeInsets.all(20),
              itemCount: filteredFruitList.length,

              itemBuilder: (context, index) {
                final fruit = filteredFruitList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FruitsDetailPage(
                          fruit: fruit,
                         
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(fruit.imageUrl, height: 50, width: 50),
                        FittedBox(
                          child: Text(
                            fruit.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          "Rs. ${fruit.price}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
