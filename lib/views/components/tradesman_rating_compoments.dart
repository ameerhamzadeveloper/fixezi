import 'package:flutter/material.dart';
class TradesManRatingComponents extends StatelessWidget {
  final int totalRating;

  const TradesManRatingComponents({Key? key,required this.totalRating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if(totalRating == 0)...[
            Row(
              children: [
                Icon(Icons.star,color: Colors.grey,size: 40,),
                Icon(Icons.star,color: Colors.grey,size: 40),
                Icon(Icons.star,color: Colors.grey,size: 40),
                Icon(Icons.star,color: Colors.grey,size: 40),
                Icon(Icons.star,color: Colors.grey,size: 40),
              ],
            ),
          ]
          else if(totalRating == 1)...[
            Row(
              children: [
                Icon(Icons.star,color: Colors.yellow,size: 40),
                Icon(Icons.star,color: Colors.grey,size: 40),
                Icon(Icons.star,color: Colors.grey,size: 40),
                Icon(Icons.star,color: Colors.grey,size: 40),
                Icon(Icons.star,color: Colors.grey,size: 40),
              ],
            ),
          ]
          else if(totalRating == 2)...[
              Row(
                children: [
                  Icon(Icons.star,color: Colors.yellow,size: 40),
                  Icon(Icons.star,color: Colors.yellow,size: 40),
                  Icon(Icons.star,color: Colors.grey,size: 40),
                  Icon(Icons.star,color: Colors.grey,size: 40),
                  Icon(Icons.star,color: Colors.grey,size: 40),
                ],
              ),
            ]
            else if(totalRating == 3)...[
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,size: 40),
                    Icon(Icons.star,color: Colors.yellow,size: 40),
                    Icon(Icons.star,color: Colors.yellow,size: 40),
                    Icon(Icons.star,color: Colors.grey,size: 40),
                    Icon(Icons.star,color: Colors.grey,size: 40),
                  ],
                ),
              ]
              else if(totalRating == 4)...[
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow,size: 40),
                      Icon(Icons.star,color: Colors.yellow,size: 40),
                      Icon(Icons.star,color: Colors.yellow,size: 40),
                      Icon(Icons.star,color: Colors.yellow,size: 40),
                      Icon(Icons.star,color: Colors.grey,size: 40),
                    ],
                  ),
                ]
                else ...[
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.yellow,size: 40),
                        Icon(Icons.star,color: Colors.yellow,size: 40),
                        Icon(Icons.star,color: Colors.yellow,size: 40),
                        Icon(Icons.star,color: Colors.yellow,size: 40),
                        Icon(Icons.star,color: Colors.yellow,size: 40),
                      ],
                    ),
                  ]
        ],
      ),
    );
  }
}
