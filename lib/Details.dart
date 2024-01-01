import 'dart:ui';

import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  String imgUrl ;
  String title;
  String summary;
  String ratings;
  DetailsPage({super.key,required this.imgUrl,required this.title,required this.summary,required this.ratings});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MOVIEZILLA",style: TextStyle(color: Color.fromRGBO(203,37,43,1),),),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image.png"),
            fit: BoxFit.cover,
          )
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: MediaQuery.of(context).size.height,

        child:BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 50.0),child :
    Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.imgUrl),

                      )
                  ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 20,),
                    Text("English",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 20),),
                    SizedBox(height: 10,),
                    Text("Ratings : "+widget.ratings+"/10",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 20),),
                    SizedBox(height: 10,),
                    Transform.scale(scale : 1.5,child : IconButton(icon : Image.asset("assets/play.png"),onPressed: (){},)),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),

            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
                child: Text(widget.summary.replaceAll("<p>", "").replaceAll("</p>", "").replaceAll("<b>", "").replaceAll("</b>", ""),style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 18),textAlign: TextAlign.center,)),
          ],
        ),
      ),
    ));
  }
}
