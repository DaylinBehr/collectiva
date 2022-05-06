import 'package:collectiva/views/account/account_management_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../constants/colors_constants.dart';
import 'account_management.form.dart';

@FormView(fields: [
  FormTextField(name: 'resetPassword', isPassword: true, initialValue: ''),
  FormTextField(name: 'updateUserName', isPassword: false, initialValue: ''),
  FormTextField(name: 'updateEmail', isPassword: false, initialValue: '')
])
class ResetPasswordView extends StatelessWidget with $ResetPasswordView {
  ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: collectivaBlackBG,
        appBar: AppBar(
          title: const Text('Reset Password'),
          actions: [
            Tooltip(
              message: 'Save',
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: model.save,
              ),
            ),
          ],
          centerTitle: true,
          toolbarHeight: 120,
          backgroundColor: collectivaBlackBG,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: collectivaDarkBG,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: model.isPasswordHidden,
                enableSuggestions: false,
                autocorrect: false,
                controller: resetPasswordController,
                focusNode: resetPasswordFocusNode,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF359F8A),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF2F2F2),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter your new password',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  filled: true,
                  fillColor: const Color(0xFF359F8A),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0x80FFFFFF),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => model.setPasswordVisibility(),
                    child: Icon(
                      model.isPasswordHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0x80FFFFFF),
                      size: 22,
                    ),
                  ),
                  labelText: 'Password Reset',
                  labelStyle: TextStyle(
                    color: Colors.grey[300],
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                // keyboardType: TextInputType.,
                validator: (inputText) {
                  if (inputText!.isEmpty) {
                    return 'Please enter a password!';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class EditProfileView extends StatelessWidget with $ResetPasswordView{
  EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: collectivaBlackBG,
        appBar: AppBar(
          title: const Text('Reset Password'),
          actions: [
            Tooltip(
              message: 'Save',
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: model.save,
              ),
            ),
          ],
          centerTitle: true,
          toolbarHeight: 120,
          backgroundColor: collectivaBlackBG,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: collectivaDarkBG,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    obscureText: false,
                    controller: updateUserNameController,
                    focusNode: updateUserNameFocusNode,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF359F8A),
                          width: 1,
                        ),
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFF2F2F2),
                          width: 1,
                        ),
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      hintText: 'Enter your new username',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      filled: true,
                      fillColor: const Color(0xFF359F8A),
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: Color(0x80FFFFFF),
                      ),
                      labelText: 'Update Username',
                      labelStyle: TextStyle(
                        color: Colors.grey[300],
                      ),
                      floatingLabelBehavior:
                      FloatingLabelBehavior.auto,
                    ),
                    keyboardType: TextInputType.name,
                    validator: (inputText) {
                      if (inputText!.isEmpty) {
                        return 'Please fill in a valid email address...';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: false,
                    controller: updateEmailController,
                    focusNode: updateEmailFocusNode,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF359F8A),
                          width: 1,
                        ),
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFF2F2F2),
                          width: 1,
                        ),
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      hintText: 'Enter your new email',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      filled: true,
                      fillColor: const Color(0xFF359F8A),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color(0x80FFFFFF),
                      ),
                      labelText: 'Update Email',
                      labelStyle: TextStyle(
                        color: Colors.grey[300],
                      ),
                      floatingLabelBehavior:
                      FloatingLabelBehavior.auto,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (inputText) {
                      if (inputText!.isEmpty) {
                        return 'Please fill in a valid email address...';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
