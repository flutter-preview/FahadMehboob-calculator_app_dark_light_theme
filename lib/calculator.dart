import 'package:calculator_app_dark_light_theme/equalbtn.dart';
import 'package:calculator_app_dark_light_theme/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  SimpleCalculatorState createState() => SimpleCalculatorState();
}

class SimpleCalculatorState extends State<SimpleCalculator> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  void clear() {
    setState(() {
      equation = "0";
      result = "0";
      equationFontSize = 38.0;
      resultFontSize = 48.0;
    });
  }

  void delete() {
    setState(() {
      equationFontSize = 48.0;
      resultFontSize = 38.0;
      equation = equation.substring(0, equation.length - 1);
      if (equation.isEmpty) {
        equation = "0";
      }
    });
  }

  void evaluate() {
    setState(() {
      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        result = "Error";
      }
    });
  }

  void addToEquation(String buttonText) {
    setState(() {
      if (equation == "0") {
        equation = buttonText;
      } else {
        equation += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.teal : Colors.cyan,
          title: const Text("Calculator App"),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
              onPressed: toggleTheme,
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: const TextStyle(fontSize: 37, fontFamily: "Roboto"),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                result,
                style: const TextStyle(fontSize: 106, fontFamily: "Roboto"),
              ),
            ),
            const Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        MyButton(
                          title: "AC",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            clear();
                          },
                        ),
                        MyButton(
                          title: "⌫",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            delete();
                          },
                        ),
                        MyButton(
                          title: "/",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("/");
                          },
                        ),
                      ]),
                      TableRow(children: [
                        MyButton(
                          title: "7",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("7");
                          },
                        ),
                        MyButton(
                          title: "8",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("8");
                          },
                        ),
                        MyButton(
                          title: "9",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("9");
                          },
                        ),
                      ]),
                      TableRow(children: [
                        MyButton(
                          title: "4",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("4");
                          },
                        ),
                        MyButton(
                          title: "5",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("5");
                          },
                        ),
                        MyButton(
                          title: "6",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("6");
                          },
                        ),
                      ]),
                      TableRow(children: [
                        MyButton(
                          title: "1",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("1");
                          },
                        ),
                        MyButton(
                          title: "2",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("2");
                          },
                        ),
                        MyButton(
                          title: "3",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("3");
                          },
                        ),
                      ]),
                      TableRow(children: [
                        MyButton(
                          title: "0",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("0");
                          },
                        ),
                        MyButton(
                          title: ".",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation(".");
                          },
                        ),
                        MyButton(
                          title: "00",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("00");
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        MyButton(
                          title: "*",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("*");
                          },
                        ),
                      ]),
                      TableRow(children: [
                        MyButton(
                          title: "-",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("-");
                          },
                        ),
                      ]),
                      TableRow(children: [
                        MyButton(
                          title: "+",
                          isDarkMode: isDarkMode,
                          onPressed: () {
                            addToEquation("+");
                          },
                        ),
                      ]),
                      TableRow(children: [
                        EqualBtn(
                          onPressed: () {
                            evaluate();
                          },
                        ),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
