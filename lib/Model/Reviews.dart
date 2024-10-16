class Reviews {
  String? title;
  int? rate;
  String? user;
  String? date;
  dynamic ?poster;
  String ?snippet;

  Reviews({this.title,this.snippet, this.rate, this.date, this.poster,  this.user});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "rate": rate,
      "snippet": snippet,
      "user": user,
      'date': date,
      "poster": poster,
    };
  }

  factory Reviews.fromJson(jsonData) => Reviews(
    title: jsonData["market_name"],
    poster: jsonData["poster"],
    rate: jsonData["rate"],
    snippet: jsonData["snippet"],
    user: jsonData["user"],
    date: jsonData['date'],
  );
}
