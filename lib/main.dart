import 'package:flutter/material.dart';
import 'employee.dart';
import 'dart:async';
import 'db_helper.dart';
import 'product.dart';

void main() => runApp(MaterialApp(
 home:Products(),
 debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
 final String photo;
 final String pname;
 final int id;

HomePage({this.photo, this.pname, this.id});

 
 
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Employee>> employees;
 var dbHelper;
 
  // String imgstring ;
  // String imgname ;
  bool isUpdating;
  //bool loading = false;  

   @override
  void initState() {
    super.initState();
    
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList(){
    employees = dbHelper.getEmployees();
  }

  // time(){
  //   Timer(Duration(seconds: 5),
  //    ()=> CircularProgressIndicator());
  // }
  
  valid(){
    Employee employees = Employee(widget.id,widget.pname,widget.photo);
    dbHelper.save(
      employees
    );
    setState(() {
      isUpdating = false;
    });
  }


 dataTable(List<Employee> employees){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ListView(
        children:employees.map((employee){
          return ListTile(
         leading: CircleAvatar(
           backgroundImage:AssetImage(employee.photoUrl)
         ),
         title: Row(
           children:<Widget>[
                Expanded(child: Text(employee.name)),
                // Expanded(child: Text(employee.id.toString())),
                 Expanded(child:IconButton(icon:Icon(Icons.delete) , onPressed: (){
                   dbHelper.delete(employee.id);
                   setState(() {
                    refreshList();    
                   });
                      
                   
                          
                 }))
              ]
         ),
          );
          // return Container(
          //   child:Column(
          //     children:<Widget>[
          //       Text(employee.name),
          //       Image.asset(employee.photoUrl),

          //        Text(employee.id.toString())
          //     ]
          //   )
          // );
        }).toList() ,
        ),
    );
}
   
  list() {
    return Expanded(

      child:FutureBuilder(
        future: employees,
        builder:(context,snapshot) {
        if(snapshot.hasData){
        dataTable(snapshot.data);
        }
        if(null == snapshot.data || snapshot.data.length == 0){
          return Text("No Item Added To Cart");
        }
        return  dataTable(snapshot.data);
        }),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SQLITE CRUD DEMO'),
        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.add),onPressed: (){
        //     valid();
        //   },),
        //   IconButton(icon: Icon(Icons.refresh),onPressed: (){
        //     setState(() {
          
        //        refreshList();
            
        //     });
        //   },)
        // ],
      ),
      body: Container(
        child:(
          Column(children: <Widget>[         
            list()
          ],)
        )
      ),
    );
  }
}











