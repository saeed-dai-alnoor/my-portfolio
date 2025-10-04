import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        if (controller.projects.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 2;
            double aspectRatio = 0.75;

            if (constraints.maxWidth <= 400) {
              crossAxisCount = 1;
              aspectRatio = 0.95;
            } else if (constraints.maxWidth > 600 &&
                constraints.maxWidth <= 900) {
              crossAxisCount = 3;
              aspectRatio = 0.80;
            } else if (constraints.maxWidth > 900) {
              crossAxisCount = 4;
              aspectRatio = 0.85;
            }

            return GridView.builder(
              itemCount: controller.projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: aspectRatio,
              ),
              itemBuilder: (context, index) {
                final project = controller.projects[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // صورة المشروع
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.network(
                          project.imageUrl,
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                height: 140,
                                color: Colors.grey[200],
                                child: const Icon(Icons.broken_image, size: 40),
                              ),
                        ),
                      ),

                      // محتوى المشروع Scrollable
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                Get.locale?.languageCode == 'ar'
                                    ? project.nameAr
                                    : project.nameEn,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                minFontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              AutoSizeText(
                                Get.locale?.languageCode == 'ar'
                                    ? project.descriptionAr
                                    : project.descriptionEn,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 13,
                                ),
                                maxLines: 5,
                                minFontSize: 11,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 4,
                                runSpacing: -8,
                                children: project.technologies
                                    .map(
                                      (tech) => Chip(
                                        label: Text(
                                          tech,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                        backgroundColor: Colors.blue[50],
                                        side: BorderSide.none,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // زر GitHub
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                        ),
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () async {
                            if (await canLaunchUrl(
                              Uri.parse(project.githubUrl),
                            )) {
                              await launchUrl(
                                Uri.parse(project.githubUrl),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.code,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: Text(
                            'github'.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
