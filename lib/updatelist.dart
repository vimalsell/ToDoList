import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateList extends StatefulWidget {
  final String id;
  final String title;
  final String desc;
  const UpdateList({required this.id,required this.title,required this.desc});

  @override
  State<UpdateList> createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  final no = new TextEditingController();
  final title = new TextEditingController();
  final desc = new TextEditingController();
  bool _valno=false;
  bool _valtitle = false;
  bool _valdesc = false;
  void dispose(){
    no.dispose();
    title.dispose();
    desc.dispose();
    super.dispose();
  }
  @override
  void initState() {
    title.text = widget.title;
    desc.text=widget.desc;
    super.initState();
  }
  Future _updatedetails(String title, String desc)async{
    var url = Uri.parse("http://172.20.10.3//todolist/update.php");
    final response = await http.post(url,body: {"title": title,"desc":desc,"Id":widget.id});
    var res = response.body;
    if(res == "true"){
      Navigator.pop(context);
    }
    else{
      print("error" + res);
    }
  }
  Future _deletedetails(String title, String desc)async{
    var url = Uri.parse("http://172.20.10.3//todolist/deletedata.php");
    final response = await http.post(url,body: {"title": title,"desc":desc,"Id":widget.id});
    var res = response.body;
    if(res == "true"){
      Navigator.pop(context);
    }
    else{
      print("error" + res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update list"),
        backgroundColor: Colors.orange,
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
                    setState(() {
                      title.text.isEmpty? _valtitle = true: _valtitle=false;
                      desc.text.isEmpty? _valdesc = true: _valdesc=false;
                      if(_valtitle == false && _valdesc == false){
                        _updatedetails(title.text, desc.text);
                        setState(() {
                        });
                      }
                    });
                  },
                    child: Text("Update",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(backgroundColor:Colors.green),),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _deletedetails(title.text, desc.text);
                    });
                  },
                    child: Text("Delete",
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
