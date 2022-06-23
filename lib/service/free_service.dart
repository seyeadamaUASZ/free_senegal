import 'dart:convert';

import 'package:http/http.dart' as http;

class FreeService{
  String baseUrl = "https://api.openweathermap.org/data/2.5/forecast";
  search(String query)async {
    String url = formater(query);
    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200 ||response.statusCode==201){
      return json.decode(response.body);
    }
    
  }
  formater(String query){
    return baseUrl=baseUrl+"?q=${query}&APPID=a4578e39643716894ec78b28a71c7110";
  }

  Future<http.Response?> checkRepos(String url)async{
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return response;
    }
    return null;
  }


  Future<http.Response> getWeather(String query)async{
   String url=formater(query);
   var response = await http.get(Uri.parse(url));
   if(response.statusCode==200 || response.statusCode==201){
     // log.i(response.body);
      //return json.decode(response.body);
    }

   //log.i(response.body);
   //log.i(response.statusCode);
   return response;
  }

  }
