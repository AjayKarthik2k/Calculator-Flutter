import 'package:calculator/widgets/op-button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion = '';
  var outputAnswer = '';

  // Displays the pressed character
  void buttonCLick(number) {
    setState(() {
      userQuestion = userQuestion + number.toString();
    });
  }

  // Removes the lastly entered
  // character from the expression
  void backSpace() {
    setState(() {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    });
  }

  // Removes the whole expression
  void delete() {
    setState(() {
      userQuestion = '';
    });
  }

  // Removes everything on
  // the display
  void deleteAll() {
    setState(() {
      userQuestion = '';
      outputAnswer = '';
    });
  }

  // Getting the final
  // expression
  void equalTo() {
    setState(() {
      calculate();
    });
  }

  // Calculating the expression when
  // = is pressed
  void calculate() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    outputAnswer = eval.toString();
  }

  // Textstyle for the expression
  final questionTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
  );

  // Textstyle for the evaluvated answer
  final answerTextStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    // Usable Height is the space where the
    // height of the status bar and the
    // app bar is not included.
    final usableHeight =
        screenHeight - (statusBarHeight + (AppBar().preferredSize.height));

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          // Place where the calculation
          // is displayed
          Container(
            width: screenWidth,
            height: usableHeight * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(userQuestion, style: questionTextStyle),
                const SizedBox(height: 30),
                Text(outputAnswer, style: answerTextStyle),
              ],
            ),
          ),

          // Row that 2 containers
          // One for numbers &
          // other for operators
          Row(
            children: [
              // Numbers layout
              Container(
                width: screenWidth * 0.7,
                height: usableHeight * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => buttonCLick(7),
                            child: Text(
                              "7",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          TextButton(
                            onPressed: () => buttonCLick(8),
                            child: Text(
                              "8",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          TextButton(
                            onPressed: () => buttonCLick(9),
                            child: Text(
                              "9",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => buttonCLick(4),
                            child: Text(
                              "4",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          TextButton(
                            onPressed: () => buttonCLick(5),
                            child: Text(
                              "5",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          TextButton(
                            onPressed: () => buttonCLick(6),
                            child: Text(
                              "6",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => buttonCLick(1),
                            child: Text(
                              "1",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          TextButton(
                            onPressed: () => buttonCLick(2),
                            child: Text(
                              "2",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          TextButton(
                            onPressed: () => buttonCLick(3),
                            child: Text(
                              "3",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => buttonCLick(0),
                            child: Text(
                              "0",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          TextButton(
                            onPressed: () => buttonCLick("."),
                            child: Text(
                              ".",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          OpButton(
                            text: "C",
                            onPressed: delete,
                            onLongPressed: deleteAll,
                          )
                        ],
                      ),
                      Container(
                          width: 250,
                          child: OpButton(text: "=", onPressed: equalTo)),
                    ],
                  ),
                ),
              ),

              // Operators Layout
              Container(
                width: screenWidth * 0.3,
                height: usableHeight * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: backSpace, child: Icon(Icons.backspace)),
                      OpButton(text: "+", onPressed: () => buttonCLick("+")),
                      OpButton(text: "-", onPressed: () => buttonCLick("-")),
                      OpButton(text: "x", onPressed: () => buttonCLick("*")),
                      OpButton(text: "/", onPressed: () => buttonCLick("/")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
