import 'package:flutter/material.dart';

class CreateLoginButton extends StatelessWidget {
  const CreateLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        key: const Key('login-button'),
        onPressed: () {
          Navigator.pushNamed(context, '/login_screen');
        },
        backgroundColor: const Color(0xFF79513A),
        child: Image.asset(
          'assets/images/miniDog.png',
          fit: BoxFit.contain,
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
