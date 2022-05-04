import 'package:collectiva/views/collections/collections_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CollectionsViewModel>.reactive(
      viewModelBuilder: () => CollectionsViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Collections'),
        ),
        body: model.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: 12,//model.collections.length,
                itemBuilder: (context, index) => ListTile(
                  title: const Text("hi"),//Text(model.collections[index].name),
                  subtitle: const Text("hi"),//model.collections[index].description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => {}//model.deleteCollection(index),
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {}//model.navigateToAddCollection(context),
        ),
      ),
    );
  }

}
