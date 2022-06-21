import 'package:collectiva/constants/colors_constants.dart';
import 'package:collectiva/views/items/items_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemsViewModel>.reactive(
      viewModelBuilder: () => ItemsViewModel(),
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
              await model.navigateToAddItem();
            },
            child: const Icon(Icons.add),
            backgroundColor: collectivaPrimary,
          ),
        ),
        backgroundColor: const Color(0xFF1a1f24),
        body: collectionsPage(model),
      ),
    );
  }

  Widget collectionsPage(ItemsViewModel model) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 40),
      child: ListView.builder(
        itemCount: 12, //model.collections.length,
        itemBuilder: (context, index) => AnimatedContainer(
          // height: 60,

          margin: const EdgeInsets.only(top: 5, bottom: 5),
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
               await model.navigateToViewItem();
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
                        child: Image.asset(
                          'assets/images/Collectiva_Logo_256.png',
                          height: 50,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Item Name: Forks",style: TextStyle(
                                color: collectivaLightText, fontSize: 22,
                              ),
                                //     +
                                //     model
                                //         .postedIssues![
                                //     index]!
                                //         .issueTitle!,
                                // style: TextStyle(fontSize: 24),
                              ),
                              // verticalSpaceSmall,
                              Text("Quantity: 15 Objects",
                                  style: TextStyle(
                                    color: collectivaLightText,
                                  ),
                                  //     +
                                  //     DateFormat(
                                  //         "yyyy-MM-dd")
                                  //         .format(model
                                  //         .postedIssues![
                                  //     index]!
                                  //         .dateLogged
                                  //         .toDate()) + "\nat: " + DateFormat('hh:mm:ss').format(model
                                  //     .postedIssues![
                                  // index]!
                                  //     .dateLogged
                                  //     .toDate()),
                                  // style:
                                  // ContentTextStyle,
                                  ),
                              // Text(
                              //   "Status: "
                              //   //     +
                              //   //     model
                              //   //         .postedIssues![
                              //   //     index]!
                              //   //         .issueStatus!,
                              //   // style:
                              //   // ContentTextStyle,
                              // ),
                              Text("Added On: 22-05-2022",
                                  //     +
                                  //     model
                                  //         .postedIssues![
                                  //     index]!
                                  //         .issueStatus!,
                                  style: TextStyle(
                                    color: collectivaLightText,
                                  )
                                  // ContentTextStyle,
                                    ),
                              // verticalSpaceSmall,
                              // Text('Query ID: '+ model.postedIssues![index]!.issueID!, style: ContentTextStyle,),
                            ]),
                      )),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.green),
                        onPressed: () async {
                          await model.navigateToEditItem();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.redAccent),
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
            color: const Color(0xFF4a148c),
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(milliseconds: 500),
        ),
      ),
    );

  }
}
