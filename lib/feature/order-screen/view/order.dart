

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/feature/order-screen/widgets/order-item-list.dart';
import 'package:vorstu/widgets/header.dart';

import '../../home-screen/widgets/groups-list.dart';

class OrderView extends StatefulWidget{
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(),
        body: OrderList(),
    );
  }
}