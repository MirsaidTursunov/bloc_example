import 'package:bloc_example/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: Column(
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
