// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String LoginEmailValueKey = 'loginEmail';
const String LoginPasswordValueKey = 'loginPassword';

final Map<String, TextEditingController> _LoginViewTextEditingControllers = {};

final Map<String, FocusNode> _LoginViewFocusNodes = {};

final Map<String, String? Function(String?)?> _LoginViewTextValidations = {
  LoginEmailValueKey: null,
  LoginPasswordValueKey: null,
};

mixin $LoginView on StatelessWidget {
  TextEditingController get loginEmailController =>
      _getFormTextEditingController(LoginEmailValueKey);
  TextEditingController get loginPasswordController =>
      _getFormTextEditingController(LoginPasswordValueKey);
  FocusNode get loginEmailFocusNode => _getFormFocusNode(LoginEmailValueKey);
  FocusNode get loginPasswordFocusNode =>
      _getFormFocusNode(LoginPasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_LoginViewTextEditingControllers.containsKey(key)) {
      return _LoginViewTextEditingControllers[key]!;
    }
    _LoginViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LoginViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LoginViewFocusNodes.containsKey(key)) {
      return _LoginViewFocusNodes[key]!;
    }
    _LoginViewFocusNodes[key] = FocusNode();
    return _LoginViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    loginEmailController.addListener(() => _updateFormData(model));
    loginPasswordController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          LoginEmailValueKey: loginEmailController.text,
          LoginPasswordValueKey: loginPasswordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        LoginEmailValueKey: _getValidationMessage(LoginEmailValueKey),
        LoginPasswordValueKey: _getValidationMessage(LoginPasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _LoginViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_LoginViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _LoginViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LoginViewFocusNodes.values) {
      focusNode.dispose();
    }

    _LoginViewTextEditingControllers.clear();
    _LoginViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
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
