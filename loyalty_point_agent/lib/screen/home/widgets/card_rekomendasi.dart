import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class CardRekomendasi extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String date;
  final String poin;
  final Function()? onPressed;

  const CardRekomendasi({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.date,
    required this.poin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        //height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    image,
                    height: 37,
                    width: 37,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: yellowTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: blackRegulerTextStyle.copyWith(
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    price,
                    style: navyTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: grayishColor,
                    ),
                    child: Text(
                      date,
                      style: navyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: grayishColor,
                    ),
                    child: Text(
                      poin,
                      style: navyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
