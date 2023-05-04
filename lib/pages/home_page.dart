import 'package:cryptoginie/pages/currency_chooser.dart';
import 'package:cryptoginie/widgets/home_page_bitcoin_animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double mobileBreakpoint = 600.0;
    double desktopBreakpoint = 1200.0;

    // Get the current platform type
    final bool isMobile = MediaQuery.of(context).size.width < mobileBreakpoint;
    final bool isDesktop =
        MediaQuery.of(context).size.width >= desktopBreakpoint;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            child: HomePageBitcoinAnimation(
                height: isMobile ? (height * 0.35) : 350),
          ),
          const SizedBox(
            height: 15,
          ),
          const CurrencyChooser()
        ],
      )),
    );
  }
}
