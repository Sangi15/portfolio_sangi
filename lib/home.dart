import 'dart:html' as html; // This will work for web download
import 'package:flutter/material.dart';
import 'package:profile/Contact.dart';
import 'about.dart';
import 'skills.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const mobileBreakpoint = 600;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPage = "Home";

  void _setPage(String page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Widget bodyContent;

    switch (selectedPage) {
      case "About":
        bodyContent = const AboutContent();
        break;
      case "Skills":
        bodyContent = const Skills();
        break;
      case "Contact":
        bodyContent = const Contact();
        break;
      case "Home":
      default:
        bodyContent = HomeContent(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        );
        break;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(12),
          child: SizedBox(),
        ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _navButton("Home", () => _setPage("Home")),
              _navButton("About", () => _setPage("About")),
              _navButton("Skills", () => _setPage("Skills")),
              _navButton("Contact", () => _setPage("Contact")),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF031047),
              Color(0xFF0D0D0D),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: bodyContent,
      ),
    );
  }

  Widget _navButton(String title, VoidCallback onPressed) {
    final isSelected = selectedPage == title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? Colors.grey : Colors.white,
          textStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const HomeContent({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  static const mobileBreakpoint = 600;

  // ✅ Now opens PDF in new tab instead of direct download
  void _downloadCV() {
    const cvPath = 'asset/files/Sangeetha_Segar_CVR.pdf';
    html.window.open(cvPath, '_blank'); // Open PDF in new browser tab
  }

  Widget _gradientButton() {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF00C6FF),
                  Color(0xFF031047),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: isHovered
                  ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ]
                  : [],
            ),
            child: ElevatedButton(
              onPressed: _downloadCV, // ✅ Opens PDF in new tab
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Download CV",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.download, size: 18, color: Colors.white),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return screenWidth < mobileBreakpoint
        ? SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 150, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              height: 220,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/sangi.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFFEEEEEE),
                  Color(0xFF808080),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Text(
                "Welcome to my portfolio I’m Sangeetha Segar\nA passionate Software Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF808080),
                  Color(0xFFF0F0F0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Text(
                "Turning ideas into impactful digital experiences",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _gradientButton(),
          ],
        ),
      ),
    )
        : SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          const LinearGradient(
                            colors: [
                              Color(0xFFEEEEEE),
                              Color(0xFF808080),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                      child: const Text(
                        "Welcome To My Portfolio I’m Sangeetha Segar \nA passionate Software Developer",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          const LinearGradient(
                            colors: [
                              Color(0xFF808080),
                              Color(0xFFF0F0F0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                      child: const Text(
                        "Turning ideas into impactful digital experiences",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _gradientButton(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 270,
                  height: 270,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/images/sangi.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderContent extends StatelessWidget {
  final String title;

  const PlaceholderContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title page content goes here.',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
