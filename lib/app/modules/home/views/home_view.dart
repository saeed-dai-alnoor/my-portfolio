import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/app/modules/about/views/about_view.dart';
import '../../about/controllers/about_controller.dart';
import '../../contact/views/contact_view.dart';
import '../../projects/views/projects_view.dart';
import '../../skills/views/skills_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AboutController aboutController = Get.put(AboutController());

  int currentIndex = 0;

  final List<Widget> pages = const [
    AboutView(),
    ProjectsView(),
    SkillsView(),
    ContactView(),
  ];

  final List<String> pageTitles = [
    'about_me_title',
    'projects_title',
    'skills_title',
    'contact_title',
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[currentIndex].tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              if (Get.locale?.languageCode == 'ar') {
                Get.updateLocale(const Locale('en'));
              } else {
                Get.updateLocale(const Locale('ar'));
              }
            },
          ),
        ],
      ),

      drawer: isDesktop
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Color(0xFF1E2A78)),
                    child: Text(
                      'Saeed Dai Alnoor',
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  ...List.generate(pageTitles.length, (index) {
                    return ListTile(
                      leading: Icon(
                        index == 0
                            ? Icons.person
                            : index == 1
                            ? Icons.work
                            : index == 2
                            ? Icons.star
                            : Icons.contact_mail,
                      ),
                      title: Text(pageTitles[index].tr),
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        Navigator.pop(context);
                      },
                    );
                  }),
                ],
              ),
            ),

      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.person),
                  label: Text('about_me_title'.tr),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.work),
                  label: Text('projects_title'.tr),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.star),
                  label: Text('skills_title'.tr),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.contact_mail),
                  label: Text('contact_title'.tr),
                ),
              ],
            ),

          Expanded(child: pages[currentIndex]),
        ],
      ),

      bottomNavigationBar: MediaQuery.of(context).size.width < 800
          ? BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: 'about_me_title'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.work),
                  label: 'projects_title'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.star),
                  label: 'skills_title'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.contact_mail),
                  label: 'contact_title'.tr,
                ),
              ],
            )
          : null,
    );
  }
}
