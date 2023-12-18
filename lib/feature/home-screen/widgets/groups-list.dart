import 'package:flutter/cupertino.dart';
import 'package:vorstu/model/group.dart';
import 'package:vorstu/widgets/button.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
    required this.groups
  });

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 32),
      itemCount: groups.length,
      itemBuilder: (context, index) => Align(
          alignment: Alignment.center,
          child: Button(
            height: 60,
            width: 220,
            onPressed: () {},
            title: groups.elementAt(index).name, // TODO: Name
          )
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}