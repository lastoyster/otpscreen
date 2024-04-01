import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:otpscreen/profile.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: otppage(),
    );
  }
}

class otppage extends StatefulWidget {
  var value;
  var verify;
  otppage({Key? key, this.value, this.verify}) : super(key: key);

  @override
  State<otppage> createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.arrow_left,
                      size: 28.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Column(
                children: [
                  const Text(
                    'Verify Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Code is sent to ${widget.value}',
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Pinput(
                      defaultPinTheme: const PinTheme(
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF93d2f3),
                        ),
                      ),
                      length: 6,
                      onCompleted: (pin) => otp = pin,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(
                    'Did"nt receive the code?',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Request Again',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF2e3b62),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: "${widget.verify}",
                                  smsCode: otp);
                          await auth.signInWithCredential(credential);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const profilepage()),
                          );
                        } catch (e) {
                          print('Wrong Otp');
                        }
                      },
                      child: Container(
                        height: 50.0,
                        color: const Color(0xFF2e3b62),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'VERIFY AND CONTINUE',
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
            ],
          ),
        ),
      ),
    );
  }
}
