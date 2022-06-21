import 'package:collectiva/constants/colors_constants.dart';

// import 'package:collectiva/views/items_edit_item/items_edit_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'items_edit_item_viewmodel.dart';

class EditItemView extends StatefulWidget {
  const EditItemView({Key? key}) : super(key: key);

  @override
  State<EditItemView> createState() => _EditItemViewState();
}

class _EditItemViewState extends State<EditItemView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditItemViewModel>.reactive(
      viewModelBuilder: () => EditItemViewModel(),
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
                      model.navigateToItems();
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
                                        'Edit Item',
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
                                          'Edit this Item in the Collection.',
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
                                      labelText: 'Item Name',
                                      labelStyle: const TextStyle(
                                        color: collectivaLightText,
                                      ),
                                      hintText: 'Enter the Item name here....',
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
                                    // controller: textController2,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      labelText: 'Item Brief Description',
                                      labelStyle: const TextStyle(
                                        color: collectivaLightText,
                                      ),
                                      hintText:
                                          'Enter a description of the Item here...',
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
                                      labelText: 'Item Quantity',
                                      labelStyle: const TextStyle(
                                        color: collectivaLightText,
                                      ),
                                      hintText:
                                          'Enter amount of Items to be stored',
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
                                      labelText: 'Acquisition Date',
                                      labelStyle: const TextStyle(
                                        color: collectivaLightText,
                                      ),
                                      hintText: 'Date Acquired',
                                      hintStyle: const TextStyle(
                                          color: collectivaHintText),
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
                                    // style: FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.datetime,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Divider(
                                    thickness: 1,
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Text(
                                    'Custom Fields',
                                    style: TextStyle(
                                        color: collectivaLightText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                                      labelText: 'Custom Field Name/Key',
                                      labelStyle: const TextStyle(
                                        color: collectivaLightText,
                                      ),
                                      hintText:
                                          'Enter the Custom Field Name/Key here....',
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
                                    // controller: textController1,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      labelText: 'Custom Field Value',
                                      labelStyle: const TextStyle(
                                        color: collectivaLightText,
                                      ),
                                      hintText:
                                          'Enter the Custom Field Value here....',
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
                                  child: SizedBox(
                                    child: ElevatedButton(
                                      child: Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const <Widget>[
                                          Icon(
                                            Icons.add_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Add Custom Field',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        model.customCount++;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: collectivaSecondary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        onTap: () {},
                                        // selectedTileColor: collectivaDarkBG,
                                        title: const Text(
                                          'Custom Field',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        subtitle: const Text(
                                          'Custom Value',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.delete_outline,
                                              color: Colors.white),
                                          onPressed: () {
                                            if (model.customCount > 0) {
                                              model.customCount--;
                                            }
                                          },
                                        ),
                                      );
                                    },
                                    itemCount: model.customCount,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Divider(
                                    thickness: 1,
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                ),
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
                                              onPressed: () {
                                                model.navigateToItems();
                                              },
                                              child: const Text('Save'),
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
      ),
    );
  }
}
