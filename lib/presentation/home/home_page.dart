import 'package:bloc_example/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state){
        if (state.number == 10){
          context.read<HomeBloc>().add(VisibleEvent());
        }
      },
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: ColoredBox(
            color: state.numberVisible == true ? Colors.green: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    state.number.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<HomeBloc>().add(CounterEvent(number: state.number));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
