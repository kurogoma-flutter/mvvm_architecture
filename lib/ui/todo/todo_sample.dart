// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import '../todo/todo_list_view_model.dart';

class SampleTodoPage extends ConsumerWidget {
  const SampleTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(todoPageViewModelProvider);
    final todoLevel =
        ref.watch(todoPageViewModelProvider.select((todo) => todo.todoLevel));

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプルページ'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('カウンター', style: TextStyle(fontSize: 28)),
              Text(viewModel.count.toString(),
                  style: const TextStyle(fontSize: 20)),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                          onPressed: () => viewModel.subCounter(),
                          icon: const Icon(Icons.exposure_minus_1_outlined,
                              color: Colors.white)),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                          onPressed: () => viewModel.addCounter(),
                          icon: const Icon(Icons.plus_one_outlined,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(width: size.width, height: 1, color: Colors.black38),
              const Text('Todoレベル', style: TextStyle(fontSize: 28)),
              Text(todoLevel.toString(), style: const TextStyle(fontSize: 20)),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: IconButton(
                          onPressed: () => viewModel.subTodoLevel(),
                          icon: const Icon(Icons.exposure_minus_1_outlined,
                              color: Colors.white)),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: IconButton(
                          onPressed: () => viewModel.addTodoLevel(),
                          icon: const Icon(Icons.plus_one_outlined,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
