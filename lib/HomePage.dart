import 'package:flutter/material.dart';
import 'package:movies_app/Thumbnail.dart';
import 'package:movies_app/models/MovieModel.dart';
import 'package:movies_app/searchPage.dart';
import 'package:movies_app/services/movie.dart';
import 'package:movies_app/MovieProvider.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/Search.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).getRes();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("MOVIEZILLA",style: TextStyle(color: Color.fromRGBO(203,37,43,1),),),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));
          }, icon: Icon(Icons.search_rounded,color: Colors.white,),)
        ],
      ),
        body:  Consumer<MovieProvider>(builder: (context, value, child) {
          List<Movie> res = value.getlist();
          if(res.length>0){
            return Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Popular",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        if(res[index].title=="NA"){
                          return Container();
                        }
                        return Thumbnail(title: res[index].title, imgUrl: res[index].imgUrl, summary: res[index].summary,ratings: res[index].ratings);
                      },
                      separatorBuilder: (context,index){
                        return SizedBox(width: 10,);
                      },
                      itemCount: res.length),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Trending Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        if(res[index].title=="NA"){
                          return Container();
                        }
                        return Thumbnail(title: res[index].title, imgUrl: res[index].imgUrl, summary: res[index].summary,ratings: res[index].ratings,);
                      },
                      separatorBuilder: (context,index){
                        return SizedBox(width: 10,);
                      },
                      itemCount: res.length),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Action",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        if(res[index].title=="NA"){
                          return Container();
                        }
                        return Thumbnail(title: res[index].title, imgUrl: res[index].imgUrl, summary: res[index].summary,ratings: res[index].ratings);
                      },
                      separatorBuilder: (context,index){
                        return SizedBox(width: 10,);
                      },
                      itemCount: res.length),
                )
              ],
            ),
          ),
        );

      }else{

        return Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Center(child :Text("No Movies Found",style: TextStyle(color: Colors.white),)));
      }
      }),

    );
  }
}
