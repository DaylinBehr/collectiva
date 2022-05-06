// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String LoginEmailValueKey = 'loginEmail';
const String LoginPasswordValueKey = 'loginPassword';

mixin $LoginView on StatelessWidget {
  final TextEditingController loginEmailController =
      TextEditingController(text: '');
  final TextEditingController loginPasswordController =
      TextEditingController(text: '');
  final FocusNode loginEmailFocusNode = FocusNode();
  final FocusNode loginPasswordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    loginEmailController.addListener(() => _updateFormData(model));
    loginPasswordController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            LoginEmailValueKey: loginEmailController.text,
            LoginPasswordValueKey: loginPasswordController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    loginEmailController.dispose();
    loginEmailFocusNode.dispose();
    loginPasswordController.dispose();
    loginPasswordFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get loginEmailValue =>
      this.formValueMap[LoginEmailValueKey] as String?;
  String? get loginPasswordValue =>
      this.formValueMap[LoginPasswordValueKey] as String?;

  bool get hasLoginEmail => this.formValueMap.containsKey(LoginEmailValueKey);
  bool get hasLoginPassword =>
      this.formValueMap.containsKey(LoginPasswordValueKey);

  bool get hasLoginEmailValidationMessage =>
      this.fieldsValidationMessages[LoginEmailValueKey]?.isNotEmpty ?? false;
  bool get hasLoginPasswordValidationMessage =>
      this.fieldsValidationMessages[LoginPasswordValueKey]?.isNotEmpty ?? false;

  String? get loginEmailValidationMessage =>
      this.fieldsValidationMessages[LoginEmailValueKey];
  String? get loginPasswordValidationMessage =>
      this.fieldsValidationMessages[LoginPasswordValueKey];
}

extension Methods on FormViewModel {
  setLoginEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LoginEmailValueKey] = validationMessage;
  setLoginPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LoginPasswordValueKey] = validationMessage;
}
