import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:movies_app/models/MovieModel.dart';
import 'services/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> res = [];

  List<Movie> srchres =[];
  List<Movie> getSrchlist()=> srchres;
  List<Movie> getlist() => res;

  Future getRes() async {
    List<Movie>? r = await MovieService().getMovie();
    //print("in provide");
    if(r!=null){
      res=r;
    }
    notifyListeners();
  }

  Future getSearch(String searchItem) async{
    List<Movie>? res=await MovieService().getSearch(searchItem);
    if(res!=null){
      srchres=res;
    }
    notifyListeners();
  }

}