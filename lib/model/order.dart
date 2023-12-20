
import 'package:vorstu/model/product.dart';

import '../feature/order-screen/widgets/order-item.dart';
import 'order-item.dart';

class Order {
  final int id;
  final String comment;
  final List<OrderItem> items;
  final String status;

  Order({
    this.id = 0,
    this.comment = '',
    required this.items,
    this.status = '',
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'comment': String comment,
      'items': List<OrderItem> items,
      'status' : String status
      } =>
          Order(
            id : id,
            comment : comment,
            items : items,
            status : status
          ),
      _ => throw const FormatException('Failed to load order-item'),
    };
  }
}