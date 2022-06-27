// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String RegisterNameValueKey = 'registerName';
const String RegisterUserNameValueKey = 'registerUserName';
const String RegisterEmailValueKey = 'registerEmail';
const String RegisterPasswordValueKey = 'registerPassword';
const String RegisterConfirmPasswordValueKey = 'registerConfirmPassword';

final Map<String, TextEditingController> _RegisterViewTextEditingControllers =
    {};

final Map<String, FocusNode> _RegisterViewFocusNodes = {};

final Map<String, String? Function(String?)?> _RegisterViewTextValidations = {
  RegisterNameValueKey: null,
  RegisterUserNameValueKey: null,
  RegisterEmailValueKey: null,
  RegisterPasswordValueKey: null,
  RegisterConfirmPasswordValueKey: null,
};

mixin $RegisterView on StatelessWidget {
  TextEditingController get registerNameController =>
      _getFormTextEditingController(RegisterNameValueKey);
  TextEditingController get registerUserNameController =>
      _getFormTextEditingController(RegisterUserNameValueKey);
  TextEditingController get registerEmailController =>
      _getFormTextEditingController(RegisterEmailValueKey);
  TextEditingController get registerPasswordController =>
      _getFormTextEditingController(RegisterPasswordValueKey);
  TextEditingController get registerConfirmPasswordController =>
      _getFormTextEditingController(RegisterConfirmPasswordValueKey);
  FocusNode get registerNameFocusNode =>
      _getFormFocusNode(RegisterNameValueKey);
  FocusNode get registerUserNameFocusNode =>
      _getFormFocusNode(RegisterUserNameValueKey);
  FocusNode get registerEmailFocusNode =>
      _getFormFocusNode(RegisterEmailValueKey);
  FocusNode get registerPasswordFocusNode =>
      _getFormFocusNode(RegisterPasswordValueKey);
  FocusNode get registerConfirmPasswordFocusNode =>
      _getFormFocusNode(RegisterConfirmPasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_RegisterViewTextEditingControllers.containsKey(key)) {
      return _RegisterViewTextEditingControllers[key]!;
    }
    _RegisterViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _RegisterViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_RegisterViewFocusNodes.containsKey(key)) {
      return _RegisterViewFocusNodes[key]!;
    }
    _RegisterViewFocusNodes[key] = FocusNode();
    return _RegisterViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    registerNameController.addListener(() => _updateFormData(model));
    registerUserNameController.addListener(() => _updateFormData(model));
    registerEmailController.addListener(() => _updateFormData(model));
    registerPasswordController.addListener(() => _updateFormData(model));
    registerConfirmPasswordController.addListener(() => _updateFormData(model));
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
          RegisterNameValueKey: registerNameController.text,
          RegisterUserNameValueKey: registerUserNameController.text,
          RegisterEmailValueKey: registerEmailController.text,
          RegisterPasswordValueKey: registerPasswordController.text,
          RegisterConfirmPasswordValueKey:
              registerConfirmPasswordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        RegisterNameValueKey: _getValidationMessage(RegisterNameValueKey),
        RegisterUserNameValueKey:
            _getValidationMessage(RegisterUserNameValueKey),
        RegisterEmailValueKey: _getValidationMessage(RegisterEmailValueKey),
        RegisterPasswordValueKey:
            _getValidationMessage(RegisterPasswordValueKey),
        RegisterConfirmPasswordValueKey:
            _getValidationMessage(RegisterConfirmPasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _RegisterViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_RegisterViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _RegisterViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _RegisterViewFocusNodes.values) {
      focusNode.dispose();
    }

    _RegisterViewTextEditingControllers.clear();
    _RegisterViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
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
