import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Screens Displayed'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red[100],
                    child: HomeScreenContent(),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    color: Colors.green[100],
                    child: SecondScreenContent(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue[100],
                    child: GridScreenContent(),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    color: Colors.yellow[100],
                    child: CalculatorScreenContent(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// HomeScreenContent (modified to fit in the grid cell)
class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: PageView(
            children: <Widget>[
              NumberPage(number: '1'),
              NumberPage(number: '2'),
              NumberPage(number: '3'),
              NumberPage(number: '4'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: CounterWidget(),
        ),
      ],
    );
  }
}

class NumberPage extends StatelessWidget {
  final String number;

  NumberPage({required this.number});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        number,
        style: TextStyle(
          fontSize: 100,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            number--;
            setState(() {});
          },
          child: Icon(
            Icons.minimize,
            size: 50,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number: $number',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            number++;
            setState(() {});
          },
          child: Icon(
            Icons.add,
            size: 50,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            minimumSize: Size(300, 60),
          ),
          onPressed: () {},
          child: Text('Click me'),
        ),
      ],
    );
  }
}

// SecondScreenContent (modified to fit in the grid cell)
class SecondScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('This is the second screen'));
  }
}

// GridScreenContent (modified to fit in the grid cell)
class GridScreenContent extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text(
              items[index],
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}

// CalculatorScreenContent (modified to fit in the grid cell)
class CalculatorScreenContent extends StatefulWidget {
  @override
  _CalculatorScreenContentState createState() => _CalculatorScreenContentState();
}

class _CalculatorScreenContentState extends State<CalculatorScreenContent> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final double? firstNumber = double.tryParse(_firstNumberController.text);
    final double? secondNumber = double.tryParse(_secondNumberController.text);

    if (firstNumber != null && secondNumber != null) {
      final sum = firstNumber + secondNumber;
      setState(() {
        _result = 'Result: $sum';
      });
    } else {
      setState(() {
        _result = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _firstNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Number',
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: _secondNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Second Number',
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: _calculateSum,
            child: Text('Calculate'),
          ),
          SizedBox(height: 8),
          Text(
            _result,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
