class Movies {
  
final  int id ;
final  String? posterPath;
final  String title ;
final  String? backdropPath;
final List<int> genreIds;
final String overView;
final double voteAverage;

const Movies({
  required this.id, 
  this.posterPath, 
  required this.title, 
  this.backdropPath, 
  required this.genreIds, 
  required this.overView, 
  required this.voteAverage
}
  );



}