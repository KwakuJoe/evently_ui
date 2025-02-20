  import 'package:intl/intl.dart';

final dateRangeOptions = [
    {
      "label": "Today",
      "value": {
        'from': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'to': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      },
    },
    {
      "label": "Tomorrow",
      "value": {
        'from': DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 1))),
        // ignore: prefer_const_constructors
        'to': DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 1))),
      },
    },
    {
      "label": "This week",
      "value": {
        'from': DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1))),
        'to': DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 7 - DateTime.now().weekday))),
      },
    },
  ];