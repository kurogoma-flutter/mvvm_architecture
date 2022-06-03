// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'todo_page_view_model.dart';

class SampleTodoPage extends StatelessWidget {
  const SampleTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const CounterComponent(),
              Container(width: size.width, height: 1, color: Colors.black38),
              const Text('Todoレベル', style: TextStyle(fontSize: 28)),
              const TodoLevelComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterComponent extends StatelessWidget {
  const CounterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final count =
          ref.watch(todoPageViewModelProvider.select((todo) => todo.count));
      Size size = MediaQuery.of(context).size;
      return Column(
        children: <Widget>[
          Text(count.toString(), style: const TextStyle(fontSize: 20)),
          SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                      onPressed: () =>
                          ref.read(todoPageViewModelProvider).subCounter(),
                      icon: const Icon(Icons.exposure_minus_1_outlined,
                          color: Colors.white)),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                      onPressed: () =>
                          ref.read(todoPageViewModelProvider).addCounter(),
                      icon: const Icon(Icons.plus_one_outlined,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class TodoLevelComponent extends StatelessWidget {
  const TodoLevelComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer(builder: (context, ref, _) {
      final todoLevel =
          ref.watch(todoPageViewModelProvider.select((todo) => todo.todoLevel));
      return Column(
        children: <Widget>[
          Text(todoLevel.toString(), style: const TextStyle(fontSize: 20)),
          SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: IconButton(
                      onPressed: () =>
                          ref.read(todoPageViewModelProvider).subTodoLevel(),
                      icon: const Icon(Icons.exposure_minus_1_outlined,
                          color: Colors.white)),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: IconButton(
                      onPressed: () =>
                          ref.read(todoPageViewModelProvider).addTodoLevel(),
                      icon: const Icon(Icons.plus_one_outlined,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
