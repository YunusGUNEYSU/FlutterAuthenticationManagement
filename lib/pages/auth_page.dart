import 'package:flutter/material.dart';
import 'package:flutterpost/pages/home_page.dart';
import 'package:flutterpost/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
 
  @override
  void initState() {
    super.initState();
    
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, value, child) => SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 300,),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                  
                    controller: emailController,
                    decoration: const InputDecoration(
                      
                        hintText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                MaterialButton(
                  color: Colors.deepPurple[200],
                  onPressed: () async {
                 await value.fetchAuth(emailController.text, passwordController.text);
                 await value.cacheToken();
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
                },
                child: const Text("Send Post"),
                )
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
