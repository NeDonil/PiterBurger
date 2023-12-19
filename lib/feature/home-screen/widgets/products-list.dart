import 'package:flutter/cupertino.dart';
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
          child: Button(
            height: 60,
            width: 220,
            onPressed: () {},
            title: products.elementAt(index).name,
          )
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}