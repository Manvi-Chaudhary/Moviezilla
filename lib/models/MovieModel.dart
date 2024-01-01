class Movie{
  String title;
  String imgUrl;
  String summary;

  String ratings;



  Movie({required this.title,required this.imgUrl,required this.summary,required this.ratings});

  factory Movie.fromJson(Map<String, dynamic> parsedJson){
    String ratings="NA";
    if(parsedJson['show']['image']==null){

      return Movie(title: "NA", imgUrl: "NA", summary: "NA",ratings:"NA");
    }
    if(parsedJson['show']['rating']==null){
      ratings="NA";
    }
    else{
      if(parsedJson['show']['rating']['average']==null){
        ratings ="NA";
      }
      else{
        ratings=parsedJson['show']['rating']['average'].toString();
      }
    }


    return Movie(
        title : parsedJson['show']['name'].toString() ,
        imgUrl : parsedJson['show']['image']['medium'].toString(),
        summary: parsedJson['show']['summary'].toString(),
      ratings: ratings,
    );
  }
}