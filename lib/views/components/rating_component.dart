import 'package:flutter/material.dart';
class RatingComponents extends StatelessWidget {
  final int totalRating;

  const RatingComponents({Key? key,required this.totalRating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if(totalRating == 0)...[
            Row(
              children: [
                Icon(Icons.star,color: Colors.grey,),
                Icon(Icons.star,color: Colors.grey,),
                Icon(Icons.star,color: Colors.grey,),
                Icon(Icons.star,color: Colors.grey,),
                Icon(Icons.star,color: Colors.grey,),
              ],
            ),
          ]
          else if(totalRating == 1)...[
            Row(
              children: [
                Icon(Icons.star,color: Colors.yellow,),
                Icon(Icons.star,color: Colors.grey,),
                Icon(Icons.star,color: Colors.grey,),
                Icon(Icons.star,color: Colors.grey,),
                Icon(Icons.star,color: Colors.grey,),
              ],
            ),
          ]
          else if(totalRating == 2)...[
              Row(
                children: [
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.grey,),
                  Icon(Icons.star,color: Colors.grey,),
                  Icon(Icons.star,color: Colors.grey,),
                ],
              ),
            ]
            else if(totalRating == 3)...[
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.grey,),
                    Icon(Icons.star,color: Colors.grey,),
                  ],
                ),
              ]
              else if(totalRating == 4)...[
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.grey,),
                    ],
                  ),
                ]
                else ...[
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.yellow,),
                        Icon(Icons.star,color: Colors.yellow,),
                        Icon(Icons.star,color: Colors.yellow,),
                        Icon(Icons.star,color: Colors.yellow,),
                        Icon(Icons.star,color: Colors.yellow,),
                      ],
                    ),
                  ]
        ],
      ),
    );
  }
}
