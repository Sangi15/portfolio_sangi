import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  /// Gmail link for mobile & desktop
  /// Falls back to Gmail web on browsers
  void _launchEmail(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android ||
        Theme.of(context).platform == TargetPlatform.iOS) {
      _launchUrl(
        Uri(
          scheme: 'mailto',
          path: 'sansegar95@gmail.com',
          query: 'subject=Hello%20Sangeetha',
        ),
      );
    } else {
      _launchUrl(Uri.parse(
          'https://mail.google.com/mail/?view=cm&fs=1&to=sansegar95@gmail.com'));
    }
  }

  /// LinkedIn always opens in browser
  void _launchLinkedIn() {
    _launchUrl(
      Uri.parse('https://www.linkedin.com/in/sangeetha-segar-911182332'),
    );
  }

  /// GitHub profile
  void _launchGitHub() {
    _launchUrl(Uri.parse('https://github.com/Sangi15'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenWidth < 500 ? 200 : 150,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: screenWidth < 500 ? screenWidth * 0.9 : 400,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    'asset/images/connect.png',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Let's Connect",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => _launchEmail(context),
                          child: Row(
                            children: const [
                              Icon(FontAwesomeIcons.envelope, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                "sansegar95@gmail.com",
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: _launchLinkedIn,
                          child: Row(
                            children: const [
                              Icon(FontAwesomeIcons.linkedin, color: Colors.blue),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "LinkedIn Profile",
                                  style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: _launchGitHub,
                          child: Row(
                            children: const [
                              Icon(FontAwesomeIcons.github, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                "GitHub Profile",
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
