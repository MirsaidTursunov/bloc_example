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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Profile Page'),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                      context.read<ProfileBloc>().add(SignUpGoogleEvent());
                  },
                  child: const Text('Log in with Google')),
            ],
          ),
        );
      },
    );
  }
}
