import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/service/customer-service.dart';

import 'order-item.dart';

class OrderList extends StatefulWidget{
  OrderList({super.key});

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final CustomerService customerService = CustomerService();
  final order = CustomerService.order;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 32),
        itemCount: order.items.length,
        itemBuilder: (context, index) => Align(
          alignment: Alignment.center,
          child: OrderItemWidget(
            orderItem: order.items[index],
            orderItemIdx: index
          ),
        ),
        separatorBuilder: (context, index) =>
            Divider(height: 5, color: Colors.black, indent: 20, endIndent: 20)
    );
  }
}