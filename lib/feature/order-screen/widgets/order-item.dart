
import 'package:flutter/cupertino.dart';
import 'package:vorstu/model/order-item.dart';

class OrderItemWidget extends StatelessWidget{
  final OrderItem orderItem;
  final int orderItemIdx;

  OrderItemWidget({required this.orderItem, required this.orderItemIdx});

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
                            orderItem.product.price.toString() + " x " + orderItem.count.toString() +  " руб",
                            style: TextStyle(fontSize: 16, fontFamily: 'lora', fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ]
        )
    );
  }
}