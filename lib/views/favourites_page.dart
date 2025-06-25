import 'package:flutter/material.dart';
import 'package:new_app/providers/favourites_provider.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites Page'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: context.read<FavouritesProvider>().favouriteItems.isEmpty
          ? Center(child: Text('No favourite items added yet.'))
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: context
                  .read<FavouritesProvider>()
                  .favouriteItems
                  .length,
              itemBuilder: (context, index) {
                final item = context
                    .watch<FavouritesProvider>()
                    .favouriteItems[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],

                    borderRadius: BorderRadius.circular(20),
                    border: BoxBorder.all(color: Colors.white, width: 5),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 100,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
