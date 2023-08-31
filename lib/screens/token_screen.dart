import 'package:flutter/material.dart';
import 'package:liisma1/screens/admin_screen.dart';
import 'package:liisma1/screens/login_screen.dart';
import 'package:liisma1/services/auth_cotroller.dart';

class Token extends StatelessWidget {
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String token;

  Token({super.key});

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
                'Token  ',
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
                  token = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Token field can not be empty';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(labelText: 'Enter token'),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  final resp = _authController.loginToken(token);
                  debugPrint(resp as String?);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('Token'),
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
                        return Login();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Liismaiil account?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
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
                        return const Admin();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Liismaiil admin dashboard?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
