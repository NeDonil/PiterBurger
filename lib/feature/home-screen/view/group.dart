import 'package:flutter/material.dart';
import 'package:vorstu/widgets/header.dart';

import 'package:vorstu/feature/home-screen/widgets/products-list.dart';

class GroupView extends StatelessWidget {
  const GroupView({super.key, required this.groupId});

  final int groupId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(),
        body: ProductList(groupId: groupId)
    );
  }
}