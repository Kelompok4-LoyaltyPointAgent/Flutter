import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PoinScreen extends StatelessWidget {
  const PoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayishColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai, Kartika Noviyanti!',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: yellowColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '1000',
                  style: yellowTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ],
            )
          ],
        ),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 30,
              color: navyColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: navyColor,
            ),
          ),
        ],
      ),
    );
  }
}
