import 'package:flutter/material.dart';

class ListaSimplesmente extends StatefulWidget {
  @override
  _ListaSimplesmenteState createState() => _ListaSimplesmenteState();
}

class _ListaSimplesmenteState extends State<ListaSimplesmente> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _listaController = TextEditingController();

  List _lista = [];

  void _addLista(){
    setState(() {
      _lista.add(_listaController.text);
      _listaController.text = "";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista Sequncial"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _lista.removeLast();
            });
          },
          child: Icon(Icons.remove),
          backgroundColor: Colors.blueAccent,
        ),
        body: Form(
          key: _formKey,
          child:  Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _listaController,
                        decoration: InputDecoration(
                            labelText: "Novo Elemento",
                            labelStyle: TextStyle(color: Colors.blueAccent)
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return "Insira um valor!";
                          }
                        },
                      ),
                    ),
                    RaisedButton(
                      color: Colors.blueAccent,
                      child: Text("ADD"),
                      textColor: Colors.white,
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _addLista();
                        }
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child:  ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: _lista.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(_lista[index],
                        style: TextStyle(
                            fontSize: 25.0, color: Colors.blueAccent
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}