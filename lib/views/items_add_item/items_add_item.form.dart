// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String NameValueKey = 'name';
const String DescriptionValueKey = 'description';
const String QuantityValueKey = 'quantity';
const String CustomkeyValueKey = 'customkey';
const String CustomValueValueKey = 'customValue';

final Map<String, TextEditingController>
    __AddItemViewStateTextEditingControllers = {};

final Map<String, FocusNode> __AddItemViewStateFocusNodes = {};

final Map<String, String? Function(String?)?>
    __AddItemViewStateTextValidations = {
  NameValueKey: null,
  DescriptionValueKey: null,
  QuantityValueKey: null,
  CustomkeyValueKey: null,
  CustomValueValueKey: null,
};

mixin $_AddItemViewState on StatefulWidget {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get quantityController =>
      _getFormTextEditingController(QuantityValueKey);
  TextEditingController get customkeyController =>
      _getFormTextEditingController(CustomkeyValueKey);
  TextEditingController get customValueController =>
      _getFormTextEditingController(CustomValueValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get quantityFocusNode => _getFormFocusNode(QuantityValueKey);
  FocusNode get customkeyFocusNode => _getFormFocusNode(CustomkeyValueKey);
  FocusNode get customValueFocusNode => _getFormFocusNode(CustomValueValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (__AddItemViewStateTextEditingControllers.containsKey(key)) {
      return __AddItemViewStateTextEditingControllers[key]!;
    }
    __AddItemViewStateTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return __AddItemViewStateTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (__AddItemViewStateFocusNodes.containsKey(key)) {
      return __AddItemViewStateFocusNodes[key]!;
    }
    __AddItemViewStateFocusNodes[key] = FocusNode();
    return __AddItemViewStateFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    quantityController.addListener(() => _updateFormData(model));
    customkeyController.addListener(() => _updateFormData(model));
    customValueController.addListener(() => _updateFormData(model));
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
          QuantityValueKey: quantityController.text,
          CustomkeyValueKey: customkeyController.text,
          CustomValueValueKey: customValueController.text,
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
        QuantityValueKey: _getValidationMessage(QuantityValueKey),
        CustomkeyValueKey: _getValidationMessage(CustomkeyValueKey),
        CustomValueValueKey: _getValidationMessage(CustomValueValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = __AddItemViewStateTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(__AddItemViewStateTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in __AddItemViewStateTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in __AddItemViewStateFocusNodes.values) {
      focusNode.dispose();
    }

    __AddItemViewStateTextEditingControllers.clear();
    __AddItemViewStateFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get quantityValue => this.formValueMap[QuantityValueKey] as String?;
  String? get customkeyValue => this.formValueMap[CustomkeyValueKey] as String?;
  String? get customValueValue =>
      this.formValueMap[CustomValueValueKey] as String?;

  bool get hasName => this.formValueMap.containsKey(NameValueKey);
  bool get hasDescription => this.formValueMap.containsKey(DescriptionValueKey);
  bool get hasQuantity => this.formValueMap.containsKey(QuantityValueKey);
  bool get hasCustomkey => this.formValueMap.containsKey(CustomkeyValueKey);
  bool get hasCustomValue => this.formValueMap.containsKey(CustomValueValueKey);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasQuantityValidationMessage =>
      this.fieldsValidationMessages[QuantityValueKey]?.isNotEmpty ?? false;
  bool get hasCustomkeyValidationMessage =>
      this.fieldsValidationMessages[CustomkeyValueKey]?.isNotEmpty ?? false;
  bool get hasCustomValueValidationMessage =>
      this.fieldsValidationMessages[CustomValueValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get quantityValidationMessage =>
      this.fieldsValidationMessages[QuantityValueKey];
  String? get customkeyValidationMessage =>
      this.fieldsValidationMessages[CustomkeyValueKey];
  String? get customValueValidationMessage =>
      this.fieldsValidationMessages[CustomValueValueKey];
}

extension Methods on FormViewModel {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setQuantityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[QuantityValueKey] = validationMessage;
  setCustomkeyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CustomkeyValueKey] = validationMessage;
  setCustomValueValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CustomValueValueKey] = validationMessage;
}
