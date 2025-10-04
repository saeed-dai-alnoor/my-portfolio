import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../about/controllers/about_controller.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutController controller = Get.put(AboutController());

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // أزرار التواصل
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _contactButton(
                      icon: Icons.email,
                      label: 'email'.tr,
                      color: Colors.blueGrey[800]!,
                      onTap: () async {
                        final Uri url = Uri(
                          scheme: 'mailto',
                          path: controller.email,
                        );
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.platformDefault,
                          );
                        } else {
                          Get.snackbar(
                            'Error'.tr,
                            'Cannot launch email app'.tr,
                          );
                        }
                      },
                    ),
                    _contactButton(
                      icon: Icons.phone,
                      label: 'phone'.tr,
                      color: Colors.green[700]!,
                      onTap: () async {
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
                          Get.snackbar('Error'.tr, 'Cannot launch dialer'.tr);
                        }
                      },
                    ),
                    _contactButton(
                      icon: Icons.code,
                      label: 'GitHub',
                      color: Colors.black,
                      onTap: () async {
                        final Uri url = Uri.parse(controller.githubUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          Get.snackbar('Error'.tr, 'Cannot launch GitHub'.tr);
                        }
                      },
                    ),
                    _contactButton(
                      icon: Icons.business,
                      label: 'LinkedIn',
                      color: Colors.blue[700]!,
                      onTap: () async {
                        final Uri url = Uri.parse(controller.linkedinUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          Get.snackbar('Error'.tr, 'Cannot launch LinkedIn'.tr);
                        }
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // نموذج رسالة بسيطة (اختياري)
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Name'.tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'email'.tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Message'.tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: () {
                            Get.snackbar(
                              'Info'.tr,
                              'Message feature not implemented yet.'.tr,
                            );
                          },
                          icon: const Icon(Icons.send),
                          label: Text('Send'.tr),
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

  Widget _contactButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
