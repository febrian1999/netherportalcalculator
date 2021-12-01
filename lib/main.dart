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

  late String resultX, resultY, resultZ;
  late double overX, overY, overZ, netherX, netherY, netherZ;

  overworldOnChanged(text) {
    overX = double.parse(controllerOverworldX.text.toString());
    overY = double.parse(controllerOverworldY.text.toString());
    overZ = double.parse(controllerOverworldZ.text.toString());

    if (controllerOverworldX.text.toString() != "") {
      controllerNetherX.text = NumberFormat("#").format(overX / 8);
    }

    if (controllerOverworldY.text.toString() != "") {
      controllerNetherY.text = NumberFormat("#").format(overY);
    }

    if (controllerOverworldZ.text.toString() != "") {
      controllerNetherZ.text = NumberFormat("#").format(overZ / 8);
    }
  }

  netherOnChanged(text) {
    netherX = double.parse(controllerNetherX.text.toString());
    netherY = double.parse(controllerNetherY.text.toString());
    netherZ = double.parse(controllerNetherZ.text.toString());

    if (controllerNetherX.text.toString() != "") {
      controllerOverworldX.text = NumberFormat("#").format(netherX * 8);
    }

    if (controllerNetherY.text.toString() != "") {
      controllerOverworldY.text = NumberFormat("#").format(netherY);
    }

    if (controllerNetherZ.text.toString() != "") {
      controllerOverworldZ.text = NumberFormat("#").format(netherZ * 8);
    }
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
                              padding: EdgeInsets.fromLTRB(4, 16, 4, 8),
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
                                  padding: EdgeInsets.fromLTRB(4, 8, 8, 0),
                                  width: ((screenWidth - 32) / 3),
                                  child: Text(
                                    "X",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 8, 0),
                                  width: ((screenWidth - 32) / 3),
                                  child: Text(
                                    "Y",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 8, 0),
                                  width: ((screenWidth - 32) / 3),
                                  child: Text(
                                    "Z",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 0, 4, 8),
                                  width: ((screenWidth - 32) / 3),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerOverworldX,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
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
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            overworldOnChanged(text);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 0, 4, 8),
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
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            overworldOnChanged(text);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 0, 4, 8),
                                  width: (screenWidth - 32) / 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: controllerOverworldZ,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
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
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            overworldOnChanged(text);
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
                                  padding: EdgeInsets.fromLTRB(4, 8, 8, 0),
                                  width: ((screenWidth - 32) / 3),
                                  child: Text(
                                    "X",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 8, 0),
                                  width: ((screenWidth - 32) / 3),
                                  child: Text(
                                    "Y",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 8, 8, 0),
                                  width: ((screenWidth - 32) / 3),
                                  child: Text(
                                    "Z",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
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
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            netherOnChanged(text);
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
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            netherOnChanged(text);
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
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            netherOnChanged(text);
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
