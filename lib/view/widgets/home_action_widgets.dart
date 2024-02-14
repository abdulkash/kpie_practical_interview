import 'package:flutter/material.dart';
import 'package:kpie_practical_interview/extensions/hex_color.dart';

class HomeActionsWidget extends StatelessWidget {
  const HomeActionsWidget({
    super.key,
    required this.yellow,
    required this.img,
    required this.title,
    required this.desc,
  });

  final Color yellow;
  final String img;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            '#2B99FB'.fromHex,
            '#372275'.fromHex,
          ])),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Image.asset(img),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(color: yellow, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            desc,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
