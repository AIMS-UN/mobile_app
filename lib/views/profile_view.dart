import 'package:flutter/material.dart';

import '/shared/ui_helpers.dart';
import '/services/profile.dart' as profile;

class ProfileView extends StatefulWidget {
  static const String id = 'profile';
  const ProfileView({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Map<String, dynamic> _profile = {};

  _getProfile() async {
    final myProfile = await profile.getMyProfile();
    setState(() {
      _profile = myProfile;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Image.asset(
              "assets/student_profile.png",
              width: 70,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const Text(
                      "Estudiante",
                      style: TextStyle(
                          color: Color.fromARGB(255, 7, 16, 94),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    if (_profile != {} && _profile["data"] != null)
                      Text(
                        "${_profile["data"]["name"]} ${_profile["data"]["lastname"]}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    if (_profile != {} && _profile["data"] != null)
                      Text(
                        "${_profile["data"]["email"]}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
            color: Colors.indigo[700],
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "CC/TI",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${_profile["data"]["doc_id"]}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Dirección",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    if (_profile != {} && _profile["data"] != null)
                      Text(
                        "${_profile["data"]["address"]}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Fecha de Nacimiento",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    if (_profile != {} && _profile["data"] != null)
                      Text(
                        "${_profile["data"]["birthdate"]}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    const SizedBox(height: 10),
                    const Text(
                      "Teléfono/Celular",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    if (_profile != {} && _profile["data"] != null)
                      Text(
                        "${_profile["data"]["phone_number"]}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Planes de estudio",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),
          Card(
            color: Colors.blueGrey,
            elevation: 10,
            shadowColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Ingeniería de Sistemas y Computación",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: const [
                      Text(
                        "Créditos cursados: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "68",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Créditos aprobados: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "68",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Créditos reprobados: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "68",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "GPA: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "4.1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,
            elevation: 10,
            shadowColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Ingeniería Electrónica",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: const [
                      Text(
                        "Créditos cursados: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "68",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Créditos aprobados: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "68",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Créditos reprobados: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "68",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "GPA: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "4.1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpaceHuge
        ],
      ),
    );
  }
}


// USEFUL CONTAINER
/*
Container(
            color: Colors.indigo[800],
            width: double.infinity,
            height: 400,
            child: const Center(
              child: Text(
                "Im in profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
*/