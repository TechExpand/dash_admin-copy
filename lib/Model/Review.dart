

class ReviewModel {
  String? id;
  String? rate;
  String? snippet;
  dynamic? user;
  String? date;
  dynamic? poster;

  ReviewModel({
    this.id,
    this.rate,
    this.date,
    this.user,
    this.snippet,
    this.poster,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      "poster": poster,
      "rate": rate,
      "date": date,
      "snippet": snippet,
      "user": user,
    };
  }

  factory ReviewModel.fromJson(jsonData) => ReviewModel(
        snippet: jsonData["snippet"],
        id: jsonData['_id'],
        date: jsonData["date"],
        rate: jsonData["rate"],
        user: jsonData['user'],
        poster: jsonData['poster'],
      );
}
