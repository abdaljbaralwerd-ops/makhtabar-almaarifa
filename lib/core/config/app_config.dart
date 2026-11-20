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

  static const String appTitle = 'نِبراس';

  static const String appSlogan =
      'علمٌ بلا حدود… بلا إنترنت، بلا مقابل';

  static const String developerName = 'عبد الجبار الورد';

  static const Map<String, String> packageIds = {
    'grade_1': 'com.makhtabar.almaarifa.grade1',
    'grade_2': 'com.makhtabar.almaarifa.grade2',
    'grade_3': 'com.makhtabar.almaarifa.grade3',
  };
}
