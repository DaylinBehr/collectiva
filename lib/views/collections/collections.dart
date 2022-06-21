import 'package:collectiva/constants/colors_constants.dart';
import 'package:collectiva/views/collections/collections_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({Key? key}) : super(key: key);

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
                      ? Column(children:  <Widget>[
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
                .navigateToAddCollection() //model.navigateToAddCollection(context),
            ),
      ),
    );
  }

  Widget collectionsPage(CollectionsViewModel model) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 40),
      child: ListView.builder(
        itemCount: 12, //model.collections.length,
        itemBuilder: (context, index) => AnimatedContainer(
          // height: 60,

          margin: const EdgeInsets.only(top: 10, bottom: 10),
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
               await model.navigateToItems();
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Collection Name",
                                //     +
                                //     model
                                //         .postedIssues![
                                //     index]!
                                //         .issueTitle!,
                                style: TextStyle(fontSize: 24),
                              ),
                              // verticalSpaceSmall,
                              Text("15 ITEMS"
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
                              Text("Created On: 22-05-2022"
                                  //     +
                                  //     model
                                  //         .postedIssues![
                                  //     index]!
                                  //         .issueStatus!,
                                  // style:
                                  // ContentTextStyle,
                                  ),
                              // verticalSpaceSmall,
                              // Text('Query ID: '+ model.postedIssues![index]!.issueID!, style: ContentTextStyle,),
                            ]),
                      )),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          await model.navigateToEditCollection();
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
      ),
    );
  }

  Widget goalsPage() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 40),
      child: ListView.builder(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Collection Name",
                                //     +
                                //     model
                                //         .postedIssues![
                                //     index]!
                                //         .issueTitle!,
                                style: TextStyle(fontSize: 24),
                              ),
                              // verticalSpaceSmall,
                              Text("GOAL: 15 / 100 ITEMS"
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
                              LinearProgressIndicator(
                                value: 0.15,
                                color: Colors.yellow,
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
                              Text("Created On: 22-05-2022"
                                  //     +
                                  //     model
                                  //         .postedIssues![
                                  //     index]!
                                  //         .issueStatus!,
                                  // style:
                                  // ContentTextStyle,
                                  ),
                              // verticalSpaceSmall,
                              // Text('Query ID: '+ model.postedIssues![index]!.issueID!, style: ContentTextStyle,),
                            ]),
                      )),
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
                            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 16),
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
        return goalsPage();
      case 2:
        return accountsPage(context, model);
      default:
        return collectionsPage(model);
    }
  }
}
