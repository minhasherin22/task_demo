import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_demo/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   late SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                   
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: ()async {
                preferences = await SharedPreferences.getInstance();
              String username = _usernameController.text;
              String password = _passwordController.text;
              if(username != "" && password != ""){
                preferences.setString('uname', username);
                 preferences.setString('pword', password);
                
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedHome()));
              }
                 _usernameController.text ="";
              _passwordController.text ="";
              },
              child: const Text('Sign In'),
            ),
             const SizedBox(height: 26.0),
             const Text("dont have an account??"),
             TextButton(onPressed: (){}, child: const Text("Signup Now!"))
          ],
        ),
      ),
    );
  }
}