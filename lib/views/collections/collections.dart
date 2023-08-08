import 'package:collectiva/constants/colors_constants.dart';
import 'package:collectiva/views/collections/collections_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class CollectionsView extends StatelessWidget {
  CollectionsView({Key? key}) : super(key: key);
  static const String assetName = 'assets/images/no_image.svg';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CollectionsViewModel>.reactive(
      viewModelBuilder: () => CollectionsViewModel(),
      onModelReady: (model) async => await model.getUsername(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: model.currentIndex == 0
              ? const Text('Collections', style: TextStyle(fontSize: 40))
              : model.currentIndex == 1
                  ? const Text('Goals', style: TextStyle(fontSize: 40))
                  : model.currentIndex == 2
                      ? Column(children: <Widget>[
                          const Text('Account', style: TextStyle(fontSize: 40)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Welcome ${model.name}',
                              style: const TextStyle(fontSize: 20)),
                        ])
                      : const Text('Collections',
                          style: TextStyle(fontSize: 40)),
          centerTitle: true,
          toolbarHeight: (model.currentIndex == 2) ? 120 : 60,
          backgroundColor: const Color(0xFF131619),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF131619),
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0x80FFFFFF),
          selectedItemColor: const Color(0xFFFFFFFF),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.playlist_add, color: Colors.white),
              icon: Icon(Icons.playlist_add_outlined),
              label: 'My Collections',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              activeIcon: Icon(Icons.star, color: Colors.white),
              label: 'Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person, color: Colors.white),
              label: 'Account',
            ),
          ],
        ),
        backgroundColor: const Color(0xFF1a1f24),
        body: model.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : getViewsForIndex(context, model.currentIndex, model),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.small(
            child: const Icon(Icons.add),
            backgroundColor: const Color(0xFF359F8A),
            onPressed: () async => await model
                .navigateToAddCollection()
            ),
      ),
    );
  }

  final Widget noImgSvg = SvgPicture.asset(
    assetName,
    semanticsLabel: 'Collectiva No Image',
    height: 80,
  );

  Widget collectionsPage(CollectionsViewModel model) {
    return !model.isBusy
        ? Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 40),
            child: model.postedCollections != null &&
                    model.postedCollections!.isNotEmpty
                ? ListView.builder(
                    itemCount: model
                        .postedCollections?.length,
                    itemBuilder: (context, index) => AnimatedContainer(
                      // height: 60,

                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            await model.navigateToItems(
                                model.postedCollections![index]!.collectionID!);
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
                                    child: model.postedCollections![index]!
                                                .collectionImageLocation ==
                                            null
                                        ? noImgSvg
                                        : model
                                                .postedCollections![index]!
                                                .collectionImageLocation!
                                                .isEmpty!
                                            ? noImgSvg
                                            : Image.network(
                                                model.postedCollections![index]!
                                                    .collectionImageLocation!,
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
                                            "Collection Name:\n${model.postedCollections![index]?.collectionName}",
                                            style:
                                                const TextStyle(fontSize: 24),
                                          ),
                                          // verticalSpaceSmall,
                                          Text(
                                            "Created on: " +
                                                DateFormat("yyyy-MM-dd").format(
                                                    model
                                                        .postedCollections![
                                                            index]!
                                                        .collectionCreateDate!
                                                        .toDate()),
                                          ),
                                        ]),
                                  )),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () async {
                                      await model.navigateToEditCollection(model
                                          .postedCollections![index]!
                                          .collectionID!);
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
                : model.postedCollections != null &&
                        model.postedCollections!.isEmpty
                    ? const Center(
                        child: Text(
                          'Create a collection by clicking the plus button below',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const Center(
                        child: Text(
                          'You have not created a Collection yet!',
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

  Widget goalsPage(CollectionsViewModel model) {
    return !model.isBusy
        ? Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 40),
            child: model.postedCollections != null &&
                    model.postedCollections!.isNotEmpty
                ? ListView.builder(
                    itemCount: 12, //model.collections.length,
                    itemBuilder: (context, index) => AnimatedContainer(
                      // height: 60,

                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // model.goToIssueCompose();
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
                                              "Collection Name:\n${model.postedCollections![index]?.collectionName}",
                                              style:
                                                  const TextStyle(fontSize: 24),
                                            ),
                                            // verticalSpaceSmall,
                                            const Text("GOAL: 1 / 10 ITEMS"
                                                ),
                                            const LinearProgressIndicator(
                                              value: 0.1,
                                              color: Colors.yellow,
                                            ),
                                            Text(
                                              "Created on: " +
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(model
                                                          .postedCollections![
                                                              index]!
                                                          .collectionCreateDate!
                                                          .toDate()),
                                            ),
                                            Text(
                                              "Goal Must Be Completed By: " +
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(model
                                                          .postedCollections![
                                                              index]!
                                                          .collectionGoalDate!
                                                          .toDate()),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  const Flexible(
                                    child: Text(
                                      "Next Reward: Blue Card Colour Scheme",
                                    ),
                                  ),
                                  // IconButton(
                                  //   icon: Icon(Icons.close),
                                  //   onPressed: () async {
                                  //     // await model.deletePost(model.postedIssues![index]!.issueID!);
                                  //   },
                                  // ),
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
                : model.postedCollections != null &&
                        model.postedCollections!.isEmpty
                    ? const Center(
                        child: Text(
                          'Create a collection by clicking the plus button below',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const Center(
                        child: Text(
                          'You have not created a Collection yet!',
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

  Widget accountsPage(BuildContext context, CollectionsViewModel model) {
    return SingleChildScrollView(
      child: Container(
        color: collectivaPrimary,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await model.navigateToEditProfile();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 8),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: collectivaTertiary,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 0, 16),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 8),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: collectivaTertiary,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 2,
                  thickness: 1,
                  color: collectivaTertiary,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await model.navigateToPasswordReset();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 8),
                          child: Icon(
                            Icons.lock_reset,
                            color: collectivaTertiary,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 0, 16),
                              child: Text(
                                "Change Password",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 8),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: collectivaTertiary,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 2,
                  thickness: 1,
                  color: collectivaTertiary,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 16),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await model.signOut();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: collectivaDarkBG,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text("Sign Out"),
                              ),
                            ),
                            const Text(
                              'App Version v1.0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
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
    );
  }

  Widget getViewsForIndex(
      BuildContext context, int index, CollectionsViewModel model) {
    switch (index) {
      case 0:
        return collectionsPage(model);
      case 1:
        return goalsPage(model);
      case 2:
        return accountsPage(context, model);
      default:
        return collectionsPage(model);
    }
  }
}
