import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



void main()=>runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
     
      home: MyApp(),
      
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
List  data;
 final String url ="https://jsonplaceholder.typicode.com/users";

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsonData();
  }

Future<String> getJsonData() async {
  var response=await http.get(Uri.encodeFull(url),
  headers: {"Accept": "application/json"});
  
  setState(() {
    data=json.decode(response.body);
  });

return "Success";

}


      @override
      Widget build(BuildContext context) {
        return  Scaffold(
          appBar: AppBar( title: Text('Flutter Json network')),
          body: ListView.builder(
            itemCount: data==null ? 0:data.length,
            itemBuilder: (BuildContext context,int index){
              return Card(
                   child: ListTile(
                  title: Text(data[index]['name']),
                  leading: Icon(Icons.person),
                  subtitle: Text(data[index]['email']),

                    ),
              );
            },
          ),
                  );          
           }
    
      
}