import 'package:devaldaporto/pages/mymedia.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/profile.dart';
import '../dialogs/TNC_dialog.dart';
import '../dialogs/policy_dialog.dart';

class AgreementPops {
  final Profile prof = Profile();
  final MyMedia med = MyMedia();
  Future DialogTNCandPNP(context, MQwidth, MQheight, bool isMedia) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 60, 4, 58),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MQheight;
                  var width = MQwidth;

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MQheight * 0.4,
                      color: Colors.black,
                      // height: ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Before we Continue..',
                              style: GoogleFonts.orbitron(
                                  fontSize: 20,
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Text(
                              'first "user" must Read to the ( Terms & Condition ) and ( Privacy Policy ) that have been provided below , and Agreed to it if "user" want to continue ',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.orbitron(
                                  fontSize: 15,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return TermDialog(
                                                mdFileName:
                                                    'TermsNCondition.md');
                                          });
                                    },
                                    child: Text(
                                      'Terms & Condition',
                                      style: GoogleFonts.orbitron(fontSize: 10),
                                    )),
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PolicyDialog(
                                              mdFileName: 'PrivacyNPolicy.md');
                                        });
                                  },
                                  child: Text(
                                    'Privacy Policy',
                                    style: GoogleFonts.orbitron(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "i agreed and proceed to continue",
                            style: GoogleFonts.orbitron(
                                fontSize: 10, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    // ignore: prefer_const_constructors
                                    style: ButtonStyle(
                                        enableFeedback: true,
                                        backgroundColor:
                                            const MaterialStatePropertyAll<
                                                    Color>(
                                                Colors.deepPurpleAccent)),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text("cancel")),
                                const SizedBox(
                                  width: 30,
                                ),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        enableFeedback: true,
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.deepPurpleAccent)),
                                    onPressed: () {
                                      isMedia
                                          ? med.saveOptions()
                                          : prof.saveOptionsProf();

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("agree"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
  }
}
