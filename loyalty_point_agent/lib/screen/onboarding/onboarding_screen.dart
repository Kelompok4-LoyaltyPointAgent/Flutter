import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loyalty_point_agent/providers/onboarding_provider.dart';
import 'package:loyalty_point_agent/screen/register/register.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Solusi Intenetan Tanpa Batas',
    'Kumpulkan POIN Anda ',
    'Tukar & Nikmati Keuntungannya ',
  ];

  List<String> subTitles = [
    'Aktifkan paket internet Anda dengan Hola Pulsa, semuanya serba murah !',
    'Kumpulkan POIN-mu sebanyak-banyaknya dan tukarkan di kemudian !',
    'Selalu ada voucher menarik setiap harinya dan tukarkan dengan Hola POIN Anda !',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: provider.currentIndex == 0 ? 44 : 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            provider.currentIndex == 0 ? navyColor : snugYellow,
                      ),
                    ),
                    Container(
                      width: provider.currentIndex == 1 ? 44 : 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            provider.currentIndex == 1 ? navyColor : snugYellow,
                      ),
                    ),
                    Container(
                      width: provider.currentIndex == 2 ? 44 : 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            provider.currentIndex == 2 ? navyColor : snugYellow,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      child: Text(
                        provider.currentIndex == 2 ? '' : 'Lewati',
                        style: snugYellowTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
                CarouselSlider(
                  items: [
                    SizedBox(
                      height: 234,
                      width: 234,
                      child: Image.asset(
                        'assets/onboarding_1.png',
                      ),
                    ),
                    SizedBox(
                      height: 234,
                      width: 234,
                      child: Image.asset(
                        'assets/onboarding_2.png',
                      ),
                    ),
                    SizedBox(
                      height: 234,
                      width: 234,
                      child: Image.asset(
                        'assets/onboarding_3.png',
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 331,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      // setState(() {
                      //   currentIndex = index;
                      // });
                      provider.updateScreenIndex(index);
                    },
                  ),
                  carouselController: carouselController,
                ),
                Text(
                  titles[provider.currentIndex],
                  style: whiteTextStyle.copyWith(
                    fontSize: 34,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitles[provider.currentIndex],
                  style: lightYellowTextStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                provider.currentIndex == 2
                    ? SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: yellowColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Mulai',
                            style: darkGreyTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            carouselController.nextPage();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: yellowColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Lanjutkan',
                            style: darkGreyTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
