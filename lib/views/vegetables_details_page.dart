import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_app/models/cart_item_model.dart';
import 'package:new_app/models/vegetable_model.dart';
import 'package:new_app/providers/cart_provider.dart';
import 'package:new_app/providers/favourites_provider.dart';
import 'package:provider/provider.dart';

class VegetablesDetailsPage extends StatefulWidget {
  final VegetableModel vegetable;
  const VegetablesDetailsPage({super.key, required this.vegetable});

  @override
  State<VegetablesDetailsPage> createState() => _VegetablesDetailsPageState();
}

class _VegetablesDetailsPageState extends State<VegetablesDetailsPage> {
  int vegetableQuantity = 0;
  bool isFavourite = false;

  void toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
      if (isFavourite) {
        context.read<FavouritesProvider>().addFavouriteItems(
          widget.vegetable.name,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item added to favourites'),
            backgroundColor: Colors.blue,
            duration: Duration(milliseconds: 1000),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        context.read<FavouritesProvider>().removeFavouriteItem(
          widget.vegetable.name,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item removed from favourites'),
            backgroundColor: Colors.red,
            duration: Duration(milliseconds: 1000),

            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  void addVegetable() {
    setState(() {
      vegetableQuantity++;
    });
  }

  void removeVegetable() {
    setState(() {
      if (vegetableQuantity > 0) {
        vegetableQuantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vegetables Detail Page')),
      backgroundColor: Colors.grey[200],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                fit: BoxFit.cover,

                widget.vegetable.imageUrl,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs. ${widget.vegetable.price}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          visualDensity: VisualDensity.compact,
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: toggleFavourite,
                          icon: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      widget.vegetable.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Row(
                      spacing: 5,
                      children: [
                        RatingBar.builder(
                          itemSize: 22,
                          initialRating: 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {},
                        ),

                        Text(
                          '(89 Reviews)',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Vegetables are a delicious and healthy part of our daily diet. They come in many varieties, such as apples, bananas, oranges, grapes, and mangoes, each with its own unique flavor and nutrients. Most vegetables are rich in vitamins, especially vitamin C and fiber, which help keep our bodies strong and our digestion smooth.',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    // SizedBox(height: 20),
                    Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 7,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Quantity',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              padding: EdgeInsets.all(0),
                              visualDensity: VisualDensity.compact,
                              style: ButtonStyle(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: removeVegetable,
                              icon: Icon(Icons.remove),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                vegetableQuantity.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.all(0),
                              visualDensity: VisualDensity.compact,
                              style: ButtonStyle(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: addVegetable,
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              40,
                            ),
                            backgroundColor: Colors.green[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                          ),
                          onPressed: () {
                            final cartItem = CartItemModel(
                              itemName: widget.vegetable.name,
                              itemPrice: widget.vegetable.price,
                              itemQuantity: vegetableQuantity.toString(),
                              itemImageUrl: widget.vegetable.imageUrl,
                              totalPrice:
                                  (int.parse(widget.vegetable.price) *
                                          vegetableQuantity)
                                      .toString(),
                            );

                            context.read<CartProvider>().addCartItems(cartItem);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.inventory_2_outlined,
                                color: Colors.white,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
