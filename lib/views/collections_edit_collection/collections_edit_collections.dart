import 'package:collectiva/constants/colors_constants.dart';
import 'package:collectiva/views/collections_add_collection/collections_add_collections_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditCollectionView extends StatefulWidget {
  const EditCollectionView({Key? key}) : super(key: key);

  @override
  State<EditCollectionView> createState() => _EditCollectionViewState();
}

class _EditCollectionViewState extends State<EditCollectionView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCollectionViewModel>.reactive(
        viewModelBuilder: () => AddCollectionViewModel(),
        builder: (context, model, child) => Scaffold(
              key: scaffoldKey,
              backgroundColor: collectivaTertiary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 0,
                automaticallyImplyLeading: false,
                // title: Text('Add Collection'),
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            model.navigateToCollections();
                          },
                          borderRadius: BorderRadius.circular(40),
                          child: Tooltip(
                            message: 'Cancel',
                            verticalOffset: -18,
                            margin: const EdgeInsets.only(right: 60),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: collectivaBlackBG,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Material(
                              color: Colors.transparent,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height * 1,
                                // color: collectivaBlackBG,
                                decoration: const BoxDecoration(
                                  color: collectivaBlackBG,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 7,
                                      color: Color(0x5D000000),
                                      offset: Offset(0, -2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 10, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: const <Widget>[
                                            Text(
                                              'Edit Collection',
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: const <Widget>[
                                            Expanded(
                                              child: Text(
                                                'Edit this collection.', style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            'https://picsum.photos/seed/1010/600',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: TextFormField(
                                          // controller: textController1,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: 'Collection Name',
                                            labelStyle: const TextStyle(
                                              color: collectivaLightText,
                                            ),
                                            hintText:
                                                'Enter your collection name here....',
                                            hintStyle: const TextStyle(
                                              color: collectivaHintText,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: collectivaDarkBG,
                                          ),
                                          style: const TextStyle(
                                              color: collectivaLightText),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: TextFormField(
                                          // controller: textController2,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText:
                                                'Collection Brief Description',
                                            labelStyle: const TextStyle(
                                              color: collectivaLightText,
                                            ),
                                            hintText:
                                                'Enter a description here...',
                                            hintStyle: const TextStyle(
                                              color: collectivaHintText,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: collectivaDarkBG,
                                          ),
                                          // style: FlutterFlowTheme.of(context).bodyText1,
                                          textAlign: TextAlign.start,
                                          maxLines: 3,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: TextFormField(
                                          // controller: textController3,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText:
                                                'Collection Goal Object Amount',
                                            labelStyle: const TextStyle(
                                              color: collectivaLightText,
                                            ),
                                            hintText:
                                                'Enter amount of items to be reached',
                                            hintStyle: const TextStyle(
                                              color: collectivaHintText,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: collectivaDarkBG,
                                          ),
                                          // style: FlutterFlowTheme.of(context).bodyText1,
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: TextFormField(
                                          // controller: textController4,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: 'Goal Completion Date',
                                            labelStyle: const TextStyle(
                                              color: collectivaLightText,
                                            ),
                                            hintText:
                                                'Enter Goal Completion Date',
                                            hintStyle: const TextStyle(
                                                color: collectivaHintText),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: collectivaDarkBG,
                                          ),
                                          // style: FlutterFlowTheme.of(context).bodyText1,
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType.datetime,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            // await DatePicker.showDatePicker(
                                            //   context,
                                            //   showTitleActions: true,
                                            //   onConfirm: (date) {
                                            //     setState(() => datePicked = date);
                                            //   },
                                            // currentTime: getCurrentTimestamp,
                                            // minTime: DateTime(0, 0, 0),
                                            // );
                                          },
                                          child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.all(8.0),
                                                //   child: SizedBox(
                                                //       width:
                                                //           MediaQuery.of(context)
                                                //                   .size
                                                //                   .width *
                                                //               0.3,
                                                //       height: 50,
                                                //       child: ElevatedButton(
                                                //         onPressed: () {
                                                //           model.navigateToCollections();
                                                //         },
                                                //         child: const Text('Cancel'),
                                                //         style: ElevatedButton
                                                //             .styleFrom(
                                                //                 primary:
                                                //                     collectivaDarkBG,
                                                //                 shape: RoundedRectangleBorder(
                                                //                   borderRadius: BorderRadius.circular(8),
                                                //                 )),
                                                //       )),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height: 50,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          model.navigateToCollections();
                                                        },
                                                        child: const Text('Save'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary:
                                                                    collectivaPrimary,shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8),), ),
                                                      )),
                                                ),
                                              ]),
                                        ),
                                      ),

                                      // Padding(
                                      //   padding:
                                      //   EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                                      //   child: Row(
                                      //     mainAxisSize: MainAxisSize.max,
                                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      //     children: [
                                      // FFButtonWidget(
                                      //   onPressed: () async {
                                      //     Navigator.pop(context);
                                      //   },
                                      //   text: 'Cancel',
                                      //   options: FFButtonOptions(
                                      //     width: 130,
                                      //     height: 50,
                                      //     color: Color(0xFF414042),
                                      //     textStyle: FlutterFlowTheme.of(context)
                                      //         .subtitle2
                                      //         .override(
                                      //       fontFamily: 'Lexend Deca',
                                      //       color: Colors.white,
                                      //     ),
                                      //     borderSide: BorderSide(
                                      //       color: Colors.transparent,
                                      //       width: 1,
                                      //     ),
                                      //     borderRadius: 12,
                                      //   ),
                                      // ),
                                      // FFButtonWidget(
                                      //   onPressed: () async {
                                      //     await Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             CreateObjectPageWidget(),
                                      //       ),
                                      //     );
                                      //   },
                                      //   text: 'Create Collection',
                                      //   options: FFButtonOptions(
                                      //     width: 150,
                                      //     height: 50,
                                      //     color:
                                      //     FlutterFlowTheme.of(context).primaryColor,
                                      //     textStyle:
                                      //     FlutterFlowTheme.of(context).subtitle2,
                                      //     elevation: 3,
                                      //     borderSide: BorderSide(
                                      //       color: Colors.transparent,
                                      //       width: 1,
                                      //     ),
                                      //     borderRadius: 8,
                                      //   ),
                                      // ),
                                      // ],
                                      // ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
