import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

/// The type of snackbar to show
enum SnackBarType { redAndWhite, greenAndBlack }

// Registers a config to be used when calling showSnackbar
void setupSnackBarUi() {
  final service = locator<SnackbarService>();
  service.registerCustomSnackbarConfig(
    variant: SnackBarType.greenAndBlack,
    config: SnackbarConfig(
        backgroundColor: Colors.greenAccent,
        titleColor: Colors.black,
        messageColor: Colors.black,
        borderRadius: 10,
        margin: const EdgeInsets.all(20.0),
        dismissDirection: DismissDirection.down,
        titleTextAlign: TextAlign.center,
        messageTextAlign: TextAlign.center),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.redAndWhite,
    config: SnackbarConfig(
        backgroundColor: Colors.redAccent,
        titleColor: Colors.white,
        messageColor: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(20.0),
        dismissDirection: DismissDirection.down,
        titleTextAlign: TextAlign.center,
        messageTextAlign: TextAlign.center),
  );
}
