import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

String resposta = "";

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Trabalho de Desenvolvimento Móvel';

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabalho de Desenvolvimento Móvel'),
      ),
      body: Center(
        child: Text('Clique no botão a baixo para abrir uma nova página'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          var getPost = postRequest();
          getPost.then((value){
            setState(() {
              if(value.statusCode == 200){
                resposta = value.body;
              } 
            });
          });
          setState(() {
          //_count++;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          });
        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:           FloatingActionButtonLocation.centerDocked,
    );
  }
}



class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados puxado do Heroku"),
      ),
      body: Center(
        child: Text(resposta)
      ),
    );
  }
}


/*void getData(BuildContext context, var value){
  setState(() {
      reposta = value.body;
  });
}
*/

Future<http.Response> postRequest () async {
    var url ='https://hasuratester.herokuapp.com/v1/graphql';

    Map data = {
      "query":"query Clientes {\n  clientes {\n    CLI_EMAIL\n    CLI_ID\n    CLI_IDADE\n    CLI_NOME\n    CLI_PONTUACAO\n    CLI_TEL\n  }\n}",
      "operationName":"Clientes"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json", "x-hasura-admin-secret": "123456"},
        body: body
    );
    
    //print("${response.statusCode}");
    //print("${response.body}");
    return response;
}
