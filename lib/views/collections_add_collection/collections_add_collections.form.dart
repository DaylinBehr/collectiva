// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String NameValueKey = 'name';
const String DescriptionValueKey = 'description';
const String GoalsValueKey = 'goals';

final Map<String, TextEditingController>
    _AddCollectionViewTextEditingControllers = {};

final Map<String, FocusNode> _AddCollectionViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AddCollectionViewTextValidations = {
  NameValueKey: null,
  DescriptionValueKey: null,
  GoalsValueKey: null,
};

mixin $AddCollectionView on StatefulWidget {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get goalsController =>
      _getFormTextEditingController(GoalsValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get goalsFocusNode => _getFormFocusNode(GoalsValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AddCollectionViewTextEditingControllers.containsKey(key)) {
      return _AddCollectionViewTextEditingControllers[key]!;
    }
    _AddCollectionViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddCollectionViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddCollectionViewFocusNodes.containsKey(key)) {
      return _AddCollectionViewFocusNodes[key]!;
    }
    _AddCollectionViewFocusNodes[key] = FocusNode();
    return _AddCollectionViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    goalsController.addListener(() => _updateFormData(model));
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
          NameValueKey: nameController.text,
          DescriptionValueKey: descriptionController.text,
          GoalsValueKey: goalsController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        NameValueKey: _getValidationMessage(NameValueKey),
        DescriptionValueKey: _getValidationMessage(DescriptionValueKey),
        GoalsValueKey: _getValidationMessage(GoalsValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AddCollectionViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_AddCollectionViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddCollectionViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddCollectionViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddCollectionViewTextEditingControllers.clear();
    _AddCollectionViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get goalsValue => this.formValueMap[GoalsValueKey] as String?;

  bool get hasName => this.formValueMap.containsKey(NameValueKey);
  bool get hasDescription => this.formValueMap.containsKey(DescriptionValueKey);
  bool get hasGoals => this.formValueMap.containsKey(GoalsValueKey);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasGoalsValidationMessage =>
      this.fieldsValidationMessages[GoalsValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get goalsValidationMessage =>
      this.fieldsValidationMessages[GoalsValueKey];
}

extension Methods on FormViewModel {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setGoalsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[GoalsValueKey] = validationMessage;
}
