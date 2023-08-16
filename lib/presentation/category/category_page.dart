import 'package:bloc_example/presentation/category/bloc/category_bloc.dart';
import 'package:bloc_example/presentation/category/login_win_page.dart';
import 'package:bloc_example/presentation/category/mixin/category_mixin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with CategoryPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (_, state) {
        return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  LoginWinPage();
              } else {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Category Page'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130,
                          child: ListView.separated(
                            itemCount: state.storiesList.length,
                            padding: const EdgeInsets.all(24),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<CategoryBloc>()
                                      .add(IndexChange(index: index));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 56,
                                      width: 56,
                                      decoration: const BoxDecoration(
                                          color: Colors.amber,
                                          shape: BoxShape.circle),
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
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                        ),
                        if(state.firebaseStatus.isLoading)
                          const CircularProgressIndicator(),
                        if(state.firebaseStatus.isError)
                          const Text('Email yoki parol xato'),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              context.read<CategoryBloc>().add(GmailEvent(
                                  gmail: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: const Text('Log in with Email')),
                      ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              context.read<CategoryBloc>().add(SignUpGmailEvent(
                                  gmail: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: const Text('Sign Up with Email')),
                    ],
                  ),
                );
              }
            });
      },
    );
  }
}
