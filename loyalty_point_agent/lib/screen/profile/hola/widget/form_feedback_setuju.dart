import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/post_feedback_model.dart';
import 'package:loyalty_point_agent/providers/checkbox_provider.dart';
import 'package:loyalty_point_agent/providers/feedbacks_provider.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class FormFeedBackSetuju extends StatefulWidget {
  const FormFeedBackSetuju({super.key});

  @override
  State<FormFeedBackSetuju> createState() => _FormFeedBackSetujuState();
}

class _FormFeedBackSetujuState extends State<FormFeedBackSetuju> {
  List<Map<String, dynamic>> data = [
    {
      'id': 'Informasi yang diberikan informatif',
      'value': false,
    },
    {
      'id': 'Artikel mudah dipahami',
      'value': false,
    },
    {
      'id': 'Artikel mudah ditemukan',
      'value': false,
    },
    {
      'id': 'Tampilan Menarik',
      'value': false,
    },
  ];

  TextEditingController saranController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<CheckboxProvider, FeedbacksProvider>(
      builder: (context, provider, feedback, _) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Apa yang sudah baik ?',
                  style: yellowTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Consumer<CheckboxProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            title: Text(
                              data[index]['id'].toString(),
                              style: whiteTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 14,
                              ),
                            ),
                            value: data[index]['value'],
                            activeColor: yellowColor,
                            side: BorderSide(color: yellowColor),
                            contentPadding: const EdgeInsets.only(right: 0),
                            onChanged: (value) {
                              provider.changeStatus(value);
                              data[index]['value'] = value;
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: saranController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: yellowColor),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Saran (Opsional)',
                    fillColor: whiteColor,
                    filled: true,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? pilihan1;
                      bool? pilihan2;
                      bool? pilihan3;
                      bool? pilihan4;
                      pilihan1 = data[0]['value'] == true ? true : null;
                      pilihan2 = data[1]['value'] == true ? true : null;
                      pilihan3 = data[2]['value'] == true ? true : null;
                      pilihan4 = data[3]['value'] == true ? true : null;

                      await feedback.feedback(
                        PostFeedbackModel(
                          isInformationHelpful: pilihan1,
                          isArticleHelpful: pilihan2,
                          isArticleEasyToFind: pilihan3,
                          isDesignGood: pilihan4,
                          review: saranController.text,
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const NavBarScreen(),
                      //   ),
                      // );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Kirim Masukan',
                      style: navyTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
