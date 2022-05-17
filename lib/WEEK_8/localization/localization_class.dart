import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'localization',
          'text': "Hello Good Morning",
          'name': 'Kishan Gajera',
          'Language': 'Change Language'
        },
        'hi_IN': {
          'title': 'स्थानीयकरण',
          'text': "हैलो सुप्रभात",
          'name': 'किशन गजेरा',
          'Language': 'भाषा बदलें',
        },
        'gu_IN': {
          'title': 'સ્થાનિકીકરણ',
          'text': "હેલો ગુડ મોર્નિંગ",
          'name': 'કિશન ગજેરા',
          'Language': 'ભાષા બદલો'
        },
        'ko_KR': {
          'title': '현지화',
          'text': "안녕 좋은 아침",
          'name': '키샨 가제라',
          'Language': '언어 변경',
        },
        'ar_BH': {
          'title': 'الموقع',
          'text': "مرحبا صباح الخير",
          'name': 'كيشان جاجيرا',
          'Language': 'تغيير اللغة  '
        },
        'nl_BQ': {
          'title': 'lokalisatie',
          'text': "Hallo goede morgen",
          'name': 'Kishan Gajera',
          'Language': 'Taal wijzigen'
        },
      };
}
