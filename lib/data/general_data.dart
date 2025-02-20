
   import 'package:intl/intl.dart';
import 'package:intl_phone_field/countries.dart';

DateTime daytime = DateTime.now();

List<Map<String, dynamic>> allShows = [
  {
    'date': {
      'full_date': daytime,
      'month': DateFormat('MMM').format(daytime),
      'day': DateFormat('dd').format(daytime),
      'year': DateFormat('yyyy').format(daytime),
    },
    'title': 'F1 Junior Racing Champions',
    'price': '20'
  },
    {
    'date': {
      'full_date': daytime,
      'month': DateFormat('MMM').format(daytime.add(const Duration(days: 2))),
      'day': DateFormat('dd').format(daytime.add(const Duration(days: 2))),
      'year': DateFormat('yyyy').format(daytime.add(const Duration(days: 2))),
    },
    'title': 'F1 Senior Racing Champions',
    'price': '20'
  },
      {
    'date': {
      'full_date': daytime,
      'month': DateFormat('MMM').format(daytime.add(const Duration(days: 3))),
      'day': DateFormat('dd').format(daytime.add(const Duration(days: 3))),
      'year': DateFormat('yyyy').format(daytime.add(const Duration(days: 3))),
    },
    'title': 'F1 Charity Racing Champions',
    'price': '20'
  }
];


  List<Map<String, dynamic>> youMightLike = [
    {
      'id': 0001,
      'title': 'Last One Party 2025 | Kumasi Year',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F911878343%2F30704669617%2F1%2Foriginal.20241204-231752?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C186%2C1080%2C540&s=a734db08284615746cf0369f5bf98802',
      "position": '1',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0002,
      'title': 'All Night for Jesus | Revival',
      'image':
          'https://images.unsplash.com/photo-1531058020387-3be344556be6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZXZlbnR8ZW58MHx8MHx8fDA%3D',
      "position": '2',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0006,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://images.unsplash.com/photo-1580130732478-4e339fb6836f?q=80&w=3402&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      "position": '5',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0003,
      'title': 'Biggest Party of the year',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F897860553%2F261210139653%2F1%2Foriginal.20241113-032433?crop=focalpoint&fit=crop&auto=format%2Ccompress&q=75&sharp=10&fp-x=0.5&fp-y=0.5&s=c53b73f621408e5ac52b76765598800d',
      "position": '3',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0004,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F911878343%2F30704669617%2F1%2Foriginal.20241204-231752?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C186%2C1080%2C540&s=a734db08284615746cf0369f5bf98802',
      "position": '4',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
  ];



  List<Country> activeCountries = [
      const Country(
    name: "Ghana",
    nameTranslations: {
      "sk": "Ghana",
      "se": "Ghana",
      "pl": "Ghana",
      "no": "Ghana",
      "ja": "ガーナ",
      "it": "Ghana",
      "zh": "加纳",
      "nl": "Ghana",
      "de": "Ghana",
      "fr": "Ghana",
      "es": "Ghana",
      "en": "Ghana",
      "pt_BR": "Gana",
      "sr-Cyrl": "Гана",
      "sr-Latn": "Gana",
      "zh_TW": "迦納",
      "tr": "Gana",
      "ro": "Ghana",
      "ar": "غانا",
      "fa": "غنا",
      "yue": "加納"
    },
    flag: "🇬🇭",
    code: "GH",
    dialCode: "233",
    minLength: 9,
    maxLength: 9,
  ),
    const Country(
    name: "Nigeria",
    nameTranslations: {
      "sk": "Nigéria",
      "se": "Nigeria",
      "pl": "Nigeria",
      "no": "Nigeria",
      "ja": "ナイジェリア",
      "it": "Nigeria",
      "zh": "尼日利亚",
      "nl": "Nigeria",
      "de": "Nigeria",
      "fr": "Nigéria",
      "es": "Nigeria",
      "en": "Nigeria",
      "pt_BR": "Nigéria",
      "sr-Cyrl": "Нигерија",
      "sr-Latn": "Nigerija",
      "zh_TW": "奈及利亞",
      "tr": "Nijerya",
      "ro": "Nigeria",
      "ar": "نيجيريا",
      "fa": "نیجریه",
      "yue": "尼日利亞"
    },
    flag: "🇳🇬",
    code: "NG",
    dialCode: "234",
    minLength: 10,
    maxLength: 11,
  )
  ];