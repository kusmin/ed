import 'package:flutter/material.dart';

class Pilha extends StatefulWidget {
  @override
  _PilhaState createState() => _PilhaState();
}

class _PilhaState extends State<Pilha> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _pilhaController = TextEditingController();

  List _pilha = [];



  void _addPilha(){
    setState(() {
      _pilha.add(_pilhaController.text);
      _pilhaController.text = "";
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilha"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _pilha.removeLast();
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
                        controller: _pilhaController,
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
                          setState(() {
                            _pilha.add(_pilhaController.text);
                            _pilhaController.text = "";
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child:  ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: _pilha.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(_pilha[index],
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
