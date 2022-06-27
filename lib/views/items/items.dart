import 'package:collectiva/constants/colors_constants.dart';
import 'package:collectiva/views/items/items_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ItemsView extends StatelessWidget {
  final String collectionID;
  static const String assetName = 'assets/images/no_image.svg';
  ItemsView({Key? key, required this.collectionID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemsViewModel>.reactive(
      viewModelBuilder: () => ItemsViewModel(),
      onModelReady: (model) async{ await model.fetchItems(collectionID);},
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title:  const Text('Items in Collection',
                          style: TextStyle(fontSize: 32)),
          centerTitle: true,
          backgroundColor: const Color(0xFF131619),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Tooltip(
          message: 'Add Item',
          child: FloatingActionButton.small(
            onPressed: () async{
              await model.navigateToAddItem(collectionID);
            },
            child: const Icon(Icons.add),
            backgroundColor: collectivaPrimary,
          ),
        ),
        backgroundColor: const Color(0xFF1a1f24),
        body: itemsPage(model),
      ),
    );
  }


  final Widget noImgSvg = SvgPicture.asset(
    assetName,
    semanticsLabel: 'Collectiva No Image',
    height: 80,
  );
  Widget itemsPage(ItemsViewModel model) {
    return !model.isBusy
        ? Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 40),
      child: model.postedItems != null &&
          model.postedItems!.isNotEmpty
          ? ListView.builder(
        itemCount: model
            .postedItems?.length, //model.collections.length,
        itemBuilder: (context, index) => AnimatedContainer(
          // height: 60,

          margin: const EdgeInsets.only(top: 10, bottom: 10),
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                await model.navigateToViewItem(
                    model.postedItems![index]!.id!);
              },
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: model.postedItems![index]!
                            .image ==
                            null
                            ? noImgSvg
                            : model
                            .postedItems![index]!
                            .image!
                            .isEmpty!
                            ? noImgSvg
                            : Image.network(
                          model.postedItems![index]!
                              .image!,
                          height: 80,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Collection Name:\n${model.postedItems![index]?.name}",
                                    //     +
                                    //     model
                                    //         .postedIssues![
                                    //     index]!
                                    //         .issueTitle!,
                                    style:
                                    const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    "Quantity:\n${model.postedItems![index]?.quantity}",
                                    //     +
                                    //     model
                                    //         .postedIssues![
                                    //     index]!
                                    //         .issueTitle!,
                                    style:
                                    const TextStyle(fontSize: 24),
                                  ),
                                  // verticalSpaceSmall,
                                  Text(
                                    "Created on: " +
                                        DateFormat("yyyy-MM-dd").format(
                                            model
                                                .postedItems![
                                            index]!
                                                .createdOn!
                                                .toDate()),
                                  ),
                                ]),
                          )),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          await model.navigateToEditItem(model
                              .postedItems![index]!
                              .id!);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () async {
                          // await model.deletePost(model.postedIssues![index]!.issueID!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF42bea5),
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(milliseconds: 500),
        ),
      )
          : model.postedItems != null &&
          model.postedItems!.isEmpty
          ? const Center(
        child: Text(
          'Create an Item by clicking the plus button below',
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      )
          : const Center(
        child: Text(
          'You have not created an Item yet!',
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    )
        : const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.grey),
      ),
    );
  }
}
