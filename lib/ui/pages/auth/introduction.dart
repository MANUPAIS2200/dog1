import 'package:flutter/material.dart';
import '../../widgets/styles.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              buildPage('Bienvenido', 'Esta es la primera página'),
              buildPage('Funcionalidades', 'Explora las funciones'),
              buildPageWithButton('Comencemos', '¡Vamos a empezar!', context),
            ],
          ),
          Positioned(
            bottom: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(String title, String subtitle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 5,
            child: Image.asset(
              'assets/ice.png',
              height: 300.0,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Styles.headline),
                Text(subtitle, style: Styles.textMuted),
              ],
            ),
          ),
          const Flexible(flex: 1, fit: FlexFit.tight, child: SizedBox()),
        ],
      ),
    );
  }

  Widget buildPageWithButton(
      String title, String subtitle, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 5,
            child: Image.asset(
              'assets/ice.png',
              height: 300.0,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Styles.headline),
                Text(subtitle, style: Styles.textMuted),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth / 2.5,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/create');
                    },
                    style: Styles.btn,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: screenWidth / 2.5,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: Styles.btnSecundary,
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: _currentPage == index ? 12.0 : 8.0,
      height: _currentPage == index ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
