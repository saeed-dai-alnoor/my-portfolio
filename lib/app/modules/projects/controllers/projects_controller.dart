import 'package:get/get.dart';
import '../../../models/project_model.dart';

class ProjectsController extends GetxController {
  var projects = <Project>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  void loadProjects() {
    projects.value = [
      Project(
        nameEn: 'E-Commerce App',
        nameAr: 'تطبيق تجارة إلكترونية',
        descriptionEn: 'Shows products, allows adding to cart and payment.',
        descriptionAr: 'يعرض المنتجات، يمكن إضافة المنتج للسلة والدفع.',
        technologies: ['Flutter', 'Node.js', 'GetX'],
        githubUrl: 'https://github.com/saeed-dai-alnoor/e_commerce',
        imageUrl:
            'https://res.cloudinary.com/dwg1eulir/image/upload/v1759313409/jdmcpagjrxbkeqqmeyvg.png',
      ),
      Project(
        nameEn: 'Pie Ship App',
        nameAr: 'تطبيق التوصيل',
        descriptionEn: 'Logistics app for tracking shipments.',
        descriptionAr: 'تطبيق لوجستك لتتبع الشحنات.',
        technologies: ['Flutter', 'GetX'],
        githubUrl: 'https://github.com/saeed-dai-alnoor/pie-ship-app',
        imageUrl:
            'https://res.cloudinary.com/dwg1eulir/image/upload/v1759313409/jdmcpagjrxbkeqqmeyvg.png',
      ),
      Project(
        nameEn: 'College App',
        nameAr: 'تطبيق الجامعة',
        descriptionEn: 'Helps students check schedules and subjects.',
        descriptionAr: 'يساعد الطلاب على معرفة الجداول والمواد.',

        technologies: ['Flutter', 'Node.js', 'MySQL', 'GetX'],
        githubUrl: 'https://github.com/saeed-dai-alnoor/college_app',
        imageUrl:
            'https://res.cloudinary.com/dwg1eulir/image/upload/v1759313409/jdmcpagjrxbkeqqmeyvg.png',
      ),
      Project(
        nameEn: 'Doctor Booking App',
        nameAr: 'تطبيق حجز دكاترة',
        descriptionEn: 'Booking app with 3 roles: doctor, patient, admin.',
        descriptionAr: 'تطبيق حجز بثلاث فئات: طبيب، مريض، مدير.',
        technologies: ['Flutter', 'Bloc', 'Firebase'],
        githubUrl: 'https://github.com/saeed-dai-alnoor/doctor_booking_app',
        imageUrl:
            'https://res.cloudinary.com/dwg1eulir/image/upload/v1759313409/jdmcpagjrxbkeqqmeyvg.png',
      ),
      Project(
        nameEn: 'SLS App',
        nameAr: 'تطبيق تسجيل الحضور والإنصراف',
        descriptionEn: 'Tracks attendance using GPS and calculates work hours.',
        descriptionAr: 'يسجل الحضور باستخدام GPS ويحسب ساعات العمل.',

        technologies: ['Flutter', 'GetX'],
        githubUrl: 'https://github.com/saeed-dai-alnoor/sls_update_app',
        imageUrl:
            'https://res.cloudinary.com/dwg1eulir/image/upload/v1759313409/jdmcpagjrxbkeqqmeyvg.png',
      ),
      Project(
        nameEn: 'Ra-Sidi App',
        nameAr: 'تطبيق را-سيدي',
        descriptionEn: 'Transfer balance between Sudan networks.',
        descriptionAr: 'تحويل الرصيد بين شبكات السودان.',
        technologies: ['Flutter', 'GetX'],
        githubUrl: 'https://github.com/saeed-dai-alnoor/ra-sidi-app',
        imageUrl:
            'https://res.cloudinary.com/dwg1eulir/image/upload/v1759313409/jdmcpagjrxbkeqqmeyvg.png',
      ),
      Project(
        nameEn: 'Trees App',
        nameAr: 'تطبيق الأشجار',
        descriptionEn: 'Identify tree details using AI from photo.',
        descriptionAr:
            'معرفة تفاصيل الشجرة باستخدام الذكاء الاصطناعي من الصورة.',
        technologies: ['Flutter', 'Node.js', 'Firebase', 'GetX'],
        githubUrl: 'https://github.com/saeed-dai-alnoor/trees_app',
        imageUrl:
            'https://res.cloudinary.com/dwg1eulir/image/upload/v1759313409/jdmcpagjrxbkeqqmeyvg.png',
      ),
    ];
  }
}
