import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_app/models/cart_item_model.dart';

class CartPage extends StatelessWidget {
  final List<CartItemModel> cartItems;
  final Function(CartItemModel cartItemModel) removeCartItem;
  const CartPage({
    super.key,
    required this.cartItems,
    required this.removeCartItem,
  });

  @override
  Widget build(BuildContext context) {
    if (cartItems.isNotEmpty) {
      log(cartItems[0].itemName);
    }
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page'), centerTitle: true),
      body: SizedBox(
        height: 700,
        child: cartItems.isEmpty
            ? Center(
                child: Text(
                  'No Items added yet',
                  style: TextStyle(fontSize: 20),
                ),
              )
            : SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];

                    return Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            spacing: 20,
                            children: [
                              Image.asset(
                                cartItem.itemImageUrl,
                                height: 50,
                                width: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.itemName,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text("Quantity: ${cartItem.itemQuantity}"),
                                  Text("Total Price:  ${cartItem.totalPrice}"),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  removeCartItem(cartItem);
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );

                    // return ListTile(

                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadiusGeometry.circular(20),
                    //   ),
                    //   leading: Image.asset(
                    //     cartItem.itemImageUrl,
                    //     height: 50,
                    //     width: 50,
                    //   ),
                    //   title: Text(cartItem.itemName),
                    //   subtitle: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text('heelo'),
                    //       Text(cartItem.itemQuantity),
                    //       Text(cartItem.totalPrice),
                    //     ],
                    //   ),
                    // );
                  },
                ),
              ),
      ),
    );
  }
}
