import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_list/addlist.dart';
import 'package:to_do_list/updatelist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("ToDo List",),
      ),
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context,snapshot) {
           final data = snapshot.data!;
           return ListView.builder(
               itemCount: data.length,
               itemBuilder: (context,index){
                 return Container(
                   child: Column(
                     children: [
                       Card(
                         child: ListTile(
                           title: Text(data[index]["title"],
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,fontSize: 18),),
                           subtitle: Text(data[index]["desc"],
                             style: TextStyle(fontSize: 17),),
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 UpdateList(id: data[index]["Id"],
                                     title: data[index]["title"],
                                     desc: data[index]["desc"])));
                           },
                         ),
                       )
                     ],
                   ),
                 );
               });
      }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return AddList();
           }));
        },

      ),
    );
  }
}
Future<List>getData()async{
var url = Uri.parse("http://172.20.10.3//todolist/getdata.php");
final res = await http.get(url);
var dataReceived = jsonDecode(res.body);
//print(dataReceived);
return dataReceived;
}
