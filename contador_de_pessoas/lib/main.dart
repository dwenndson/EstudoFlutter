import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contatdor de Pessoas",
      home: Home()));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _string = "Pode Entrar!";

  void _changePeaple(int delta){
    setState(() {
      while(_people > 0){
        _people += delta;
        if(_people < 0){
          _string = "Não tem ninguém no restaurante ta doido?";
          _people = 0;
        } else if( _people < 10){
          _string = "Lotado!!!";
          _people = 10;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/bar.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePeaple(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.redAccent),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePeaple(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.redAccent),
                      )),
                ),
              ],
            ),
            Text(
              "Pode Entrar:",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

