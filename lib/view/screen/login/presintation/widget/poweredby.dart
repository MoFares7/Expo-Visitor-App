import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PowerdBy extends StatelessWidget {
  const PowerdBy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: deffultPadding,
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Text.rich(
            TextSpan(
              text: 'Powered by' + " ",
              children: <TextSpan>[
                TextSpan(
                  text: 'DBTechnologies',
                  style: technologiesstyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      final Uri uri = Uri.file('https://dbtglobal.com/home/');
                      launchUrl(uri);
                    },
                ),
              ],
            ),
            style: pweredbystyle,
          ),
        ),
      ],
    );
  }
}
