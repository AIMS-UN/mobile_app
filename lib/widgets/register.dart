import 'package:flutter/material.dart';
import '../services/auth.dart' as auth;

import 'background.dart';
import 'login.dart';

enum SigningCharacter { student, teacher }

// List<DropdownMenuItem<String>> get dropdownItems {
//   List<DropdownMenuItem<String>> menuItems = [
//     const DropdownMenuItem(value: 'Student', child: Text('Student')),
//     const DropdownMenuItem(value: 'Teacher', child: Text('Teacher')),
//   ];

//   return menuItems;
// }

// class _DropdownItemState extends State<DropdownItem> {
//   String selectedValue = 'Student';

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       value: selectedValue,
//       items: dropdownItems,
//       onChanged: (value) {
//         setState(() {
//           selectedValue = value ?? 'Student';
//         });
//       },
//     );
//   }
// }

// class DropdownItem extends StatefulWidget {
//   const DropdownItem({super.key});

//   @override
//   _DropdownItemState createState() => _DropdownItemState();
// }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  SigningCharacter _character = SigningCharacter.student;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String response = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                response,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              // create a dropdown menu with two options (student and teacher)
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Student'),
                      leading: Radio<SigningCharacter>(
                        value: SigningCharacter.student,
                        groupValue: _character,
                        onChanged: (SigningCharacter? value) {
                          setState(() {
                            _character = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Teacher'),
                      leading: Radio<SigningCharacter>(
                        value: SigningCharacter.teacher,
                        groupValue: _character,
                        onChanged: (SigningCharacter? value) {
                          setState(() {
                            _character = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextButton(
                onPressed: () async {
                  String stringRole = _character == SigningCharacter.student
                      ? 'student'
                      : 'teacher';

                  final Map<String, dynamic> data = await auth.register(
                      usernameController.text,
                      passwordController.text,
                      stringRole);

                  setState(() {
                    response = data.toString();
                  });
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 100, 255, 34),
                        Color.fromARGB(255, 42, 73, 0)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))
                },
                child: const Text(
                  "Already have an Account? Sign In",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
