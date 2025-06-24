class CartItem {
  String productId;
  String name;
  double price;
  String? imageUrl;
  int quantity;

  CartItem({
    required this.productId,
    required this.quantity,
    this.name = '',
    this.price = 0.00,
    this.imageUrl,
  });

  static CartItem empty() => CartItem(productId: '', quantity: 0);


}
