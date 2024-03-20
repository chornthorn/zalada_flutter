class ModelLanguage {
  final String name;
  final String logo;
  bool isSelect;

  ModelLanguage({
    required this.name,
    this.logo = '',
    this.isSelect = false,
  });
}

List<ModelLanguage> listLanguage = [
  ModelLanguage(
    name: 'English',
    logo: '🇺🇸',
    isSelect: true,
  ),
  ModelLanguage(name: 'Khmer', logo: '🇰🇭'),
];
