import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/entity/app_data.dart';
import '../../data/mock_data.dart';



class _ProductDescription extends StatelessWidget {
  final String title;
  final String price;
  final Amount amount;
  final String sale;

  const _ProductDescription(
      this.title,
      this.price,
      this.amount,
      this.sale,);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Expanded(child: SizedBox(height: 10,)),
        Row(
          children: [
            Text(
                switch (amount) {
                  Grams() => '${amount.value / 1000} ${AppStrings.weight}',
                  Quantity() => '${amount.value} ${AppStrings.item}',
                }
            ),
            const Expanded(child: SizedBox(width: 10,)),
            sale != '0'
                ?
            Text.rich(
                TextSpan(
                    text: '',
                    children: [
                      TextSpan(text: '$price ${AppStrings.rub}', style: const TextStyle(color: AppColors.lightGray, decoration: TextDecoration.lineThrough,)),
                      const TextSpan(text: ' '),
                      TextSpan(text: sale, style: const TextStyle(color: AppColors.red,)),
                    ]
                )
            )
                :
            Text('$price ${AppStrings.rub}')
          ],
        )
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final Amount amount;
  final String sale;

  const ProductItem(
      this.imageUrl,
      this.title,
      this.price,
      this.amount,
      this.sale,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(dimension: 68, child: Image.network(imageUrl, fit: BoxFit.cover)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,),
                child: _ProductDescription(title, price, amount, sale),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





