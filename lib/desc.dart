import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsDesc extends StatefulWidget {
  var image;
  var datee;
  var heading;
  var descc;
  var auth;
  NewsDesc(
      {Key? key,
      required this.datee,
      required this.descc,
      required this.heading,
      required this.image,
      required this.auth})
      : super(key: key);

  @override
  State<NewsDesc> createState() => _NewsDescState();
}

class _NewsDescState extends State<NewsDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.image), fit: BoxFit.cover)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  widget.heading,
                  style: TextStyle(
                      color: Color.fromARGB(255, 209, 205, 205),
                      fontSize: 25.sp,
                      fontFamily: "Roboto Slab Bold"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.auth,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22.sp,
                          fontFamily: "Roboto Slab Regular"),
                    ),
                    Text(
                      widget.datee.substring(0, 10),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 21.sp,
                          fontFamily: "Roboto Slab Regular"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  widget.descc,
                  style: TextStyle(
                      color: Color(0xFFbababa),
                      fontSize: 19.sp,
                      fontFamily: "Roboto Slab Regular"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
