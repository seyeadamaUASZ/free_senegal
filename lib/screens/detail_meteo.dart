import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailMeteo extends StatefulWidget {
  DetailMeteo({Key? key,required this.dateMeteo,
  required this.weather,required this.temp_min,required this.humidity,required this.nameVille}) : super(key: key);
  String dateMeteo;
  String weather;
  double temp_min;
  double humidity;
  String nameVille;

  @override
  State<DetailMeteo> createState() => _DetailMeteoState();
}


class _DetailMeteoState extends State<DetailMeteo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.model);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
          appBar: AppBar(
           backgroundColor: Colors.green,
           centerTitle: true,
           title: Text("météo du : ${widget.dateMeteo}"),
           leading: IconButton(
             onPressed: (){
               Navigator.pop(context);
             },
             icon: Icon(Icons.arrow_back_ios_sharp)
           ),
         ),
         body: Center(
           child: Container(
                  margin: EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      Center(child: 
                       Text("${widget.nameVille}",style: TextStyle(  
                         fontSize: 30,
                         fontStyle: FontStyle.italic,
                         fontWeight: FontWeight.bold
                       ),)
                      ,),
                      SizedBox(height: 20,),
                      Center(
                        child: CircleAvatar( 
                          radius: 50, 
                          backgroundImage: AssetImage("assets/${widget.weather}.jpg"),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text("Température :"+ caculeRound(widget.temp_min).toString()+'°C',style: TextStyle(  
                        fontSize: 18,
                        fontStyle: FontStyle.italic
                      ),),
                      SizedBox(height: 15,),
                      Text("humidité :"+caculeRound(widget.temp_min).toString()+'°C',style: TextStyle(  
                        fontSize: 18,fontStyle: FontStyle.italic),)
                      // Center( 
                      //   child: Row(children: [
                          
                      //   ],),
                      // )
                    ],
                  ),
                ),
         ),
    );
  }

  String caculeRound(double temp){
    int n = (temp - 273.15).round();
    return n.toString();
  }
}