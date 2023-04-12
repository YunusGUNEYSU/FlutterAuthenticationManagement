import 'package:flutter/material.dart';
import 'package:flutterpost/pages/auth_page.dart';
import 'package:flutterpost/pages/home_page.dart';
import 'package:flutterpost/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    context.read<AuthProvider>().getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, value, child) {
if (value.getToken()!=null) {
  return const HomePage();
  
}
else{
  return const AuthPage();
}

      
    });
  }
}