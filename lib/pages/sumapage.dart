import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_suma/services/sumarservice.dart';

class SumaPage extends StatefulWidget {
  SumaPage({Key? key}) : super(key: key);

  @override
  _SumaPageState createState() => _SumaPageState();
}

class _SumaPageState extends State<SumaPage> {
 InputDecoration dec1=InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 20.0),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0),borderRadius: BorderRadius.circular(20.0)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3.0),borderRadius: BorderRadius.circular(20.0)),
                      hoverColor: Colors.yellow, 
                      errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2.0),borderRadius: BorderRadius.circular(20.0)), 
                      
                      
                      
                      
                      focusedErrorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0),borderRadius: BorderRadius.circular(20.0)),                                
                    );
 
 
  SumaService ssum=SumaService();
  String result="0";
  TextEditingController tnum1=TextEditingController(text: "0");
  TextEditingController tnum2=TextEditingController(text: "0");
  @override




  Widget build(BuildContext context) {
    
    return Scaffold(
     backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
          width: 600,
          height: double.infinity,
          color: Colors.green,
          child: Column(
            children: [
             Container(
               alignment: Alignment.centerLeft,
               child: Text('Primer Numero:')
             ),
              SizedBox(height: 20,),
              TextField(
                controller: tnum1,
                keyboardType: TextInputType.number,
                  decoration: dec1,
                  inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp ( r"[0-9]" ))
                    ],
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Segundo Numero:')
              ),
              SizedBox(height: 20,),
              TextField(
                controller: tnum2,
                keyboardType: TextInputType.number,
                decoration: dec1,
                inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp ( r"[0-9]" ))
                    ],
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                child: Text('Sumar'),
                style: ElevatedButton.styleFrom(
                      
                        side: BorderSide(color: Colors.white),
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                        primary: Colors.green[400],
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ),
                onPressed: (){
                    ssum.getsuma(tnum1.text, tnum2.text).then((value)  {
                        setState(() {
                            result=value;
                        });
                    });
                    
                }
              ),
              SizedBox(height: 30,),
              Container(
                child: Text('La suma es: '+result,style: TextStyle(fontSize: 30),),
              )
            ],
          ),
          
          
        ),
      ),
      
    );
  }
}