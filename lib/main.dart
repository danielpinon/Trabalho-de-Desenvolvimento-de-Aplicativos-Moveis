import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';


void main() => runApp(MyApp());

String url = 'https://hasuratester.herokuapp.com/v1/graphql';
HasuraConnect hasuraConnect = HasuraConnect(url);

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
        onPressed: () => setState(() {
          //_count++;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        }),
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
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

/*getData() async {
  String url = 'https://hasuratester.herokuapp.com/v1/graphql';
  Map map = {
    'clientes': {
      'CLI_ID',
      'CLI_EMAIL',
      'CLI_IDADE',
      'CLI_NOME',
      'CLI_PONTUACAO',
      'CLI_TEL'
     },
  };
  
  print(await apiRequest(url, map));
}
*/
