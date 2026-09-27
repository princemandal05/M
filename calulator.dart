import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: const CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();

  String result = '';

  void add() {
    final a = double.tryParse(num1.text);
    final b = double.tryParse(num2.text);

    setState(() {
      result = (a != null && b != null)
          ? 'Sum is: ${a + b}'
          : 'Please enter valid numbers';
    });
  }

  void subtract() {
    final a = double.tryParse(num1.text);
    final b = double.tryParse(num2.text);

    setState(() {
      result = (a != null && b != null)
          ? 'Difference is: ${a - b}'
          : 'Please enter valid numbers';
    });
  }

  void multiply() {
    final a = double.tryParse(num1.text);
    final b = double.tryParse(num2.text);

    setState(() {
      result = (a != null && b != null)
          ? 'Product is: ${a * b}'
          : 'Please enter valid numbers';
    });
  }

  void divide() {
    final a = double.tryParse(num1.text);
    final b = double.tryParse(num2.text);

    setState(() {
      if (a == null || b == null) {
        result = 'Please enter valid numbers';
      } else if (b == 0) {
        result = 'Cannot divide by zero';
      } else {
        result = 'Quotient: ${a / b}';
      }
    });
  }

  @override
  void dispose() {
    num1.dispose();
    num2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Number',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Second Number',
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: add,
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: subtract,
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: multiply,
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: divide,
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              result.isEmpty ? 'Result' : result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
