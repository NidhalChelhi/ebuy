class ReviewModel {
  String text, uid;
  int rating;

  ReviewModel({
    this.uid,
    this.text,
    this.rating,
  });

  ReviewModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    uid = map['uid'];
    text = map['text'];
    rating = map['rating'];
  }

  toJson() {
    return {
      'uid': uid,
      'text': text,
      'rating': rating,
    };
  }
}
