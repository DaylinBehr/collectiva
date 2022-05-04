import 'package:collectiva/views/auth_flow_views/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: Color(0xFF1A1F24),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(30),
                            color: Color(0xFF42BEA5),
                          ),
                          width: screenSize.width,
                          height: 200,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                     Expanded(child: Padding(padding: const EdgeInsetsDirectional.fromSTEB(24,0,23,0), child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextField(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,

                                ),
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: screenSize.height * 0.08,
                                width: screenSize.width * 0.6,
                                child: ElevatedButton(
                                  onPressed: () {
                                    model.login();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFF414042)),
                                  child: const Text('Login',style: TextStyle(fontSize: 24),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),),

                    // const SizedBox(
                    //   height: 20,
                    // ),

                  ],
                ),
              ),
            ));
  }
}
