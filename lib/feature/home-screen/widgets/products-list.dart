import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/feature/home-screen/widgets/product-cart.dart';
import 'package:vorstu/model/product.dart';
import 'package:vorstu/service/customer-service.dart';
import 'package:vorstu/widgets/button.dart';

class ProductList extends StatefulWidget{
  final int groupId;
  ProductList({super.key, required this.groupId});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late List<Product> products;

  final CustomerService customerService = CustomerService();

  @override
  void didChangeDependencies() {
    customerService.getProductsByGroupId(widget.groupId)
        .then((response) => products = response);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 32),
      itemCount: products.length != null ? products.length : 0,
      itemBuilder: (context, index) => Align(
          alignment: Alignment.center,
          child: ProductCart(
            product: products.elementAt(index),
          ),
      ),
      separatorBuilder: (context, index) =>
          Divider(height: 5, color: Colors.black, indent: 20, endIndent: 20)
    );
  }
}