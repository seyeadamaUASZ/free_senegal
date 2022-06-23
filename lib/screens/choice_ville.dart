import 'package:flutter/material.dart';
import 'package:free_senegal/screens/meteo.dart';

class ChoiceVille extends StatefulWidget {
  ChoiceVille({Key? key}) : super(key: key);

  @override
  State<ChoiceVille> createState() => _ChoiceVilleState();
}

class _ChoiceVilleState extends State<ChoiceVille> {

  List<String> villes=["dakar","abidjan","lyon","londres"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text("Villes"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(
           margin: EdgeInsets.only(top: 40),
           child: Center(child: Text("Veuiller choisir une ville",style: TextStyle(  
             fontSize:15,
             fontWeight: FontWeight.w100
           ),),),
         ),
         SizedBox(height: 15,),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: villes.length,
                itemBuilder: (context,index){
                return Center(child:
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MeteoPage(nameVille: villes[index],)));
                   },
                   child: Card(
                     elevation: 0,
                     child: ListTile(  
                       title: Text(villes[index],textAlign: TextAlign.center,),
                     )
                     ),
                 ));
              
                   //Card(child:ListTile( title: Text("Anchor"),subtitle: Text("Lower the anchor."), leading: CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star))),
              }),
            ),
          ),
        ],
      )
    );
  }
}