import 'package:flutter/material.dart';
import 'package:share_your_tale/ui/ui.dart';
import 'package:share_your_tale/ui/widgets/icon_svg/icon_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Column(
      children: [
        const Padding(padding: const EdgeInsets.only(bottom: 120)),
        const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: InputDefault(
              label: 'Email',
              errorText: 'dwqwqdw',
            )),
        const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: InputDefault(
              label: 'Password',
            )),
        const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: InputDefault(
              label: 'Password',
              enabled: false,
            )),
        PrimaryButton(onPressed: () => {}, text: 'Sign In'),
        PrimaryButton(
          onPressed: () => {},
          text: 'Sign In',
        ),
        PrimaryButton(
          onPressed: () => {},
          text: 'Sign In',
          isLoading: true,
        ),
      ],
    ));
  }
}
