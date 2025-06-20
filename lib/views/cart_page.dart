import 'package:flutter/material.dart';
import 'package:new_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page'), centerTitle: true),
      body: Consumer<CartProvider>(
        builder:
            (BuildContext context, CartProvider cartProvider, Widget? child) {
              return cartProvider.cartItems.isEmpty
                  ? SizedBox(
                      height: 700,
                      child: Center(
                        child: Text(
                          'No Items added yet',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartProvider.cartItems[index];

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem.itemName,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Quantity: ${cartItem.itemQuantity}",
                                        ),
                                        Text(
                                          "Total Price:  ${cartItem.totalPrice}",
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        // cartProvider.removeCartItems(cartItem);
                                        context.read<CartProvider>().removeCartItems(cartItem);
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
                        },
                      ),
                    );
            },
      ),
    );
  }
}
