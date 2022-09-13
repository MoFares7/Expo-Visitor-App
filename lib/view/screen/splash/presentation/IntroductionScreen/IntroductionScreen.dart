import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/theme.dart';
import '../../../../../constants/size.dart';
import '../../../../../main.dart';
import '../../../login/presintation/main_login.dart';
import 'widgets/NextSlideButton.dart';
import 'widgets/SlideIndicator.dart';
import 'widgets/SlideView.dart';

class IntroductionScreenView extends StatefulWidget {
  const IntroductionScreenView({Key? key}) : super(key: key);

  @override
  State<IntroductionScreenView> createState() => _IntroductionScreenViewState();
}

class _IntroductionScreenViewState extends State<IntroductionScreenView> {
  PageController? _pageController;

  onClickNext() {
    if (_pageController!.hasClients) {
      if (_pageController!.page! < 3) {
        _pageController!.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      } else {
        if (_pageController!.page! == 3) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MainLoginScreen()));
        }
      }
    }
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.01.sh),
        child: Align(
          alignment: lang ? Alignment.topLeft : Alignment.topRight,
          child: Stack(
            children: [
              SlideView(controller: _pageController!),
              Positioned(
                  bottom: 0.13.sh,
                  right: 0.1.sw,
                  left: 0.1.sw,
                  child: SlideIndicator(
                    dotIndex: _pageController!.hasClients
                        ? _pageController!.page!
                        : 0,
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NextSlideButton(
                      onClickNext: () {
                        onClickNext();
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainLoginScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          bottom: 2, // Space between underline and text
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: AppColors.subtitle,
                          width: 1.0, // Underline thickness
                        ))),
                        child: Text(
                          'skip'.tr(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.grey,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
