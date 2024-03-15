import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_list/home.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final no = new TextEditingController();
  final title = new TextEditingController();
  final desc = new TextEditingController();
  bool _valno=false;
  bool _valtitle = false;
  bool _valdesc = false;
 Future _savedetails(String title, String desc)async{
   var url = Uri.parse("http://172.20.10.3//todolist/savedata.php");
   final response = await http.post(url,body: {"title": title,"desc":desc});
   var res = response.body;
   if(res == "true"){
     Navigator.pop(context);
   }
   else{
     print("error" + res);
   }
  }
  void dispose(){
    no.dispose();
    title.dispose();
    desc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new list"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "Title",
                  errorText: _valtitle ? 'Title can not be empty': null,
                ),
              ),
              TextField(
                controller: desc,
                decoration: InputDecoration(
                  hintText: "Description",
                  errorText: _valdesc ? 'Title can not be empty': null,
                ),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(
                            () {
                      title.text.isEmpty? _valtitle = true: _valtitle=false;
                      desc.text.isEmpty? _valdesc = true: _valdesc=false;
                      if(_valtitle == false && _valdesc == false){
                        _savedetails(title.text,desc.text);
                      }
                    });
                  },
                    child: Text("Save",
                    style: TextStyle(color: Colors.black),),
                    style: TextButton.styleFrom(backgroundColor:Colors.green),),
                  ElevatedButton(onPressed: (){
                    title.clear();
                    no.clear();
                    desc.clear();
                  },
                    child: Text("Clear",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(backgroundColor:Colors.red),),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
