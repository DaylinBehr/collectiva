// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ResetPasswordValueKey = 'resetPassword';
const String UpdateUserNameValueKey = 'updateUserName';
const String UpdateEmailValueKey = 'updateEmail';

final Map<String, TextEditingController>
    _ResetPasswordViewTextEditingControllers = {};

final Map<String, FocusNode> _ResetPasswordViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ResetPasswordViewTextValidations = {
  ResetPasswordValueKey: null,
  UpdateUserNameValueKey: null,
  UpdateEmailValueKey: null,
};

mixin $ResetPasswordView on StatelessWidget {
  TextEditingController get resetPasswordController =>
      _getFormTextEditingController(ResetPasswordValueKey);
  TextEditingController get updateUserNameController =>
      _getFormTextEditingController(UpdateUserNameValueKey);
  TextEditingController get updateEmailController =>
      _getFormTextEditingController(UpdateEmailValueKey);
  FocusNode get resetPasswordFocusNode =>
      _getFormFocusNode(ResetPasswordValueKey);
  FocusNode get updateUserNameFocusNode =>
      _getFormFocusNode(UpdateUserNameValueKey);
  FocusNode get updateEmailFocusNode => _getFormFocusNode(UpdateEmailValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ResetPasswordViewTextEditingControllers.containsKey(key)) {
      return _ResetPasswordViewTextEditingControllers[key]!;
    }
    _ResetPasswordViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ResetPasswordViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ResetPasswordViewFocusNodes.containsKey(key)) {
      return _ResetPasswordViewFocusNodes[key]!;
    }
    _ResetPasswordViewFocusNodes[key] = FocusNode();
    return _ResetPasswordViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    resetPasswordController.addListener(() => _updateFormData(model));
    updateUserNameController.addListener(() => _updateFormData(model));
    updateEmailController.addListener(() => _updateFormData(model));
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
          ResetPasswordValueKey: resetPasswordController.text,
          UpdateUserNameValueKey: updateUserNameController.text,
          UpdateEmailValueKey: updateEmailController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        ResetPasswordValueKey: _getValidationMessage(ResetPasswordValueKey),
        UpdateUserNameValueKey: _getValidationMessage(UpdateUserNameValueKey),
        UpdateEmailValueKey: _getValidationMessage(UpdateEmailValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ResetPasswordViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_ResetPasswordViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ResetPasswordViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ResetPasswordViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ResetPasswordViewTextEditingControllers.clear();
    _ResetPasswordViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get resetPasswordValue =>
      this.formValueMap[ResetPasswordValueKey] as String?;
  String? get updateUserNameValue =>
      this.formValueMap[UpdateUserNameValueKey] as String?;
  String? get updateEmailValue =>
      this.formValueMap[UpdateEmailValueKey] as String?;

  bool get hasResetPassword =>
      this.formValueMap.containsKey(ResetPasswordValueKey);
  bool get hasUpdateUserName =>
      this.formValueMap.containsKey(UpdateUserNameValueKey);
  bool get hasUpdateEmail => this.formValueMap.containsKey(UpdateEmailValueKey);

  bool get hasResetPasswordValidationMessage =>
      this.fieldsValidationMessages[ResetPasswordValueKey]?.isNotEmpty ?? false;
  bool get hasUpdateUserNameValidationMessage =>
      this.fieldsValidationMessages[UpdateUserNameValueKey]?.isNotEmpty ??
      false;
  bool get hasUpdateEmailValidationMessage =>
      this.fieldsValidationMessages[UpdateEmailValueKey]?.isNotEmpty ?? false;

  String? get resetPasswordValidationMessage =>
      this.fieldsValidationMessages[ResetPasswordValueKey];
  String? get updateUserNameValidationMessage =>
      this.fieldsValidationMessages[UpdateUserNameValueKey];
  String? get updateEmailValidationMessage =>
      this.fieldsValidationMessages[UpdateEmailValueKey];
}

extension Methods on FormViewModel {
  setResetPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ResetPasswordValueKey] = validationMessage;
  setUpdateUserNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UpdateUserNameValueKey] = validationMessage;
  setUpdateEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UpdateEmailValueKey] = validationMessage;
}
