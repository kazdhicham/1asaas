import 'package:flutter/material.dart';
import 'package:liisma1/screens/token_screen.dart';
import 'package:liisma1/services/auth_cotroller.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(labelText: 'Enter email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email address can not be empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password field can not be empty';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(labelText: 'Enter password'),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    debugPrintStack(label: "$email , $password");
                    AuthController().loginUser(email, password);
                  } else {
                    print('not logged in ');
                  }
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('connect'),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Token();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Got token ?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
