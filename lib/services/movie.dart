import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:movies_app/models/MovieModel.dart';

class MovieService {
  
  Future<List<Movie>?> getSearch(String search_term) async{
    try{
      print("srch : "+search_term);
      dynamic res= await http.get(Uri.parse("https://api.tvmaze.com/search/shows?q=${search_term}"));
      if (res.statusCode == 200) {
        print("hii");
        var data = jsonDecode(res.body);

        var r = (data as List)
            .map((data) => new Movie.fromJson(data))
            .toList();
        return r;
      }
      else{
        return null;
      }
      
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future<List<Movie>?> getMovie() async {
    try {
      dynamic res = await http.get(
          Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        //print("in movieserice : "+data[0]['show']['name'].toString());

        var r = (data as List)
            .map((data) => new Movie.fromJson(data))
            .toList();
        //print("in movieserice 3 : "+r.length.toString());
        return r;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}