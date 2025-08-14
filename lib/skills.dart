import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: [
        Color(0xFFEEEEEE), // light gray
        Color(0xFF808080), // medium gray
        Color(0xFF031047), // dark blue
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    final List<Map<String, dynamic>> skillsCol1 = [
      {"name": "Flutter", "level": 0.8},
      {"name": "Dart", "level": 0.75},
      {"name": "React.Js", "level": 0.85},
      {"name": "Node.Js", "level": 0.8},
      {"name": "Restfull APIs", "level": 0.7},
      {"name": "HTML/CSS", "level": 0.65},
    ];

    final List<Map<String, dynamic>> skillsCol2 = [
      {"name": "Core Java", "level": 0.5},
      {"name": "JDBC", "level": 0.5},
      {"name": "Servlets/JSP", "level": 0.5},
      {"name": "MongoDB", "level": 0.6},
      {"name": "MySQL/SQL", "level": 0.5},
      {"name": "JS", "level": 0.5},
    ];

    final List<Map<String, dynamic>> skillsCol3 = [
      {"name": "Android & iOS", "level": 0.85},
      {"name": "Git & GitHub", "level": 0.8},
      {"name": "Google Apps Script", "level": 0.7},
      {"name": "Postman", "level": 0.75},
      {"name": "Swagger APIs", "level": 0.75},
      {"name": "Figma", "level": 0.7},
    ];

    Widget skillItem(String name, double level) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 110,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 60,
              height: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: level,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF031047), // matching gradient's middle color
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              "${(level * 100).toInt()}%",
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      );
    }

    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF031047),
              Color(0xFF0D0D0D),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9 > 780
                    ? 780
                    : MediaQuery.of(context).size.width * 0.9,
                height: isMobile
                    ? null
                    : (MediaQuery.of(context).size.height * 0.8 > 480
                    ? 480
                    : MediaQuery.of(context).size.height * 0.5),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'MY SKILLS',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'Working knowledge of diverse tools and technologies to build effective solutions',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          foreground: Paint()..shader = linearGradient,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (isMobile)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...skillsCol1.map((skill) =>
                              skillItem(skill["name"], skill["level"])),
                          const SizedBox(height: 16),
                          ...skillsCol2.map((skill) =>
                              skillItem(skill["name"], skill["level"])),
                          const SizedBox(height: 16),
                          ...skillsCol3.map((skill) =>
                              skillItem(skill["name"], skill["level"])),
                        ],
                      )
                    else
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: skillsCol1
                                .map((skill) =>
                                skillItem(skill["name"], skill["level"]))
                                .toList(),
                          ),
                          const SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: skillsCol2
                                .map((skill) =>
                                skillItem(skill["name"], skill["level"]))
                                .toList(),
                          ),
                          const SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: skillsCol3
                                .map((skill) =>
                                skillItem(skill["name"], skill["level"]))
                                .toList(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
