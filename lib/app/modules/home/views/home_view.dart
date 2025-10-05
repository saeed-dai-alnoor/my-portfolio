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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.width > 800 ? 140 : 100,
        ),
        // يمكنك ضبط 140 و100 حسب ذوقك
        child: AppBar(
          elevation: 4,
          backgroundColor:
              Colors.transparent, // نخلي الخلفية شفافة لنبين الصورة
          // automaticallyImplyLeading: !MediaQuery.of(context).size.width > 800, // إذا أردت أيقونة الدروار للجوال
          centerTitle: true,
          title: Text(
            pageTitles[currentIndex].tr,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 800 ? 22 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          // الصورة تكون في flexibleSpace لتغطّي كامل الـ AppBar
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ), // ضع مسار صورتك هنا
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(
                    alpha: 0.35,
                  ), // طبقة مظللة لقراءة النص
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // أي أزرار في اليمين (actions)
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              color: Colors.white,

              onPressed: () {
                if (Get.locale?.languageCode == 'ar') {
                  Get.updateLocale(const Locale('en'));
                } else {
                  Get.updateLocale(const Locale('ar'));
                }
              },
            ),
            const SizedBox(width: 8),
          ],
          // للتأكد أن المحتوى داخل الـ AppBar غير ممتلئ على الويب
          toolbarHeight: MediaQuery.of(context).size.width > 800
              ? 140
              : kToolbarHeight,
        ),
      ),
      drawer: isDesktop
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF254504).withValues(alpha: 0.9),
                          const Color(0xFF2E5E0A).withValues(alpha: 0.85),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
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
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF254504).withValues(alpha: 0.9),
                    const Color(0xFF2E5E0A).withValues(alpha: 0.85),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: NavigationRail(
                selectedIndex: currentIndex,
                indicatorColor: Colors.black,
                onDestinationSelected: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.all,
                backgroundColor: Colors.transparent,
                destinations: [
                  NavigationRailDestination(
                    icon: const Icon(
                      Icons.person,
                      size: 26,
                      color: Colors.white,
                    ),
                    label: Text(
                      'about_me_title'.tr,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.work, size: 26, color: Colors.white),
                    label: Text(
                      'projects_title'.tr,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.star, size: 26, color: Colors.white),
                    label: Text(
                      'skills_title'.tr,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(
                      Icons.contact_mail,
                      size: 26,
                      color: Colors.white,
                    ),
                    label: Text(
                      'contact_title'.tr,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

          Expanded(child: pages[currentIndex]),
        ],
      ),

      bottomNavigationBar: MediaQuery.of(context).size.width < 800
          ? BottomNavigationBar(
              backgroundColor: const Color(0xFF2E5E0A).withValues(alpha: 0.85),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
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
