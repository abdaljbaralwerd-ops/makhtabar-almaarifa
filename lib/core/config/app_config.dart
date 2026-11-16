class AppConfig {
  static const String gradeId = String.fromEnvironment(
    'APP_GRADE',
    defaultValue: 'grade_1',
  );

  static const Map<String, String> grades = {
    'grade_1': 'الأول الثانوي',
    'grade_2': 'الثاني الثانوي',
    'grade_3': 'الثالث الثانوي',
  };

  static String get gradeName =>
      grades[gradeId] ?? grades['grade_1']!;

  static String get appTitle =>
      'مختبر المعرفة - $gradeName';

  static const Map<String, String> packageIds = {
    'grade_1': 'com.makhtabar.almaarifa.grade1',
    'grade_2': 'com.makhtabar.almaarifa.grade2',
    'grade_3': 'com.makhtabar.almaarifa.grade3',
  };
}
