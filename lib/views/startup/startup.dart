import 'package:collectiva/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const String assetName = 'assets/images/Collectiva_Logo_256.svg';
    final Widget svg =
        SvgPicture.asset(assetName, semanticsLabel: 'Collectiva Logo', height: screenSize.height * 0.3,);
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) async => await model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Collectiva'),
          centerTitle: true,
          backgroundColor: const Color(0xFF131619),
          elevation: 0,
          toolbarHeight: screenSize.height * 0.15,
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF131619),
        body: model.isBusy
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                ),
              )
            : OrientationBuilder(
                builder: (context, orientation) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(10),
                          child: svg,
                          // Image.asset(
                          //   'assets/images/Collectiva_Logo_256.png',
                          //   height: screenSize.height * 0.3,
                          // ),
                        ),
                        Padding(
                          padding: orientation == Orientation.portrait
                              ? const EdgeInsetsDirectional.fromSTEB(
                                  0, 40, 0, 0)
                              : const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: screenSize.width * 0.8,
                                  height: orientation == Orientation.portrait
                                      ? screenSize.height * 0.07
                                      : 40,
                                  child: ElevatedButton(
                                    onPressed: () async => await model.navigateToRegisterView(),
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF414042),shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),),),
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: screenSize.width * 0.8,
                                  height: orientation == Orientation.portrait
                                      ? screenSize.height * 0.07
                                      : 40,
                                  child: ElevatedButton(
                                    onPressed: () async => await model.navigateToLoginView(),
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF359F8A),shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),),),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(fontSize: 24),
                                    ),
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
    );
  }
}
