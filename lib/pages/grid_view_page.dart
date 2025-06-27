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
        filteredFruitList = FruitsContants.fruitList;
      });
    } else {
      setState(() {
        filteredFruitList = FruitsContants.fruitList.where((e) {
          return e.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              e.price.contains(searchQuery.toLowerCase());
        }).toList();
      });
    }
  }

  List<FruitModel> filteredFruitList = [];

 

  @override
  void initState() {
    filteredFruitList = FruitsContants.fruitList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

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
                        builder: (context) => FruitsDetailPage(fruit: fruit),
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
