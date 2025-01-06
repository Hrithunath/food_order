import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:food/models/notification.dart';

import 'package:http/http.dart' as http;

class DataManage with ChangeNotifier {
  NotificationDataModel? notificationData;
  List<Data> datas = [];

  Future<void> getdata() async {
    final result = await getdataresponse();
    if (result != null) {
      notificationData = result;
      datas = notificationData?.data ?? [];
      notifyListeners();
    }
  }
}

Future<NotificationDataModel?> getdataresponse() async {
  const String apiUrl =
      'https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json';
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return NotificationDataModel.fromJson(jsonDecode(response.body));
    } else {
      print('Error: Failed to fetch data. Status code: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}
