import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class CardMenu extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onPressed;

  const CardMenu({
    super.key,
    required this.image,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 90,
            width: 90,
          ),
          Text(
            title,
            style: navyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
