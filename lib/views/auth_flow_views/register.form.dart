// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String RegisterNameValueKey = 'registerName';
const String RegisterUserNameValueKey = 'registerUserName';
const String RegisterEmailValueKey = 'registerEmail';
const String RegisterPasswordValueKey = 'registerPassword';
const String RegisterConfirmPasswordValueKey = 'registerConfirmPassword';

mixin $RegisterView on StatelessWidget {
  final TextEditingController registerNameController =
      TextEditingController(text: '');
  final TextEditingController registerUserNameController =
      TextEditingController(text: '');
  final TextEditingController registerEmailController =
      TextEditingController(text: '');
  final TextEditingController registerPasswordController =
      TextEditingController(text: '');
  final TextEditingController registerConfirmPasswordController =
      TextEditingController(text: '');
  final FocusNode registerNameFocusNode = FocusNode();
  final FocusNode registerUserNameFocusNode = FocusNode();
  final FocusNode registerEmailFocusNode = FocusNode();
  final FocusNode registerPasswordFocusNode = FocusNode();
  final FocusNode registerConfirmPasswordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    registerNameController.addListener(() => _updateFormData(model));
    registerUserNameController.addListener(() => _updateFormData(model));
    registerEmailController.addListener(() => _updateFormData(model));
    registerPasswordController.addListener(() => _updateFormData(model));
    registerConfirmPasswordController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            RegisterNameValueKey: registerNameController.text,
            RegisterUserNameValueKey: registerUserNameController.text,
            RegisterEmailValueKey: registerEmailController.text,
            RegisterPasswordValueKey: registerPasswordController.text,
            RegisterConfirmPasswordValueKey:
                registerConfirmPasswordController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    registerNameController.dispose();
    registerNameFocusNode.dispose();
    registerUserNameController.dispose();
    registerUserNameFocusNode.dispose();
    registerEmailController.dispose();
    registerEmailFocusNode.dispose();
    registerPasswordController.dispose();
    registerPasswordFocusNode.dispose();
    registerConfirmPasswordController.dispose();
    registerConfirmPasswordFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get registerNameValue =>
      this.formValueMap[RegisterNameValueKey] as String?;
  String? get registerUserNameValue =>
      this.formValueMap[RegisterUserNameValueKey] as String?;
  String? get registerEmailValue =>
      this.formValueMap[RegisterEmailValueKey] as String?;
  String? get registerPasswordValue =>
      this.formValueMap[RegisterPasswordValueKey] as String?;
  String? get registerConfirmPasswordValue =>
      this.formValueMap[RegisterConfirmPasswordValueKey] as String?;

  bool get hasRegisterName =>
      this.formValueMap.containsKey(RegisterNameValueKey);
  bool get hasRegisterUserName =>
      this.formValueMap.containsKey(RegisterUserNameValueKey);
  bool get hasRegisterEmail =>
      this.formValueMap.containsKey(RegisterEmailValueKey);
  bool get hasRegisterPassword =>
      this.formValueMap.containsKey(RegisterPasswordValueKey);
  bool get hasRegisterConfirmPassword =>
      this.formValueMap.containsKey(RegisterConfirmPasswordValueKey);

  bool get hasRegisterNameValidationMessage =>
      this.fieldsValidationMessages[RegisterNameValueKey]?.isNotEmpty ?? false;
  bool get hasRegisterUserNameValidationMessage =>
      this.fieldsValidationMessages[RegisterUserNameValueKey]?.isNotEmpty ??
      false;
  bool get hasRegisterEmailValidationMessage =>
      this.fieldsValidationMessages[RegisterEmailValueKey]?.isNotEmpty ?? false;
  bool get hasRegisterPasswordValidationMessage =>
      this.fieldsValidationMessages[RegisterPasswordValueKey]?.isNotEmpty ??
      false;
  bool get hasRegisterConfirmPasswordValidationMessage =>
      this
          .fieldsValidationMessages[RegisterConfirmPasswordValueKey]
          ?.isNotEmpty ??
      false;

  String? get registerNameValidationMessage =>
      this.fieldsValidationMessages[RegisterNameValueKey];
  String? get registerUserNameValidationMessage =>
      this.fieldsValidationMessages[RegisterUserNameValueKey];
  String? get registerEmailValidationMessage =>
      this.fieldsValidationMessages[RegisterEmailValueKey];
  String? get registerPasswordValidationMessage =>
      this.fieldsValidationMessages[RegisterPasswordValueKey];
  String? get registerConfirmPasswordValidationMessage =>
      this.fieldsValidationMessages[RegisterConfirmPasswordValueKey];
}

extension Methods on FormViewModel {
  setRegisterNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterNameValueKey] = validationMessage;
  setRegisterUserNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterUserNameValueKey] =
          validationMessage;
  setRegisterEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterEmailValueKey] = validationMessage;
  setRegisterPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterPasswordValueKey] =
          validationMessage;
  setRegisterConfirmPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterConfirmPasswordValueKey] =
          validationMessage;
}
