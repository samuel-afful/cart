import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'employee.dart';
import 'main.dart';

class ProductDetails extends StatefulWidget {

  final product_detail_name;
  final product_detail_price;
  final product_detail_old_price;
  final product_detail_picture;
   final product_detail_color;
   final int id;

  ProductDetails(
  {this.product_detail_name,
  this.product_detail_color,
  this.product_detail_price,
  this.product_detail_old_price,
  this.product_detail_picture, this.id});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future<List<Employee>> employees;
  var dbHelper;
  String imgstring ;
  String imgname ;
  bool isUpdating;
  bool loading = false;
   int qty = 0;
   //String qtys;
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
  valid(){
    
    Employee employees = Employee(widget.id,widget.product_detail_name,widget.product_detail_picture);
    dbHelper.save(
      employees
    );
    setState(() {
      isUpdating = false;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title:Text('ShopApp'),
        centerTitle: true,
        actions: <Widget>[
       IconButton(icon: Icon(Icons.search),onPressed: (){
        
       },),
       IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()) );
       },),
      
        ],   
      ),
      body: ListView(
        children:<Widget>[
        Container(
          color: Colors.white70,
          height: 300.0,
          child: GridTile(child: Image.asset(widget.product_detail_picture,fit: BoxFit.fill,
          width: 100.0,),
          footer: Container(
            color: Colors.white60,
            alignment:Alignment.center,
            height: 20.0,
            child:ListTile(
              leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,3.0,0.0,0.0),
                  child: Text(widget.product_detail_name),
                ),
            
            title:Row(
              children: <Widget>[
              
                Expanded(child: Text('',style: TextStyle(color: Colors.red,))),
                Expanded(child: Text('',style: TextStyle(
             decoration:TextDecoration.lineThrough)))
              ],
            ))
          ),
          ),
        ),
         SizedBox(height: 30,),
        Row(
          children: <Widget>[
        
             SizedBox(
               height: 32,
               width: 40,
                  child: OutlineButton(onPressed: (){
                   setState(() {
                 qty--;
               });
               },
               padding: EdgeInsets.zero,
               child:Icon(Icons.remove),
                 shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10)
             ),
               ),
             ),
            Text(qty.toString().padLeft(2,"0")),

              SizedBox(
                width: 40,
                height: 32,
                child: OutlineButton(onPressed: (){
                   setState(() {
                 qty++;
             });
             },
           padding: EdgeInsets.zero,
             child:Icon(Icons.add,),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10)
             ),
             ),
              ),
        SizedBox(width: 215,),
        IconButton(icon: Icon(Icons.favorite,color: Colors.red,), onPressed: (){},
        
        ),
     
        ]
        ),
          SizedBox(height:60),
       Row(
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: SizedBox(
               height:40,
               width:40,
               child:OutlineButton(
                 padding: EdgeInsets.zero,
                 child:Icon(Icons.shopping_cart),
                 onPressed: (){
                   Navigator.push(
        context, MaterialPageRoute(builder: (contex)=>
                   HomePage(
                     pname:widget.product_detail_name,
                     photo: widget.product_detail_picture,
                   )));
                  valid();
                 },
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)
               ),
               ),
               
               
             ),
           ),
             Padding(
               padding: const EdgeInsets.all(10.0),     
               child: SizedBox(
                 height:40,
                 width:270,
                 child:FlatButton(child: Text('BUY NOW',style: TextStyle(color: Colors.white),),
                 onPressed: (){},
                 color: Colors.blue,
                 shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
                 ),
                 ),
                 
                 
           ),
             ),
         ],
       )
       ]
       ,
        )
    );
    
  
  }
}