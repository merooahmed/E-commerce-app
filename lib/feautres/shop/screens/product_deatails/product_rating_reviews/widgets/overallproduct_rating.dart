import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/widgets/tratingprogress_indicator.dart';
import 'package:flutter/material.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                value: .2,
                text: '5',
              ),
              TRatingProgressIndicator(
                value: .8,
                text: '4',
              ),
              TRatingProgressIndicator(
                value: .5,
                text: '2',
              ),
              TRatingProgressIndicator(
                value: .3,
                text: '1',
              ),
              TRatingProgressIndicator(
                value: .1,
                text: '1',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
