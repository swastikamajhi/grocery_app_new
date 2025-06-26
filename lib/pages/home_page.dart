import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            Container(
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
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
