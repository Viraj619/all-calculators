

import 'dart:math';

import 'package:flutter/material.dart';

class BmisPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BmiState();
  }

}

class BmiState extends State<BmisPage>{

  TextEditingController ageController=TextEditingController();
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();

  String result="";
  String totalbmi="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:Center(
              child:Text("BMI Calculator")
          )
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Container(
            width: 350,
            height: 600,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:200 ,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage("assert/image/bg_heart.png")
                        ),
                      ),
                      child: Center(child: Text("$totalbmi",style: TextStyle(fontSize:25,color:Colors.red),)),
                    ),
        
                  ],
                ),
                Text("$result",style:TextStyle(fontSize:25,color: Colors.green)),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Male"),
                        IconButton(
                          onPressed: (){
        
                          }, icon:Icon (Icons.male,size: 50,),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Female"),
                        IconButton(
                            onPressed:(){
        
                            }, icon:Icon(Icons.female,size: 50,)
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          child: TextField(
                            controller:ageController ,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Age",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 60,
                            child:TextField(
                              controller:heightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "Height"
                              ),
                            )
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 60,
                            child:TextField(
                              controller: weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "Weight"
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
                //SizedBox(height: 50,),
                Container(
                  width: 350,
                  height: 70,
                  decoration: BoxDecoration(
                    border:Border.all(color: Colors.black12,
                        width: 6),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
        
                  child: TextButton(
                    onPressed: (){
                      if(ageController.text!="" && heightController.text!="" && weightController.text!="") {
                        int height = int.parse(heightController.text.toString());
                        int weight = int.parse(weightController.text.toString());
        
        
        
                        num bmi = weight / pow(height / 100,2);
                        totalbmi="${bmi.toStringAsFixed(2)}";
        
        
        
                        if(bmi>25){
        
                          result="You are OverWeight";
        
                        }else if(bmi<18){
                           result="You are UnderWeight";
                        }else{
        
                          result="You are Healthy";
                        }
        
                      }else{
                           result="Enter the Value ";
                         }
                      setState(() {
        
                      });
        
                    },child: Text("Calculate BMI",style:TextStyle(fontSize:25,color: Colors.white)),
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