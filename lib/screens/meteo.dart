
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:free_senegal/screens/detail_meteo.dart';
import 'package:free_senegal/service/free_service.dart';

import 'package:http/http.dart' as http;
class MeteoPage extends StatefulWidget {
  MeteoPage({Key? key,required this.nameVille}) : super(key: key);
  final String nameVille;

  @override
  State<MeteoPage> createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  FreeService _freeService=FreeService();
   dynamic data=null;
   List<dynamic> listItems=[];
   bool circular = true;
  
  void fetchData(String query)async{
    var response = await _freeService.getWeather(query);
    setState(() {
      data = json.decode(response.body);
      listItems.addAll(data['list']);
      circular=false;
      //print(listItems);
    });
   
    //print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(widget.nameVille);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
         appBar: AppBar(  
           title: Text("Météos de la ville :${widget.nameVille}"),
           backgroundColor: Colors.green,
           leading: IconButton(  
             onPressed: (){
                Navigator.pop(context);
             },
             icon: Icon(Icons.arrow_back_ios_sharp)
           ),
         ), 
         body:Container( 
           margin: EdgeInsets.only(top: 38), 
           child: circular ? Center(child: 
           CircularProgressIndicator()
           ,): 
           ListView.separated(itemBuilder: (context,index){
             return InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailMeteo(
                   dateMeteo: listItems[index]['dt_txt'],
                   weather: listItems[index]['weather'][0]['main'],
                   humidity: listItems[index]['main']['humidity'] ,
                   temp_min: listItems[index]['main']['temp_min'],
                   nameVille: widget.nameVille,
                 )));
               },
               child: ListTile(  
                    title: Row(
                      children: [
                        Row(
                          children: [
                            CircleAvatar( 
                              backgroundImage:AssetImage("assets/${listItems[index]['weather'][0]['main']}.jpg") ,
                            ),                        
                            SizedBox(width: 15,),
                            Text(caculeRound(listItems[index]['main']['temp_min'].toString())+'°C'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Text("Situation : "),
                        SizedBox(width: 17,),
                        Text(listItems[index]['weather'][0]['description']) 
                      ],
                    ),
               ),
             );
           }, 
            separatorBuilder: (context, index) => Divider(height: 2,color: Colors.green,), 
           itemCount: listItems.length)
         )
    );
  }

  String caculeRound(String temp){
    int n = (double.parse(temp) - 273.15).round();
    return n.toString();
  }
}