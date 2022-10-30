import 'package:flutter/material.dart';

import '/shared/ui_helpers.dart';
import '/services/profile.dart' as profile;

class HomeView extends StatefulWidget {
  static const String id = 'home';
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.white,
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/buho.png",
                    width: 150,
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 10,
              shadowColor: Colors.black87,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Bienvenido de vuelta",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    if (_profile != {} && _profile["data"] != null)
                      Text(
                        "${_profile["data"]["name"]}!",
                        style: const TextStyle(
                            color: Color(0xff3a85c7),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              borderOnForeground: true,
              elevation: 10,
              shadowColor: Colors.black87,
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                        child: Text("Asignaturas inscritas",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18))),
                    verticalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Arquitectura de Software",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        Text("Pensamiento Sistémico",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        Text("Teoría de la Información",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        Text("Lenguajes de programación",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              borderOnForeground: true,
              elevation: 10,
              shadowColor: Colors.black87,
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                        child: Text("Planes de Estudio",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18))),
                    verticalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Ingeniería de Sistemas y Computación",
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: [
                Card(
                  color: Colors.white,
                  borderOnForeground: true,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("12",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ],
                        ),
                        const Center(
                            child: Text("Créditos inscritos",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16))),
                        verticalSpaceSmall,
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  borderOnForeground: true,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("4.1",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ],
                        ),
                        const Center(
                            child: Text("GPA",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16))),
                        verticalSpaceSmall,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceHuge,
          ],
        ),
      ),
    );
  }
}
