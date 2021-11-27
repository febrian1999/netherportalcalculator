import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nether Portal Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Nether Portal Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerOverworldX = TextEditingController();
  TextEditingController controllerOverworldY = TextEditingController();
  TextEditingController controllerOverworldZ = TextEditingController();
  TextEditingController controllerNetherX = TextEditingController();
  TextEditingController controllerNetherY = TextEditingController();
  TextEditingController controllerNetherZ = TextEditingController();

  late String resultX;
  late String resultY;
  late String resultZ;

  formOnChanged(text) {
    double overX, overY, overZ, netherX, netherY, netherZ;
    if (controllerOverworldX.text.toString() == "") {
      overX = 0;
    } else {
      overX = double.parse(controllerOverworldX.text.toString());
    }

    if (controllerOverworldY.text.toString() == "") {
      overY = 0;
    } else {
      overY = double.parse(controllerOverworldY.text.toString());
    }

    if (controllerOverworldZ.text.toString() == "") {
      overZ = 0;
    } else {
      overZ = double.parse(controllerOverworldZ.text.toString());
    }

    if (controllerNetherX.text.toString() == "") {
      netherX = 0;
    } else {
      netherX = double.parse(controllerOverworldZ.text.toString());
    }

    controllerNetherX.text = NumberFormat("######", "en_US").format(overX / 8);
    controllerNetherY.text = NumberFormat("######", "en_US").format(overY);
    controllerNetherZ.text = NumberFormat("######", "en_US").format(overZ / 8);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    controllerOverworldX.text = "0";
    controllerOverworldY.text = "63";
    controllerOverworldZ.text = "0";
    controllerNetherX.text = "0";
    controllerNetherY.text = "63";
    controllerNetherZ.text = "0";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellowAccent,
              Colors.yellow,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 48, 16, 24),
                        child: Text(
                          'Nether Portal Calculator',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(4, 16, 4, 4),
                              child: Text(
                                "Overworld",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  width: ((screenWidth - 32) / 3),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerOverworldX,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "0",
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            // filled: true,
                                            // fillColor: Color(0x80f2f2f2),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            formOnChanged(text);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  width: (screenWidth - 32) / 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerOverworldY,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "0",
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            // filled: true,
                                            // fillColor: Color(0x80f2f2f2),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            formOnChanged(text);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  width: (screenWidth - 32) / 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerOverworldZ,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "0",
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            // filled: true,
                                            // fillColor: Color(0x80f2f2f2),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            formOnChanged(text);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 24, 8, 24),
                              child: Container(
                                width: screenWidth,
                                height: 2,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(4, 16, 4, 4),
                              child: Text(
                                "Nether",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  width: ((screenWidth - 32) / 3),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerNetherX,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "0",
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            // filled: true,
                                            // fillColor: Color(0x80f2f2f2),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            formOnChanged(text);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  width: (screenWidth - 32) / 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerNetherY,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "0",
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            // filled: true,
                                            // fillColor: Color(0x80f2f2f2),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            formOnChanged(text);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  width: (screenWidth - 32) / 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerNetherZ,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "0",
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            // filled: true,
                                            // fillColor: Color(0x80f2f2f2),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            formOnChanged(text);
                                          },
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
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(),
            ],
          ),
        ),
      ),
    );
  }
}
