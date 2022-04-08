import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//create flutter app to calculate volume of tube with two inputs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tube Volume Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//create class to hold the state of the app
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //create variables to hold the input values
  double _length = 0.0;
  double _diameter = 0.0;
  double _volume = 0.0;

  //create a function to calculate the volume
  void _calculateVolume() {
    setState(() {
      _volume = _length * _diameter * 3.141592653589793;
    });
  }

  //create a function to clear the input values
  void _clearValues() {
    setState(() {
      _length = 0.0;
      _diameter = 0.0;
      _volume = 0.0;
    });
  }

  //create a function to validate the input values
  bool _validateInputs() {
    if (_length == null || _diameter == null) {
      return false;
    } else {
      return true;
    }
  }

  //create a function to display the input values
  String _displayInputs() {
    return 'Length: ${_length.toStringAsFixed(2)}' +
        '\nDiameter: ${_diameter.toStringAsFixed(2)}';
  }

  //create a function to display the volume
  String _displayVolume() {
    return 'Volume: ${_volume.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tube Volume Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter the length and diameter of the tube:',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              _displayInputs(),
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              _displayVolume(),
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Length',
                        hintText: 'Enter the length of the tube',
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _length = double.parse(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 100.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Diameter',
                        hintText: 'Enter the diameter of the tube',
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _diameter = double.parse(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Calculate Volume'),
                    onPressed: () {
                      if (_validateInputs()) {
                        _calculateVolume();
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text('Clear Values'),
                    onPressed: () {
                      _clearValues();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
