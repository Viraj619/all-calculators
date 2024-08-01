

import 'package:flutter/material.dart';

class TipcalcutatorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TipcalculatState();

  }

}

class TipcalculatState extends State<TipcalcutatorPage>{
  TextEditingController billController= TextEditingController();
  int flag=0;
  int count=1;
  String tips="000";
  String totalbil="000";
  String result="000";
  String warring="";
  num totalbill=0;
  num split=0;
  num tip=0;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Tip Calculator"),
     ),
     body: SingleChildScrollView(
       child: Container(
         width: 330,
         height: 600,
         decoration: BoxDecoration(
          // color: Colors.green,
           borderRadius: BorderRadius.circular(20)
         ),
         child: Stack(
           children: [
             Align(
               alignment: Alignment.centerLeft,
               child: Padding(
                 padding: const EdgeInsets.only(left: 110.0,bottom: 30),
                 child: Container(
                   width: 200,
                   height: 30,
                   child: Text("$warring",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 ),
               ),
             ),
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(height: 110,),
                     Container(
                       width: 60,
                       height: 50,
                       decoration: BoxDecoration(
                         image:DecorationImage(
                             fit: BoxFit.fitHeight,
                             image: AssetImage("assert/image/ic_hat.png",)

                         ),
                       ),
                     ),
                     //  SizedBox(width:10,),
                     Text("Mr",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold) ,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("TIP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                         Text("Calculator",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                       ],
                     ),
                   ],
                 ),
                 Column(
                   children: [
                     Text("Total P/Person"),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("\$",style: TextStyle(fontSize: 10),),
                         Text("${result.toString()}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)
                       ],
                     ),
                     Text("___________________________"),
                     /// text for total bill and total tip
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Column(
                           children: [
                             Text("Total bill"),
                             Row(
                               children: [
                                 Text("\$",style: TextStyle(fontSize:10,color: Colors.lightBlueAccent)),
                                 Text("$totalbil",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent),)
                               ],
                             )
                           ],
                         ),
                         SizedBox(width: 50,),
                         Column(
                           children: [
                             Text("Total tip"),
                             Row(
                               children: [
                                 Text("\$",style: TextStyle(fontSize:10,color: Colors.lightBlueAccent),),
                                 Text("$tips",style: TextStyle(fontSize: 25,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.lightBlueAccent),),
                               ],
                             )
                           ],
                         )
                       ],
                     ),
                     /// text field for bill
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Column(
                           children: [
                             Text("Enter",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                             Text("your bill :",style: TextStyle(fontSize: 16),),
                           ],
                         ),
                         Container(
                           width: 230,
                           child: TextField(
                             controller: billController,
                             keyboardType: TextInputType.number,
                             decoration: InputDecoration(
                               hintText: "\$",hintStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                             ),
                           ),
                         ),

                       ],
                     ),
                     SizedBox(height: 40,),
                     /// percentage
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Column(
                           children: [
                             Text("Choose",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                             Text("your tip",style: TextStyle(fontSize: 16),)
                           ],
                         ),
                         Container(
                           width: 60,
                           height: 40,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.blue
                           ),
                           child: TextButton(
                             onPressed: (){
                               flag=1;
                             },child: Text("10%",style: TextStyle(fontSize:16,color: Colors.white),),
                           ),
                         ),
                         Container(
                           width: 60,
                           height: 40,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.blue
                           ),
                           child: TextButton(
                             onPressed: (){
                               flag=2;
                             },child: Text("15%",style: TextStyle(fontSize:16,color: Colors.white),),
                           ),
                         ),
                         Container(
                           width: 60,
                           height: 40,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.blue
                           ),
                           child: TextButton(
                             onPressed: (){
                               flag=3;
                             },child: Text("20%",style: TextStyle(fontSize:16,color: Colors.white),),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 20,),
                     ///  calculate button
                     Padding(
                       padding: const EdgeInsets.only(left: 80.0),
                       child: Container(
                         width: 230,
                         height: 50,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.blue
                         ),
                         child: TextButton(
                           onPressed: (){
                             if(billController.text!=""){
                               int bill=int.parse(billController.text.toString());
                               if(flag==1){
                                 tip= bill*0.1;
                                tips="$tip";

                                 totalbill=bill+tip;
                                totalbil="$totalbill";

                                  split=totalbill/count;
                                result="${split.toStringAsFixed(2)}";

                                print(split);
                               }else if(flag==2){
                                 tip=bill*0.15;
                                 tips="$tip";

                                 totalbill=bill+tip;
                                 totalbil='$totalbill';

                                 split=totalbill/count;
                                 result="${split.toStringAsFixed(2)}";
                               }else if(flag==3){
                                 tip =bill*0.20;
                                 tips="$tip";

                                 totalbill=bill+tip;
                                 totalbil="$totalbill";

                                 split=totalbill/count;
                                 result='${split.toStringAsFixed(2)}';
                               }

                             }else{
                               warring="Enter value";
                             }
                             setState(() {

                             });

                           },child: Text("Custom tip",style: TextStyle(fontSize:20,color: Colors.white,),),
                         ),
                       ),
                     ),
                     SizedBox(height: 40,),
                     ///  split the total
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Column(
                           children: [
                             Text("Split",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                             Text("the total",style: TextStyle(fontSize:16),),
                           ],
                         ),
                         Container(
                           width: 60,
                           height: 40,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(topLeft:Radius.circular(5),bottomLeft: Radius.circular(5)),
                               color: Colors.blue
                           ),
                           child:TextButton(
                             onPressed: (){
                               if(count>1){
                                 count--;
                               }
                               setState(() {

                               });
                             },child: Text("-",style: TextStyle(fontSize:16,color: Colors.white),),
                           ),
                         ),
                         Container(
                           width: 80,
                           height: 30,
                           child: Center(child: Text("$count",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                         ),
                         Container(
                           width: 60,
                           height: 40,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                             color: Colors.blue,
                           ),
                           child: TextButton(
                             onPressed: (){
                                 count++;
                                 setState(() {

                               });
                             },child: Text("+",style: TextStyle(fontSize:16,color: Colors.white),),
                           ),
                         )
                       ],
                     )
                   ],
                 )
               ],
             )
           ],
         ),
       ),
     ),
   );
  }

  }

