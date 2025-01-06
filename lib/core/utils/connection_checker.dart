import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:food/features/data/data/repository/services/api_service.dart';
import 'package:provider/provider.dart';

class ConnectionChecker {
  static StreamSubscription<List<ConnectivityResult>>? _subscription;

  static checkConnection(BuildContext context) async {
    List<ConnectivityResult> connectionStatus =
        await Connectivity().checkConnectivity();
    if (connectionStatus.contains(ConnectivityResult.none)) {
      networkErrorShowSnackbar(context);
    }
  }

  static void listenForConnectionChanges(BuildContext context) {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectionStatus) {
      if (connectionStatus.contains(ConnectivityResult.none)) {
        networkErrorShowSnackbar(context);
      } else {
        // call the method that you want for fetch data

        Provider.of<DataManage>(context, listen: false).getdata();
      }
    });
  }

  static void cancelConnectionSubscription() {
    _subscription?.cancel();
  }

  static void networkErrorShowSnackbar(BuildContext context) {
    // Check if context is not null
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No internet connection. Please check your settings.'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
