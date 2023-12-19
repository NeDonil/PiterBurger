import 'package:flutter/material.dart';
import 'package:vorstu/model/product.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Row(
            children: [
              Image(
                  image: NetworkImage(product.photo),
                  width: 100,
              ),
              Container(
                alignment: Alignment.centerLeft,
                constraints: BoxConstraints(minWidth: 100, maxWidth: MediaQuery.of(context).size.width * 0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 20, fontFamily: 'lora')
                    ),
                    SizedBox(height: 15),
                    Text(
                      product.price.toString() + " руб",
                      style: TextStyle(fontSize: 16, fontFamily: 'lora', fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(64, 57, 85, 1.0)
            ),
            onPressed: (){},
            child: Text(
                "Добавить",
                style: TextStyle(fontFamily: 'lora', fontWeight: FontWeight.bold, color: Colors.white),
            )
          )
        ]
      )
    );
  }
}