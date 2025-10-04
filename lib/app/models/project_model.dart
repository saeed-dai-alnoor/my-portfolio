class Project {
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final List<String> technologies;
  final String githubUrl;
  final String imageUrl;

  Project({
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.technologies,
    required this.githubUrl,
    required this.imageUrl,
  });
}
