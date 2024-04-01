import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:otpscreen/mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: frame(),
    );
  }
}

class frame extends StatefulWidget {
  const frame({Key? key}) : super(key: key);

  @override
  State<frame> createState() => _frameState();
}

class _frameState extends State<frame> {
  List<String> _language = ['English', 'Add'];
  var _selectedlanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  const Icon(
                    CupertinoIcons.photo,
                    size: 90.0,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Please select your Language',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'You can change the language',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const Text(
                    'at any time',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            hint: const Text('English'),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                            value: _selectedlanguage,
                            onChanged: (newvalue) {
                              setState(() {
                                _selectedlanguage = newvalue;
                              });
                            },
                            items: _language.map((language) {
                              return DropdownMenuItem(
                                value: language,
                                child: Text(language),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const mobilepage()),
                              );
                            },
                            child: Container(
                              height: 50.0,
                              color: const Color(0xFF2e3b62),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: ClipPath(
                          clipper: WaveClipperTwo(reverse: true),
                          child: Container(
                            height: 90,
                            color: const Color(0xFF93d2f3),
                            child: const Center(
                              child: Text(""),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: ClipPath(
                          clipper: WaveClipperTwo(reverse: true, flip: true),
                          child: Container(
                            height: 90,
                            color: const Color(0xFF969db0).withOpacity(0.6),
                            child: const Center(
                              child: Text(""),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
