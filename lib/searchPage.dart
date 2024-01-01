import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/MovieProvider.dart';
import 'package:movies_app/models/MovieModel.dart';
import 'Thumbnail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {



  @override
  Widget build(BuildContext context) {

    String searchItem="";
    return Scaffold(
      body:  Container(
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              color: Colors.blue,
              child: Row(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                        hintText: 'Search a movie',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.search_rounded),
                      prefixIconColor: Colors.black,
                    ),
                    onChanged: (String value){
                      setState(() {
                        searchItem=value;
                        print(searchItem);
                      });
                    },
                  ), /*IconButton(
              icon: Icon(Icons.send,color: Colors.white,),
              onPressed: (){
              Provider.of<MovieProvider>(context,listen: false).getSearch(searchItem);
              },

          )*/
                ],
              ),
            ),
            /*Container(
              child: Consumer<MovieProvider>(builder: (context, value, child) {
                List<Movie> res = value.getSrchlist();
                if(res.length>0){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Results",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context,index){
                                  print(res[index].title);
                                  if(res[index].title=="NA"){
                                    return Container();
                                  }
                                  return Thumbnail(title: res[index].title, imgUrl: res[index].imgUrl, summary: res[index].summary);
                                },
                                separatorBuilder: (context,index){
                                  return SizedBox(width: 10,);
                                },
                                itemCount: res.length),
                          ),

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
            ),*/
          ],
        ),
      ),

    );
  }
}
