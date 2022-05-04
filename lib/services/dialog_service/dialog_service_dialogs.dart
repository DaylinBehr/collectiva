// import 'package:flutter/material.dart';
// import 'package:my_rcl/constants/colours_constants.dart';
// import 'package:my_rcl/constants/text_style_constants.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import '../../app.locator.dart';
// import 'dialog_service_dialogs_viewmodel.dart';
//
// enum DialogType {
//   alertSuccessDialog,
//   alertErrorDialog,
//   alertProcessingDialog
// }
//
// void setupDialogUi() {
//   final dialogService = locator<DialogService>();
//
//   final builders = {
//     DialogType.alertSuccessDialog: (context, sheetRequest, completer) =>
//         _AlertSuccessDialog(request: sheetRequest, completer: completer),
//     DialogType.alertProcessingDialog: (context, sheetRequest, completer) =>
//         _AlertProcessingDialog(request: sheetRequest, completer: completer),
//     DialogType.alertErrorDialog: (context, sheetRequest, completer) =>
//         _AlertErrorDialog(request: sheetRequest, completer: completer),
//   };
//
//   dialogService.registerCustomDialogBuilders(builders);
// }
//
// class _AlertSuccessDialog extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const _AlertSuccessDialog(
//       {Key? key, required this.request, required this.completer})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<DialogServiceViewModel>.reactive(
//       builder: (context, model, child) => AlertDialog(
//         title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
//           Flexible(child: Text(request.title!,textAlign: TextAlign.center,)),
//           Icon(
//             Icons.info_sharp,
//             color: rclBlue,
//           )
//         ]),
//         content: Text(request.description!, style: AlertSuccessDialogTextStyle, textAlign: TextAlign.center,),
//         actions: [
//           GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () async {
//               return await completer(
//                 DialogResponse(
//                   confirmed: true,
//                 ),
//               );
//             },
//             child: Container(
//               child: request.showIconInMainButton!
//                   ? Icon(Icons.check_circle_sharp)
//                   : Text(request.mainButtonTitle!,
//                       style: DialogButtonTextStyle),
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: rclGreen,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             ),
//           ),
//         ],
//       ),
//       viewModelBuilder: () =>
//           DialogServiceViewModel(), /* Build your dialog UI here */
//     );
//   }
// }
//
// class _AlertProcessingDialog extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const _AlertProcessingDialog(
//       {Key? key, required this.request, required this.completer})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<DialogServiceViewModel>.reactive(
//       builder: (context, model, child) => WillPopScope(
//         onWillPop: () async => false,
//         child: AlertDialog(
//           title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Flexible(child: Text(request.title!,textAlign: TextAlign.center,)),
//                 Icon(
//                   Icons.info_sharp,
//                   color: rclBlue,
//                 )
//               ]),
//           content: Container(
//             height: 220,
//             // width: ,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: SingleChildScrollView(
//               child: Column(children: <Widget>[
//                 CircularProgressIndicator(),
//                 SizedBox(height: 10.0,),
//                 Text(request.description!, style: AlertProcessingDialogTextStyle,textAlign: TextAlign.center,),
//               ]),
//             ),
//           ),
//           actions: [
//             // GestureDetector(
//             //   behavior: HitTestBehavior.translucent,
//             //   onTap: () async {
//             //     return await completer(
//             //       DialogResponse(
//             //         confirmed: true,
//             //       ),
//             //     );
//             //   },
//             //   child: Container(
//             //     child: request.showIconInMainButton!
//             //         ? Icon(Icons.check_circle_sharp)
//             //         : Text(request.mainButtonTitle!,
//             //             style: DialogButtonTextStyle),
//             //     alignment: Alignment.center,
//             //     padding: const EdgeInsets.symmetric(vertical: 10),
//             //     width: double.infinity,
//             //     decoration: BoxDecoration(
//             //       color: shavesRed,
//             //       borderRadius: BorderRadius.circular(5),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//       viewModelBuilder: () =>
//           DialogServiceViewModel(), /* Build your dialog UI here */
//     );
//   }
// }
//
// class _AlertErrorDialog extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const _AlertErrorDialog(
//       {Key? key, required this.request, required this.completer})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
//         Flexible(child: Text(request.title!,textAlign: TextAlign.center,)),
//         Icon(
//           Icons.error_sharp,
//           color: rclRed,
//         )
//       ]),
//       content: Text(request.description!, style: AlertErrorDialogTextStyle,textAlign: TextAlign.center,),
//       actions: [
//         GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () async {
//             return await completer(
//               DialogResponse(
//                 confirmed: true,
//               ),
//             );
//           },
//           child: Container(
//             child: request.showIconInMainButton!
//                 ? Icon(Icons.check_circle_sharp)
//                 : Text(request.mainButtonTitle!, style: DialogButtonTextStyle),
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: rclRed,
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//         ),
//       ], /* Build your dialog UI here */
//     );
//   }
// }
