import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image first
          _buildImage(isMobile),
          const SizedBox(height: 10),

          // Content below
          _buildTextContent(isMobile),
        ],
      ),
    );
  }

  Widget _buildImage(bool isMobile) {
    return SizedBox(
      width: isMobile ? 180 : 250,
      height: isMobile ? 180 : 250,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/office.png'), // fixed path
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 480),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color(0xFFEEEEEE),
            Color(0xFF808080),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
          children: [
            Text(
              "Software Developer Skilled In Backend Systems And Developing Cross-Platform Web and Mobile Applications.",
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 18 : 22,
                fontFamily: 'Roboto',
                height: 1.4,
                shadows: const [
                  Shadow(offset: Offset(1, 1), blurRadius: 3, color: Colors.grey),
                  Shadow(offset: Offset(-1, -1), blurRadius: 3, color: Colors.grey),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Passionate about crafting impactful, future-ready solutions that adapt to advancing technologies.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: isMobile ? 11 : 12,
                fontStyle: FontStyle.italic,
                fontFamily: 'Roboto',
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
