import 'package:flutter/material.dart';
import 'package:new_app/constants/fruits_contants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _fruitsBanner() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xffd6eedb),
        borderRadius: BorderRadius.circular(20),
      ),

      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fresh Fruits',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upto ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 5,
                    children: [
                      Text(
                        '20',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '%',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Image.asset(
                'assets/banner/fruit_icon.png',
                height: 100,
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //0xffd6eedb
      appBar: AppBar(title: Text('Home Page'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _fruitsBanner(),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Fresh Fruits',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.orange[700],
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: FruitsContants.fruitList.length,
                itemBuilder: (context, index) {
                  final fruit = FruitsContants.fruitList[index];

                  return Container(
                    height: 120,
                    width: 120,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 25),
                    decoration: BoxDecoration(
                      color: Color(0xffd6f7fc),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(fruit.imageUrl, height: 80, width: 80),
                        Text(
                          fruit.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Rs. ${fruit.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
