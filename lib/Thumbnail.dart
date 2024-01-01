import 'package:flutter/material.dart';
import 'package:movies_app/Details.dart';
class Thumbnail extends StatelessWidget {

  String imgUrl ;
  String title;

  String summary;

  String ratings;
  Thumbnail({super.key,required this.title,required this.imgUrl,required this.summary,required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      height: 200,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 120,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  //fit: BoxFit.contain,
                )
              ),),
            SizedBox(height: 7,),
            Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(imgUrl: imgUrl, title: title, summary: summary,ratings: ratings,)));
        },
      ),
    );
  }
}
