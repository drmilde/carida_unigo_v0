import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/screens/widgets/svg_logo_widget.dart';

import '../home/main_screen.dart';

class UniGoIntroductionScreen extends StatefulWidget {
  const UniGoIntroductionScreen({Key? key}) : super(key: key);

  @override
  UniGoIntroductionScreenState createState() => UniGoIntroductionScreenState();
}

class UniGoIntroductionScreenState extends State<UniGoIntroductionScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 450]) {
    return Image.asset('assets/introduction/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      titlePadding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      //contentMargin: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
      //imagePadding: EdgeInsets.fromLTRB(0.0, 64.0, 0.0, 0.0),
      //fullScreen: true,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 4000,

      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            //child: _buildImage('flutter.png', 100),
            child: SVGLogoWidget(width: 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16, vertical: 0.0),
          child: CustomRoundButton(
            callback: () {
              _onIntroEnd(context);
            },
            text: "Direkt zur App!",
            textColor: Colors.white,
            height: 32,
          ),
        ),
        /*
        child: ElevatedButton(
          child: const Text(
            'Direkt zur App!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),

         */
      ),
      pages: [
        PageViewModel(
          title: "Das Dashboard",
          bodyWidget: _buildBodyWidget(
            imageName: "dashboard.png",
            text: "Im Dashboard bekommen Sie eine Übersicht über ihre"
                " bisherigen Fahrten und können die aktuelle Fahrt"
                " starten.",
            bodyStyle: bodyStyle,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fahrt hinzufügen",
          bodyWidget: _buildBodyWidget(
            imageName: "hinzufuegen.png",
            text: "Hier können Sie ein Fahrtangebot hinzufügen.",
            bodyStyle: bodyStyle,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Buchungen",
          bodyWidget: _buildBodyWidget(
            imageName: "buchungen.png",
            text: "Hier sehen Sie Ihre Buchungen und Ihre Fahrtangebote.",
            bodyStyle: bodyStyle,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fahrt suchen",
          bodyWidget: _buildBodyWidget(
            imageName: "fahrtsuchen.png",
            text: "Suchen und finden Sie passende Fahrtangebote."
                " Wenn ein Fahrtangebot passt, dann stellen Sie eine Anfrage"
                " an den Anbieter.",
            bodyStyle: bodyStyle,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Der Chat",
          bodyWidget: _buildBodyWidget(
            imageName: "chat.png",
            text: "Bleiben Sie Kontakt mit Ihren Fahrern und Mitfahrern.",
            bodyStyle: bodyStyle,
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Fertig', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  Widget _buildBodyWidget({
    required String imageName,
    required String text,
    required TextStyle bodyStyle,
  }) {
    return Column(
      children: [
        _buildImage("${imageName}", 250),
        SizedBox(height: 16),
        _buildBodyText(text, bodyStyle),
      ],
    );
  }

  Widget _buildBodyText(String text, TextStyle bodyStyle) {
    return Text(
      text,
      style: bodyStyle,
      textAlign: TextAlign.justify,
    );
  }
}
