import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_dio/view_model/view_model.dart';

import '../model/post.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(postListProvider); //取得したAPIデータの監視
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee List'),
      ),
      body: Center(
        child: asyncValue.when(
          data: (data) {
            return data.isNotEmpty
                ? ListView(
              children: data
                  .map(
                    (Post post) => Card(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text(post.title!),
                            children: [
                              SimpleDialogOption(
                                child: Text(post.body!),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ListTile(
                      title: Text(post.title!),
                      subtitle: Text(post.body!),
                      trailing: const Icon(Icons.more_vert),
                    ),
                  ),
                ),
              )
                  .toList(),
            )
                : const Text('Data is empty.');
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => Text(error.toString()),
        ),
      ),
    );
  }
}