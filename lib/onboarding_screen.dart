import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your login screen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> titles = [
    "The Emergency Alert button is a vital safety feature that instantly sends a distress signal to notify your designated emergency contacts.",
    "The fake call feature allows users to simulate an incoming call, providing a subtle way to gracefully exit awkward situations or steer clear.",
    "Your safety comes first. Providing you with instant alerts, rapid emergency assistance, and sharing to ensure your peace of mind. Stay secure, stay connected.",
    "The Aakrosh button is a powerful safety feature that, when activated, notifies your emergency contacts and shares your location with them and local authorities, ensuring timely assistance during emergencies.",
    "You can set up a safety keyword which you can use in unsafe situations to send your location to authorities and emergency contacts.",
  ];

  final List<String> imagePaths = [
    'assets/on1img.png',
    'assets/on2img.png',
    'assets/on3img.png',
    'assets/on4img.png',
    'assets/on5img.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: titles.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: titles[index],
                  imagePath: imagePaths[index],
                  currentIndex: _currentIndex,
                  totalCount: titles.length,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                if (_currentIndex < titles.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Navigate to LoginScreen when the last page is reached
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                }
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffE28067),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  _currentIndex == titles.length - 1 ? "FINISH" : "NEXT",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final int currentIndex;
  final int totalCount;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.currentIndex,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalCount,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                height: 8.0,
                width: currentIndex == index ? 16.0 : 8.0,
                decoration: BoxDecoration(
                  color: currentIndex == index ? const Color(0xffE28067) : Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
