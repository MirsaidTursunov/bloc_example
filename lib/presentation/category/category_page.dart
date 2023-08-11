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
          body: ListView.separated(
            itemCount: state.storiesList.length,
            padding: const EdgeInsets.all(24),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  context.read<CategoryBloc>().add(IndexChange(index: index));
                },
                child: Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.network(
                          state.storiesList[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      state.storiesList[index].title,
                      style: TextStyle(
                          color: state.number == index
                              ? Colors.red
                              : Colors.black),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 10),
          ),
        );
      },
    );
  }
}
