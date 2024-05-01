import 'dart:io';

import 'package:finalproject/app/detailsScreen.dart';
import 'package:finalproject/website/website_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';

import '../website/dashboardscreen.dart';
import '../website/user_list_screen.dart';
import 'faderoute.dart';

class LoginSignup extends StatefulWidget {
  static const routeName = '/auth';

  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  String? email;
  String? password;

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      navigateBackAfterRecovery: true,
      title: '',
      logo: const AssetImage('assets/icon3.png'),

      //onConfirmRecover: _signupConfirm,
      // onConfirmSignup: _signupConfirm,
      loginAfterSignUp: false,

      userValidator: (value) {
        if (!value!.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        debugPrint('Login info');
        debugPrint('Name: ${loginData.name}');
        debugPrint('Password: ${loginData.password}');
        email = loginData.name;
        password = loginData.password;
        _signInWithEmail();
        return _loginUser(loginData);
      },
      onSignup: (signupData) {
        email = signupData.name;
        password = signupData.password;
        debugPrint('Signup info');

        debugPrint('Name: ${signupData.name}');
        debugPrint('Password: ${signupData.password}');

        signupData.additionalSignupData?.forEach((key, value) {
          debugPrint('$key: $value');
        });
        _signUpWithEmail();
        return _signupUser(signupData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(
          FadePageRoute(
            builder: (context) => DetailsScreen(),
          ),
        );

        // Navigator.of(context).pushReplacement(
        //   FadePageRoute(
        //     builder: (context) => UserDetailsScreen(),
        //   ),
        // );
      },
      onRecoverPassword: (name) {
        debugPrint('Recover password info');
        debugPrint('Name: $name');
        return _recoverPassword(name);
      },
    );
  }

  Future<void> _signInWithEmail() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      print('User signed in: ${userCredential.user!.uid}');
      // Navigate to next screen or perform desired action
    } catch (e) {
      print('Failed to sign in with email: $e');
      // Handle sign-in failure, e.g., show error message to user
    }
  }

  Future<void> _signUpWithEmail() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      print('User signed up: ${userCredential.user!.uid}');
      // Navigate to next screen or perform desired action
    } catch (e) {
      print('Failed to sign up with email: $e');
      // Handle sign-up failure, e.g., show error message to user
    }
  }
}
