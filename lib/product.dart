import 'package:flutter/material.dart';
import 'main.dart';
import 'product_detail.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}



class _ProductsState extends State<Products> {
  var product =[
      {
     "name":"Men Blazer",
     "price":85,
     "old price":90,
     "picture":"images/products/blazer1.jpeg",
     "color":Colors.blue
    },
    {
     "name":"Blazer",
     "price":85,
     "old price":90,
     "picture":"images/products/blazer1.jpeg",
     "color":Colors.blue
    },
     {
     "name":"Ladies Blazer",
     "price":85,
     "old price":90,
     "picture":"images/products/blazer2.jpeg",
     "color":Colors.black
    },
     {
     "name":" Blazer",
     "price":85,
     "old price":90,
     "picture":"images/products/blazer2.jpeg",
     "color":Colors.black
    },
     {
     "name":" Red Dress",
     "price":85,
     "old price":90,
     "picture":"images/products/dress1.jpeg",
     "color":Colors.pink
    },
    {
     "name":" Red",
     "price":85,
     "old price":90,
     "picture":"images/products/dress1.jpeg",
     "color":Colors.pink
    },
     {
     "name":"Black Dress",
     "price":75,
     "old price":90,
     "picture":"images/products/dress2.jpeg",
     "color":Colors.black
    },
    {
     "name":"Black",
     "price":85,
     "old price":90,
     "picture":"images/products/dress2.jpeg",
     "color":Colors.black
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:<Widget>[
          IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()) );
          },)
        ]
      ),
          body: Column(
            children: <Widget>[
              Expanded(
         child: GridView.builder(
        itemCount:product.length ,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
                return Single_prod(
                  name:product[index]['name'],
                  prod_new_price: product[index]['price'],
                  prod_old_price: product[index]['old price'],
                  prod_picture: product[index]['picture'],
                  prod_color: product[index]['color'],
                );
        },
        ),
              ),
            ],
          ),
    );    
  }
}

class Single_prod extends StatelessWidget {
  final name;
  final prod_old_price;
  final prod_new_price;
  final prod_picture;
  final prod_color;

  Single_prod({this.name,this.prod_new_price,this.prod_old_price,this.prod_picture,this.prod_color});
  @override
  Widget build(BuildContext context) {
    return Card(
     child: Hero(tag: name, child: Material(
       child: InkWell( onTap:()=>Navigator.push(
        context, MaterialPageRoute(builder: (contex)=>ProductDetails(
            product_detail_name: name,
           product_detail_old_price: prod_old_price,
           product_detail_price: prod_new_price,
           product_detail_picture: prod_picture,
           product_detail_color:prod_color,

           
         )
         )
         ),
         child: GridTile(child: Image.asset(prod_picture,fit: BoxFit.fill,),
         footer: Container(
           height:60.0 ,
           color: Colors.white70,
           child:ListTile(
             leading:Text(name),
             subtitle:Text('',style: TextStyle(
             decoration:TextDecoration.lineThrough)
             ) ,
             title:Text('',style: TextStyle(color: Colors.red,),)     
           )
         ),
         ),
       ),
     )), 
    );
  }
}


