import 'package:collectiva/constants/colors_constants.dart';
import 'package:collectiva/views/collections_add_collection/collections_add_collections_viewmodel.dart';
import 'package:collectiva/views/collections_edit_collection/collections_edit_collections.form.dart';
import 'package:collectiva/views/collections_edit_collection/collections_edit_collections_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(initialValue: '', name: "name"),
  FormTextField(initialValue: '', name: "description"),
  FormTextField(initialValue: '', name: 'goals'),
])
class EditCollectionView extends StatefulWidget with $EditCollectionView{
  final String collectionID;
  EditCollectionView({Key? key, required this.collectionID}) : super(key: key);

  @override
  State<EditCollectionView> createState() => _EditCollectionViewState();
}

class _EditCollectionViewState extends State<EditCollectionView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Widget noImgSvg = SvgPicture.asset(
    'assets/images/no_image.svg',
    semanticsLabel: 'Collectiva No Image',
    height: 80,
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditCollectionViewModel>.reactive(
        viewModelBuilder: () => EditCollectionViewModel(),
        onModelReady: (model) async { await model.loadCollection(widget.collectionID).then((value)
        {
          widget.nameController.text = model.collectionName!;
          widget.descriptionController.text = model.collectionDescription!;
          widget.goalsController.text = model.collectionGoals!;
        });},
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
                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
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
                                                'Details To Edit',
                                                style: TextStyle(
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
                                          child: GestureDetector(
                                              onTap: () async {
                                                await model.pickCamera();
                                              },
                                              child:
                                              model.pickedFile != null && model.pickedFile!.isNotEmpty
                                                  ? Image.network(
                                                model.pickedFile!,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              )
                                                  :
                                              noImgSvg
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: TextFormField(
                                          controller: widget.nameController,
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
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
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
                                          controller: widget.descriptionController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                            labelText: 'Collection Brief Description',
                                            labelStyle: const TextStyle(
                                              color: collectivaLightText,
                                            ),
                                            hintText: 'Enter a description here...',
                                            hintStyle: const TextStyle(
                                              color: collectivaHintText,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: collectivaDarkBG,
                                          ),
                                          style: const TextStyle(
                                              color: collectivaLightText),
                                          // style: FlutterFlowTheme.of(context).bodyText1,
                                          textAlign: TextAlign.start,
                                          maxLines: 3,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: TextFormField(
                                          controller: widget.goalsController,
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
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: collectivaDarkBG,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: collectivaDarkBG,
                                          ),
                                          style: const TextStyle(
                                              color: collectivaLightText),
                                          // style: FlutterFlowTheme.of(context).bodyText1,
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await model
                                                .getGoalCompletionDate(context);
                                            model.notifyListeners();
                                          },
                                          child: SizedBox(
                                              width: double.infinity,
                                              child: model.goalCompleteDate != null
                                                  ? Text("Selected Date: " +
                                                  DateFormat(
                                                      "yyyy-MM-dd")
                                                      .format(model
                                                      .goalCompleteDate!))
                                                  : const Text(
                                                  'Select Goal Completion Date')),
                                          style: ElevatedButton.styleFrom(
                                            primary: collectivaDarkBG,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsetsDirectional.fromSTEB(
                                      //       16, 16, 16, 0),
                                      //   child: TextFormField(
                                      //     // controller: textController4,
                                      //     obscureText: false,
                                      //     decoration: InputDecoration(
                                      //       floatingLabelBehavior:
                                      //           FloatingLabelBehavior.never,
                                      //       labelText: 'Goal Completion Date',
                                      //       labelStyle: const TextStyle(
                                      //         color: collectivaLightText,
                                      //       ),
                                      //       hintText: 'Enter Goal Completion Date',
                                      //       hintStyle: const TextStyle(
                                      //           color: collectivaHintText),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderSide: const BorderSide(
                                      //           color: collectivaDarkBG,
                                      //           width: 1,
                                      //         ),
                                      //         borderRadius: BorderRadius.circular(8),
                                      //       ),
                                      //       focusedBorder: OutlineInputBorder(
                                      //         borderSide: const BorderSide(
                                      //           color: collectivaDarkBG,
                                      //           width: 1,
                                      //         ),
                                      //         borderRadius: BorderRadius.circular(8),
                                      //       ),
                                      //       filled: true,
                                      //       fillColor: collectivaDarkBG,
                                      //     ),
                                      //     textAlign: TextAlign.start,
                                      //     keyboardType: TextInputType.datetime,
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: InkWell(
                                          onTap: () async {},
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.8,
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      model.editCollection(
                                                          name: widget
                                                              .nameController.text
                                                              .trim(),
                                                          description: widget
                                                              .descriptionController
                                                              .text
                                                              .trim(),
                                                          goal: widget
                                                              .goalsController.text
                                                              .trim());
                                                    },
                                                    child: const Text('Update'),
                                                    style: ElevatedButton.styleFrom(
                                                      primary: collectivaPrimary,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
