
import 'package:flutter/cupertino.dart';
import 'package:vorstu/model/order-item.dart';

class OrderItemWidget extends StatelessWidget{
  final OrderItem orderItem;
  final int orderItemIdx;

  OrderItemWidget({required this.orderItem, required this.orderItemIdx});

  @override
  Widget build(BuildContext context){
    return Text("Order item");
  }
}