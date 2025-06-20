class CartItemModel {
  final String itemName;
  final String itemPrice;
  final String itemQuantity;
  final String itemImageUrl;
  final String totalPrice; // itemPrice * itemQuantity

  CartItemModel({
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemImageUrl,
    required this.totalPrice,
  });
}
