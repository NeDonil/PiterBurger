

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/feature/order-screen/widgets/order-item-list.dart';
import 'package:vorstu/service/customer-service.dart';
import 'package:vorstu/widgets/button.dart';
import 'package:vorstu/widgets/header.dart';

import '../../home-screen/widgets/groups-list.dart';

class OrderView extends StatefulWidget{
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView>{

  int totalPrice = 0;
  @override
  void initState(){
    CustomerService.order.items.forEach((element) {
      totalPrice += element.count * element.product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(),
        body: OrderList(),
        floatingActionButton: Button(onPressed: (){
          setState(() {
            CustomerService.order.items.clear();
            totalPrice = 0;
          });
        }, title: "Заказать " + (totalPrice != 0 ? totalPrice.toString() + "₽": "")),
    );
  }
}