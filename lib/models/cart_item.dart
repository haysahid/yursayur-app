import 'package:pasar_sayur/models/product.dart';

class CartItemModel {
  final ProductModel product;
  final int quantity;
  final bool isSelected;

  const CartItemModel({
    required this.product,
    required this.quantity,
    required this.isSelected,
  });

  CartItemModel copyWith({int? quantity, bool? isSelected}) {
    return CartItemModel(
      product: product,
      quantity: quantity ?? this.quantity,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

final cartItems = [
  CartItemModel(product: productList[0], quantity: 2, isSelected: true),
  CartItemModel(product: productList[1], quantity: 1, isSelected: true),
  CartItemModel(product: productList[2], quantity: 4, isSelected: true),
  CartItemModel(product: productList[3], quantity: 2, isSelected: false),
];
