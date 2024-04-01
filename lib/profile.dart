import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: profilepage(),
    );
  }
}

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  var c1group;
  var c2group;
  var c1value;
  var c2value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 78.0,
                ),
                child: Row(
                  children: const [
                    Spacer(),
                    Text(
                      'Please Select your profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            activeColor: const Color(0xFF2e3b62),
                            splashRadius: 20.0,
                            value: "$c1value",
                            groupValue: "$c1group",
                            // if value == groupvalue the clicked button 
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xFF2e3b62),
                            ),
                            onChanged: (value) {
                              setState(() {
                                c1value = c1group;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0,),
                          Icon(Icons.warehouse_outlined,size: 40.0,),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Shipper',style: TextStyle(fontWeight: FontWeight.bold,),),
                                SizedBox(height: 10.0,),
                                Text('Lorem ipsum dolor sit amet,'),
                                Text('consectetur adipiscing'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            activeColor: const Color(0xFF2e3b62),
                            splashRadius: 20.0,
                            value: "$c2value",
                            groupValue: "Not Equal",
                            // if value == groupvalue the clicked button
                            fillColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFF2e3b62),
                            ),
                            onChanged: (value) {
                              setState(() {
                                c2value = c2group;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0,),
                          const Icon(Icons.local_shipping_outlined,size: 40.0,),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Transporter',style: TextStyle(fontWeight: FontWeight.bold,),),
                                SizedBox(height: 10.0,),
                                Text('Lorem ipsum dolor sit amet,'),
                                Text('consectetur adipiscing'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {

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
