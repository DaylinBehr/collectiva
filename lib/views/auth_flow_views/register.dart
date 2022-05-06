import 'package:collectiva/views/auth_flow_views/register.form.dart';
import 'package:collectiva/views/auth_flow_views/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(initialValue: '', isPassword: false, name: "registerUserName"),
  FormTextField(name: 'registerEmail', isPassword: false, initialValue: ''),
  FormTextField(name: 'registerPassword', isPassword: true, initialValue: ''),
  FormTextField(
      name: 'registerConfirmPassword', isPassword: true, initialValue: ''),
])
class RegisterView extends StatelessWidget with $RegisterView {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Register'),
                toolbarHeight: screenSize.height * 0.15,
                backgroundColor: const Color(0xFF42BEA5),
                titleTextStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: const Color(0xFF1A1F24),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24, 20, 24, 20),
                        child: Form(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                TextFormField(
                                  obscureText: false,
                                  controller: registerUserNameController,
                                  focusNode: registerUserNameFocusNode,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    enabledBorder:  OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: const Color(0xFF359F8A),
                                        width: 1,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: const Color(0xFFF2F2F2),
                                        width: 1,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    hintText: 'Enter your username',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFF359F8A),
                                    prefixIcon: const Icon(
                                      Icons.person_outlined,
                                      color: Color(0x80FFFFFF),
                                    ),
                                    labelText: 'Username',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
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
                                  controller: registerEmailController,
                                  focusNode: registerEmailFocusNode,
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
                                        color: const Color(0xFFF2F2F2),
                                        width: 1,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFF359F8A),
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Color(0x80FFFFFF),
                                    ),
                                    labelText: 'Email',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
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
                                  obscureText: model.isPasswordHidden,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  controller: registerPasswordController,
                                  focusNode: registerPasswordFocusNode,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    enabledBorder:  OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: const Color(0xFF359F8A),
                                        width: 1,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    focusedBorder:  OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: const Color(0xFFF2F2F2),
                                        width: 1,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    hintText: 'Enter your password',
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
                                      onTap: () =>
                                          model.setPasswordVisibility(),
                                      child: Icon(
                                        model.isPasswordHidden
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0x80FFFFFF),
                                        size: 22,
                                      ),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  // keyboardType: TextInputType.,
                                  validator: (inputText) {
                                    if (inputText!.isEmpty) {
                                      return 'Please enter a password!';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: model.isPasswordHidden,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  controller: registerConfirmPasswordController,
                                  focusNode: registerConfirmPasswordFocusNode,
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
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFF2F2F2),
                                        width: 1,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    hintText: 'Confirm your password',
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
                                      onTap: () =>
                                          model.setPasswordVisibility(),
                                      child: Icon(
                                        model.isPasswordHidden
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0x80FFFFFF),
                                        size: 22,
                                      ),
                                    ),
                                    labelText: 'Confirm Password',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  // keyboardType: TextInputType.,
                                  validator: (inputText) {
                                    if (inputText!.isEmpty) {
                                      return 'Please enter your correct password!';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.08,
                                  width: screenSize.width * 0.6,
                                  child: ElevatedButton(
                                    onPressed: ()async {
                                      await model.navigateToLogin();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF414042),shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),),),
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      const Text(
                                        'Already have an account?',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await model.navigateToLogin();
                                        },
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
            ));
  }
}
