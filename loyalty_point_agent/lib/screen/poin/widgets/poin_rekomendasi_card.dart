import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PoinRekomendasiCard extends StatelessWidget {
  final String provider;
  final String image;
  final String imageProvider;
  final String title;
  final String deskripsi;
  final String poin;
  final Function()? onPressed;
  final Function()? onTap;

  const PoinRekomendasiCard({
    super.key,
    required this.provider,
    required this.image,
    required this.title,
    required this.deskripsi,
    required this.poin,
    required this.imageProvider,
    this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 4, // blur radius
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Image.network(
                  image,
                  width: double.infinity,
                  height: 175,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: grayishColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          imageProvider,
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          provider,
                          style: navyTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: navyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        deskripsi,
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: onPressed,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        // width: 34,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), //color of shadow
                              spreadRadius: 5, //spread radius
                              blurRadius: 7, // blur radius
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite_sharp,
                          color: Colors.red,
                          size: 34,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
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
                      poin,
                      style: yellowTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
