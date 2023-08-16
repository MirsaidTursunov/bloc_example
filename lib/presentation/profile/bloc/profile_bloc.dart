import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<SignUpGoogleEvent>(_singUpWithGoogle);
  }



  Future<void> _singUpWithGoogle(
      SignUpGoogleEvent event, Emitter<ProfileState> emit) async {

    final _googleSign = GoogleSignIn(
      scopes: [
        'email',
        // 'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

      try {
        final GoogleSignInAccount? googleUser = await _googleSign.signIn();
        final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          credential,
        );
        print(userCredential.user);
      } on FirebaseAuthException catch (e) {
        debugPrint(e.message);
        return null;
      } catch (e, s) {
        debugPrint('$e, $s');
        return null;
      }
  }
}
