import 'package:estrutura_dados/func/arvore.dart';
import 'package:estrutura_dados/func/fila.dart';
import 'package:estrutura_dados/func/lista_sequec.dart';
import 'package:estrutura_dados/func/lista_simples_enc.dart';
import 'package:estrutura_dados/func/pilha.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estrutura de Dados"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Options(),
    );
  }
}

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Fila()));
              },
              child: Text(
                "Fila",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              color: Colors.blueAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pilha()));
              },
              child: Text(
                "Pilha",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              color: Colors.blueAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListaSequencial()));
              },
              child: Text(
                "Lista Sequencial",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              color: Colors.blueAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListaSimplesmente()));
              },
              child: Text(
                "Lista Simplesmente Encadeada",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              color: Colors.blueAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Arvore()));
              },
              child: Text(
                "Arvore",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
