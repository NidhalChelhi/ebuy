import 'package:ebuy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:unicons/unicons.dart';

class CustomRatingBar extends StatelessWidget {
  final double size;
  final double rate;
  final double padding;

  CustomRatingBar(
      {@required this.size, @required this.rate, @required this.padding});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: size,
      initialRating: rate,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: padding),
      ratingWidget: RatingWidget(
        full: Icon(
          UniconsSolid.star,
          color: primaryYellow,
        ),
        empty: Icon(
          UniconsSolid.star,
          color: lightColor,
        ),
        half: Icon(
          UniconsSolid.star_half_alt,
          color: primaryYellow,
        ),
      ),
      onRatingUpdate: (index) {},
    );
  }
}
