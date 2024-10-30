import 'package:flutter/material.dart';
import 'package:flutter_application_uts/dashboard.dart';
import 'package:flutter_application_uts/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State <LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? usernameError;
  String? passwordError;

  void loginuser() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    setState(() {
      usernameError = username.isEmpty ? 'username tidak boleh kosong' : null;
      passwordError = password.isEmpty ? 'password  tidak boleh kosong' : null;
    });
    
    if (username.isNotEmpty && password.isNotEmpty) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool("isLoggedin", true);
      await pref.setString("username", username);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              header(context),
              inputField(context),
              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  header(context) {
    return const Column(
      children: [
        Text(
          "Welcome",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),

              fillColor: Colors.blueGrey.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person),
              errorText: usernameError,
            ),
        ),

        const SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.blueGrey.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
            errorText: passwordError,
          ),

          obscureText: true,
        ),
        // const SizedBox(height: 10),
        
      ],
    );
  }

  loginButton(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ElevatedButton(
        onPressed: loginuser,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Color(0xFF4BD2D0),
        ),
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
