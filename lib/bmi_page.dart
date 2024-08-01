
import 'dart:math';

import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BmiPageState();

  }

}
class BmiPageState extends State<BmiPage>{
  TextEditingController fitController=TextEditingController();
  TextEditingController inchController=TextEditingController();
  TextEditingController weightController=TextEditingController();

  String result="";
  var color=Colors.white;
  var image="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text("Bmi")
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 330,
            height: 600,
            decoration: BoxDecoration(
              color:Colors.green,
              borderRadius: BorderRadius.circular(50)
            ),
            child:Stack(
              children: [
                Container(
                  color: color,
                ),
                /// textfild
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      /// text field for fit
                      Container(
                        width: 200,
                        child: TextField(
                          controller:fitController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Height",
                            hintText: "Enter height in fit"
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      /// text field for inch
                      Container(
                        width: 200,
                        child:TextField(
                          controller: inchController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Height",
                            hintText:"Enter Height in inch"
                          ),
                        ) ,
                      ),
                      SizedBox(height: 20,),
                      /// text field for weight
                      Container(
                        width: 200,
                        child:TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Weight",
                            hintText: "Enter weight",
                          ),
                        )
                      ),
                      SizedBox(height: 10,),
                      /// button
                      Container(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if( fitController.text!="" && inchController.text!="" && weightController.text!=""){
                              int fit=int.parse(fitController.text.toString());
                              int inch=int.parse(inchController.text.toString());
                              int weig=int.parse(weightController.text.toString());
          
                              int totalinch=fit*12+inch;
                              num totalcm =totalinch*2.57;
                              num totalmetr=totalcm/100;
          
                              num sum =pow(totalmetr,2.0);
                              num  bmi=weig/sum;
          
                              print(bmi);
                              if(bmi>25){
                                result="You are OverWeight";
                                color=Colors.red;
                                image="assert/image/ic_fatboy.jpg";
                              }else if(bmi<18){
                                result="You are UnderWeight";
                                image="assert/image/thin boy.jpg";
                                //yellow;
                                color=Colors.yellow;
                              }else{
                                //green;
                                color=Colors.green;
                                image="assert/image/ic_healthy.jpg";
                                result="You are Healthy";
                              }
                            }else{
                              result="Enter the Value ";
                            }
                            setState(() {
          
                            });
                          },child: Text("Calculate BMI"),
                        ),
                      ), SizedBox(height: 10,),
                      Text(result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image),
                            fit: BoxFit.cover
          
                          )
                        ),
          
                      )
          
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

