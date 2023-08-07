import 'package:bloc_example/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile Page'),
          ),
          body: Center(
            child: Text('Profile Page'),
          ),
        );
      },
    );
  }
}
