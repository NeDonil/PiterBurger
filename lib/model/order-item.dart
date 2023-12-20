import 'package:vorstu/model/product.dart';

class OrderItem {
  int count;
  final Product product;

  OrderItem({
    required this.count,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'count': int count,
      'product': Product product,
      } =>
          OrderItem(
            count: count,
            product: product,
          ),
      _ => throw const FormatException('Failed to load order-item'),
    };
  }
}