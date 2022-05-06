// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ResetPasswordValueKey = 'resetPassword';
const String UpdateUserNameValueKey = 'updateUserName';
const String UpdateEmailValueKey = 'updateEmail';

mixin $ResetPasswordView on StatelessWidget {
  final TextEditingController resetPasswordController =
      TextEditingController(text: '');
  final TextEditingController updateUserNameController =
      TextEditingController(text: '');
  final TextEditingController updateEmailController =
      TextEditingController(text: '');
  final FocusNode resetPasswordFocusNode = FocusNode();
  final FocusNode updateUserNameFocusNode = FocusNode();
  final FocusNode updateEmailFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    resetPasswordController.addListener(() => _updateFormData(model));
    updateUserNameController.addListener(() => _updateFormData(model));
    updateEmailController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            ResetPasswordValueKey: resetPasswordController.text,
            UpdateUserNameValueKey: updateUserNameController.text,
            UpdateEmailValueKey: updateEmailController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    resetPasswordController.dispose();
    resetPasswordFocusNode.dispose();
    updateUserNameController.dispose();
    updateUserNameFocusNode.dispose();
    updateEmailController.dispose();
    updateEmailFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
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
