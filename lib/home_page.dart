import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var n1 = 0;
  var n2 = 0;
  var res = 0;
  final TextEditingController t1 =
      TextEditingController(text: "0"); //show 0 by default
  final TextEditingController t2 =
      TextEditingController(text: "0"); //show 0 by default

  void doadd() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      res = n1 + n2;
    });
  }

  void dosub() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      if (n1 > n2) {
        res = n1 - n2;
      } else {
        res = n2 - n1;
      }
    });
  }

  void domul() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      res = n1 * n2;
    });
  }

  void dodiv() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      if (n2 != 0) {
        res = n1 ~/ n2; // Use integer division (~/) to ensure result is an int
      } else {
        res = 0; // Handle division by zero
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Result: $res",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: t1,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "1st number",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: t2,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "2nd number",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: doadd,
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: dosub,
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: domul,
                    child: Icon(Icons.close),
                  ),
                  FloatingActionButton(
                    onPressed: dodiv,
                    child: Text(
                      "÷",
                      style: TextStyle(fontSize: 24),
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
