import 'package:flutter/material.dart';

class Fila extends StatefulWidget {
  @override
  _FilaState createState() => _FilaState();
}

class _FilaState extends State<Fila> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _filaController = TextEditingController();

  List _fila = [];

  void _addFila(){
    setState(() {
      _fila.add(_filaController.text);
      _filaController.text = "";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fila"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _fila.removeAt(0);
          });
        },
        child: Icon(Icons.remove),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _filaController,
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
                          _addFila();
                        }
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child:  ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: _fila.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(_fila[index],
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
