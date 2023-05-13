
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Controller/style.dart';

class artistReview extends StatefulWidget {
  const artistReview({Key? key}) : super(key: key);

  @override
  State<artistReview> createState() => _artistReviewState();
}

class _artistReviewState extends State<artistReview> {
  double? ratingValue;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Text("Guest Review",style: appTitle,),
        const SizedBox(height: 10.0,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: drawerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("4.5",style: extraBold,),
                  const SizedBox(width: 10.0,),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 25,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Text("86  Rank amongst  clubs in Delhi",style: cardTitle,),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Ambience",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Food",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Hygiene",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Music",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Pricing",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Service",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: drawerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text("Reviews with images",style: appTitle,),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_up_outlined,color: Colors.white,size: 24,)
                ],
              ),
              const SizedBox(height: 10.0,),
              const Divider(color: Colors.grey,),
              const SizedBox(height: 10.0,),
              const Text("Top Reviews",style: appTitle,),
              const SizedBox(height: 10.0,),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  decoration : BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.yellow,
                  ),
                  child: const Icon(Icons.person,size: 50,color: Colors.grey,),
                ),
                title: const Text("Jene Broke",style: appTitle,),
                subtitle: RatingBar(
                    initialRating: 4.5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    allowHalfRating:
                    true,
                    glowRadius: 10,
                    itemCount: 5,
                    ratingWidget:
                    RatingWidget(
                        full: const Icon(Icons.star, size: 20, color: Colors.orange),
                        half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                        empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                    onRatingUpdate:
                        (value) {
                      setState(() {
                        ratingValue = value;
                      });
                    }),
              ),
              const Text("Reviewed in India on 31 January 2023",style: textLabel,),
              const SizedBox(height: 10.0,),
              const Text(" It is a long established fact that a reader will be dis content of a page when looking at its layout. The po is that it has a more-or-less.",style: textLabel,),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    decoration: BoxDecoration(
                      color: appBarColor,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: const Text("Helpful",style: buttonText,),
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Report",style: buttonText,)
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        GestureDetector(
          onTap: (){},
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.1, 0.1),
                end: FractionalOffset(0.7, 0.1),
                colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: const Text('Write a Review', style: buttonText),
          ),
        ),
        const SizedBox(height: 20.0,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: drawerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text("Reviews with Video",style: appTitle,),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_up_outlined,color: Colors.white,size: 24,)
                ],
              ),
              const SizedBox(height: 10.0,),
              const Divider(color: Colors.grey,),
              const SizedBox(height: 10.0,),
              const Text("Top Reviews",style: appTitle,),
              const SizedBox(height: 10.0,),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  decoration : BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.yellow,
                  ),
                  child: const Icon(Icons.person,size: 50,color: Colors.grey,),
                ),
                title: const Text("Jene Broke",style: appTitle,),
                subtitle: RatingBar(
                    initialRating: 4.5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    allowHalfRating:
                    true,
                    glowRadius: 10,
                    itemCount: 5,
                    ratingWidget:
                    RatingWidget(
                        full: const Icon(Icons.star, size: 20, color: Colors.orange),
                        half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                        empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                    onRatingUpdate:
                        (value) {
                      setState(() {
                        ratingValue = value;
                      });
                    }),
              ),
              const Text("Reviewed in India on 31 January 2023",style: textLabel,),
              const SizedBox(height: 10.0,),
              const Text(" It is a long established fact that a reader will be dis content of a page when looking at its layout. The po is that it has a more-or-less.",style: textLabel,),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: const Text("Helpful",style: buttonText,),
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Report",style: buttonText,)
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        GestureDetector(
          onTap: (){},
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.1, 0.1),
                end: FractionalOffset(0.7, 0.1),
                colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: const Text('Write a Review', style: buttonText),
          ),
        ),
        const SizedBox(height: 10.0,),
        const Text("Testimonial",style: appTitle,),
        const SizedBox(height: 10.0,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: drawerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  decoration : BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.yellow,
                  ),
                  child: const Icon(Icons.person,size: 50,color: Colors.grey,),
                ),
                title: const Text("Jene Broke",style: appTitle,),
                subtitle: RatingBar(
                    initialRating: 4.5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    allowHalfRating:
                    true,
                    glowRadius: 10,
                    itemCount: 5,
                    ratingWidget:
                    RatingWidget(
                        full: const Icon(Icons.star, size: 20, color: Colors.orange),
                        half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                        empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                    onRatingUpdate:
                        (value) {
                      setState(() {
                        ratingValue = value;
                      });
                    }),
              ),
              const Text(" It is a long established fact that a reader will be dis content of a page when looking at its layout. The po is that it has a more-or-less.",style: textLabel,),
              const SizedBox(height: 5.0,),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        const Text("Club Review",style: appTitle,),
        const SizedBox(height: 10.0,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: drawerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("4.5",style: extraBold,),
                  const SizedBox(width: 10.0,),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 25,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Text("86  Rank amongst  clubs in Delhi",style: cardTitle,),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Ambience",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Food",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Hygiene",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Music",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Pricing",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Text("Service",style: cardTitle,),
                  const Spacer(),
                  RatingBar(
                      initialRating: 4.5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating:
                      true,
                      glowRadius: 10,
                      itemCount: 5,
                      ratingWidget:
                      RatingWidget(
                          full: const Icon(Icons.star, size: 20, color: Colors.orange),
                          half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                          empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                      onRatingUpdate:
                          (value) {
                        setState(() {
                          ratingValue = value;
                        });
                      }),
                  const SizedBox(width: 10.0,),
                  const Text("4.8",style: cardTitle,),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        const Text("Testimonial",style: appTitle,),
        const SizedBox(height: 10.0,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: drawerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  decoration : BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.yellow,
                  ),
                  child: const Icon(Icons.person,size: 50,color: Colors.grey,),
                ),
                title: const Text("Jene Broke",style: appTitle,),
                subtitle: RatingBar(
                    initialRating: 4.5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    allowHalfRating:
                    true,
                    glowRadius: 10,
                    itemCount: 5,
                    ratingWidget:
                    RatingWidget(
                        full: const Icon(Icons.star, size: 20, color: Colors.orange),
                        half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                        empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                    onRatingUpdate:
                        (value) {
                      setState(() {
                        ratingValue = value;
                      });
                    }),
              ),
              const Text(" It is a long established fact that a reader will be dis content of a page when looking at its layout. The po is that it has a more-or-less.",style: textLabel,),
              const SizedBox(height: 5.0,),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        GestureDetector(
          onTap: (){},
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.1, 0.1),
                end: FractionalOffset(0.7, 0.1),
                colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: const Text('Write a Review', style: buttonText),
          ),
        ),
        const SizedBox(height: 20.0,),
      ],
    );
  }
}
