class ChemistryBookData {
  static const String title = 'الكيمياء';
  static const String subtitle = 'للصف الأول الثانوي';

  // مقدمة ترحيبية مؤقتة، تستبدل لاحقاً بالنص المعتمد.
  static const String introduction = '''
مرحباً بك في رحلتك العلمية مع كتاب الكيمياء.

في هذه الرحلة ستتعرف على المادة وخصائصها، وتكتشف أسرار الذرة والعناصر والتفاعلات الكيميائية.

لا تكتفِ بقراءة المعلومة؛ تأملها، واسأل عنها، وحاول أن تفهم ما وراءها.

اجعل الفضول بداية اكتشافك، والعلم طريقك إلى المستقبل.

نتمنى لك رحلة تعليمية ممتعة ومليئة بالاكتشافات.
''';

  // أرقام الصفحات المطبوعة في فهرس الكتاب.
  static const List<ChemistryUnit> units = [
    ChemistryUnit(
      number: 1,
      title: 'علم الكيمياء وتطوره',
      page: 9,
    ),
    ChemistryUnit(
      number: 2,
      title: 'تطور مفهوم الذرة',
      page: 32,
    ),
    ChemistryUnit(
      number: 3,
      title: 'تركيب الذرة وقواعد التوزيع الإلكتروني',
      page: 47,
    ),
    ChemistryUnit(
      number: 4,
      title: 'القانون الدوري وتصنيف العناصر وفقاً لخواصها الدورية',
      page: 66,
    ),
    ChemistryUnit(
      number: 5,
      title: 'عناصر المجموعة الرئيسية الأولى (IA)',
      page: 106,
    ),
    ChemistryUnit(
      number: 6,
      title: 'عناصر المجموعة الرئيسية الثانية (IIA)',
      page: 119,
    ),
    ChemistryUnit(
      number: 7,
      title: 'التفاعلات الكيميائية والمعادلات الموزونة',
      page: 131,
    ),
    ChemistryUnit(
      number: 8,
      title: 'الكيمياء العضوية',
      page: 158,
    ),
  ];
}

class ChemistryUnit {
  final int number;
  final String title;
  final int page;

  const ChemistryUnit({
    required this.number,
    required this.title,
    required this.page,
  });
}
