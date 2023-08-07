import 'package:bloc_example/presentation/category/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Category Page'),
          ),
          body: Center(
            child: Text('Category Page'),
          ),
        );
      },
    );
  }
}
