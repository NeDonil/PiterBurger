import 'package:flutter/material.dart';
import 'package:vorstu/feature/home-screen/widgets/widgets.dart';
import 'package:vorstu/model/group.dart';
import 'package:vorstu/widgets/header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  // TODO: Подвязать реальную дату
  static const List<Group> groups = [
    Group(id: 1, name: 'Бургеры'),
    Group(id: 2, name: 'Гамбургеры'),
    Group(id: 3, name: 'Чизбургеры'),
    Group(id: 4, name: 'Геры'),
    Group(id: 5, name: 'Кока-колы'),
    Group(id: 6, name: 'Коки'),
    Group(id: 7, name: 'Колы'),
    Group(id: 8, name: 'Свиноухов'),
    Group(id: 9, name: 'Бургеры'),
    Group(id: 19, name: 'Гамбургеры'),
    Group(id: 124124, name: 'Чизбургеры'),
    Group(id: 4142, name: 'Геры'),
    Group(id: 144, name: 'Кока-колы'),
    Group(id: 1121, name: 'Коки'),
    Group(id: 111111, name: 'Колы'),
    Group(id: 8464, name: 'Свиноухов'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: GroupList()
    );
  }
}