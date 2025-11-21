import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'Products': 'Products',
      'Search Product': 'Search Product',
      'Setting': "Setting",
    },
    'kh_km': {
      'Products': 'ទំនិញ',
      'Search Product': 'ស្វែងរកទំនិញ',
      'Setting': "ការកំណត់",
    },
  };
}
