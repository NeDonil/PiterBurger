
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/model/order-item.dart';
import 'package:vorstu/service/customer-service.dart';

class OrderItemWidget extends StatefulWidget{
  var orderItem;
  var orderItemIdx;

  OrderItemWidget({super.key, required this.orderItem, required this.orderItemIdx});

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState(orderItem: orderItem, orderItemIdx: orderItemIdx);
}

class _OrderItemWidgetState extends State<OrderItemWidget>{
  final OrderItem orderItem;
  final int orderItemIdx;

  _OrderItemWidgetState({required this.orderItem, required this.orderItemIdx});

  _onPlusButtonPressed(){
    setState(() {
      orderItem.count++;
    });
    super.didUpdateWidget(widget);
  }

  _onMinusButtonPressed(){
    setState(() {
      orderItem.count--;
    });
    super.didUpdateWidget(widget);
  }

  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Row(
                children: [
                  Image(
                    image: NetworkImage(orderItem.product.photo),
                    width: 100,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    constraints: BoxConstraints(minWidth: 100, maxWidth: MediaQuery.of(context).size.width * 0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            orderItem.product.name,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 20, fontFamily: 'lora', fontWeight: FontWeight.bold)
                        ),
                        SizedBox(height: 15),
                        Text(
                            orderItem.count.toString() + " x " + orderItem.product.price.toString() +  " руб",
                            style: TextStyle(fontSize: 16, fontFamily: 'lora', fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children:[
                  IconButton(onPressed: _onPlusButtonPressed, icon: Icon(Icons.add, color: Color.fromRGBO(255, 227, 202, 1.0))),
                  Text(orderItem.count.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: _onMinusButtonPressed, icon: Icon(Icons.remove, color: Color.fromRGBO(255, 227, 202, 1.0),))
                ]
              )
            ]
        )
    );
  }
}