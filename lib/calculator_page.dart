

import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return CalculatorPageState();
  }

}
class CalculatorPageState extends State<CalculatorPage>{
  TextEditingController no1Controller =TextEditingController();
  TextEditingController no2Controller=TextEditingController();

  String resuld=" ";
   int check =0;
   var color=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Calculator",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
      ),
      body:Center(
        child: Container(
          width: 330,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),
          //   image: DecorationImage(
          //       image: NetworkImage("https://images.pexels.com/photos/1906658/pexels-photo-1906658.jpeg?auto=compress&cs=tinysrgb&w=600"),
          //   fit: BoxFit.cover
          //   )
           ),
          /// stack widget
          child:  Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(500),bottomLeft: Radius.circular(0))
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(500),topRight: Radius.circular(0))
                  ),
                ),
              ),
              Column(
                children: [
                  /// Textfield 1
                  SizedBox(height: 100,),
                  Container(
                    width: 200,
                    child: TextField(
                     controller: no1Controller,
                      decoration: InputDecoration(
                        hintText: "Enter Number"
                      ),
                      ),
                    ),
                  /// Textfield
                  Container(
                    width: 200,
                    child: TextField(
                      controller: no2Controller,
                      decoration: InputDecoration(
                        hintText: "Enter Number"
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// addition
                      ElevatedButton(
                          onPressed: (){

                            check=1;


                          }, child: Text("+")),
                      /// substraction
                      ElevatedButton(
                          onPressed: (){
                            check=2;
                          }, child: Text("-")),
                      /// multiplication
                      ElevatedButton(
                          onPressed: (){

                            check=3;
                          }, child: Text("X")),
                      ElevatedButton(
                          onPressed: (){

                            check=4;
                          }, child: Text("/"))
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: (){
                          calculator();
                        }, child: Text("Calculate")),
                  ),
                  SizedBox(height: 30,),
                  Container(
                      width:300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black,
                        width: 4)
                      ),
                      child: Center(child: Text(resuld )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void calculator(){
    if(no1Controller.text!="" && no2Controller.text!=""){
      int no1=int.parse(no1Controller.text.toString());
      int no2=int.parse(no2Controller.text.toString());
      if(check==1){
        int add=no1+no2;
        resuld="$color";
        resuld="The Addition of number is $add";
      }else if(check==2){
        int sub= no1-no2;
        resuld="The Subtraction of number is $sub";
      }else if(check==3){
        int mul=no1*no2;
        resuld="The Multiplication of number is $mul";
      }else if(check==4){
        num div=no1/no2;
        resuld="The Division of number is $div";
      }else{
        resuld="Select the Oprations";
      }
    }else{
      resuld="Enter number";
    }
    setState(() {

    });
  }
}