import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: constraints.maxWidth < 600 ? 100 : 130,
                      backgroundImage: AssetImage(controller.profileImageUrl),
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Name
                  AutoSizeText(
                    Get.locale?.languageCode == 'ar'
                        ? 'سعيد ضي النور'
                        : controller.name,
                    style: TextStyle(
                      fontSize: constraints.maxWidth < 600 ? 20 : 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),

                  // Title
                  AutoSizeText(
                    Get.locale?.languageCode == 'ar'
                        ? controller.titleAr
                        : controller.titleEn,
                    style: TextStyle(
                      fontSize: constraints.maxWidth < 600 ? 16 : 20,
                      color: Colors.grey[700],
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),

                  // About Me
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AutoSizeText(
                      Get.locale?.languageCode == 'ar'
                          ? controller.aboutMeAr
                          : controller.aboutMeEn,
                      style: TextStyle(
                        fontSize: constraints.maxWidth < 600 ? 14 : 16,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 15,
                      minFontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Contact Information
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final url = 'mailto:${controller.email}';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          }
                        },
                        icon: const Icon(Icons.email),
                        label: Text('email'.tr),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final url = controller.githubUrl;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(
                              Uri.parse(url),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        icon: const Icon(Icons.code),
                        label: Text('github'.tr),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final url = controller.linkedinUrl;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(
                              Uri.parse(url),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        icon: const Icon(Icons.business),
                        label: Text('linkedin'.tr),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final Uri url = Uri(
                            scheme: 'tel',
                            path: controller.phone,
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.platformDefault,
                            );
                          } else {
                            Get.snackbar(
                              'Error'.tr,
                              'Cannot launch dialer'.tr,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        icon: const Icon(Icons.phone),
                        label: Text('phone'.tr),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
