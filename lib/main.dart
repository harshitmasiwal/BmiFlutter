import 'package:bmi_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          titleLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );  
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight = TextEditingController();
  var feet = TextEditingController();
  var inch = TextEditingController();
  var bgcolor = Colors.grey.shade300;
  var msg = "";
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgcolor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get Your BMI"),
                Container(
                  child: Text("Weight"),
                  width: 410,
                  alignment: Alignment.topLeft,
                ),
                Container(
                  width: 410,
                  child: TextField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.monitor_weight_outlined),
                      label: Text("Enter your weight (Kg)"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Text("Height"),
                  width: 410,
                  alignment: Alignment.topLeft,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: TextField(
                          controller: feet,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.height),
                            label: Text("Enter in Feets (ft)"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: inch,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text("Enter in Inches (in)"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 410,
                  child: ElevatedButton(
                    onPressed: () {
                      var wt = weight.text.toString();
                      var ft = feet.text.toString();
                      var inc = inch.text.toString();

                      if (wt != "" && ft != "" && inc != "") {
                        int iwt = int.parse(wt);
                        int ift = int.parse(ft);
                        int iInc = int.parse(inc);

                        var t_inches = (ift * 12) + iInc;
                        var t_cm = t_inches * 2.54;
                        var tm = t_cm / 100;
                        var bmi = iwt / (tm * tm);

                        if (bmi > 25 && bmi < 50 || bmi < 18) {
                          if (bmi < 18) {
                            msg = "You are underweight!";
                          } else {
                            msg = "You are overweight!";
                          }
                          bgcolor = Colors.orange.shade400;
                        } else if (bmi > 18 && bmi < 25) {
                          msg = "You have Healthy BMI";
                          bgcolor = Colors.green.shade400;
                        } else if (bmi > 50) {
                          msg = "HEHEHEHEHEHE FUNNY BROO 😏 !";
                          bgcolor = Colors.red.shade400;
                        } else {
                          msg = "Made by Harshit Masiwal";
                        }

                        result = "Your BMI IS : ${bmi.toStringAsFixed(3)}";
                      } else {
                        result = "Please fill all the Details";
                      }

                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade200,
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(children: [Text("$msg"), Text("$result")]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
