import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/MovieProvider.dart';
import 'package:movies_app/models/MovieModel.dart';
import 'Thumbnail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String searchItem="";
  void UpdateList(){
    Provider.of<MovieProvider>(context,listen: false).getSearch(searchItem);
    List<Movie> res=Provider.of<MovieProvider>(context,listen: false).getSrchlist();
    print("Search list");
    if(res.length>0){
      print(res[0].title);
    }

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left:10),
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextField(
                      style: TextStyle(color: Colors.white,fontSize: 20),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search a movie",
                        hintStyle: TextStyle(color: Colors.white,fontSize: 20),

                      ),
                      onChanged: (String value){
                        setState(() {
                          searchItem=value;
                          print(searchItem);
                        });
                      },
                    ),
                  ),
                  IconButton(onPressed: (){
                    print(searchItem);
                    UpdateList();
                  }, icon: Icon(Icons.search_rounded,color: Colors.white))
                ],
              ),
              Container(
                child: Consumer<MovieProvider>(builder: (context, value, child) {
                  List<Movie> res = value.getSrchlist();
                  if(res.length>0){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQuery.of(context).size.height*0.9,
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
                              height: MediaQuery.of(context).size.height*0.9,
                              child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 2.0,
                                      mainAxisSpacing: 8.0,
                                    childAspectRatio: 0.9,
                                  ),

                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context,index){
                                    print(res[index].title);
                                    if(res[index].title=="NA"){
                                      return Container();
                                    }
                                    return Thumbnail(title: res[index].title, imgUrl: res[index].imgUrl, summary: res[index].summary,ratings: res[index].ratings);
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
