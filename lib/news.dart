import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/desc.dart';
import 'package:news/model.dart';
import 'package:news/offline.dart';
import 'package:news/presenter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'offlinemodel.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget with ChangeNotifier {
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements NewsClass {
  late Newspresenter presenter;

  List<Articles> a = [];
  List dataList = [];
  List<Place> items = [];
  var isonline = false; // cause i'm not using any internet checker plugin
  _HomeScreenState() {
    presenter = new Newspresenter(this);
  }

  @override
  void initState() {
    database(); // TODO: implement initState
    presenter.dingCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 10.h,
              color: Color(0xFF000000),
              child: Text(
                "HEADLINES",
                style: TextStyle(
                    color: Color(0xFFffffff),
                    fontSize: 23.sp,
                    fontFamily: "Roboto Slab Bold"),
              ),
            ),
            Container(
              height: 85.h,
              width: 100.w,
              color: Color(0xFF464646),
              child: isonline == true
                  ? ListView.builder(
                      itemCount: a.length,
                      itemBuilder: (((context, index) => Padding(
                            padding: EdgeInsets.fromLTRB(5.w, 3.h, 5.w, 1.h),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewsDesc(
                                              datee: a[index]
                                                  .publishedAt
                                                  .toString(),
                                              descc: a[index].description,
                                              heading: a[index].title,
                                              image: a[index].urlToImage,
                                              auth: a[index]
                                                  .source!
                                                  .name
                                                  .toString(),
                                            )));
                              },
                              child: Container(
                                height: 30.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 15.0,
                                          offset: Offset(0.0, 1))
                                    ],
                                    // color: Colors.amber,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            a[index].urlToImage.toString()
                                            // items[index].image.toString(),
                                            ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(.2.cm)),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 30.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.transparent,
                                          Colors.black,
                                        ],
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(.2.cm)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, bottom: 3.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          a[index].title.toString(),
                                          style: TextStyle(
                                              color: Color(0xFFf2f2f2),
                                              fontSize: 20.sp,
                                              fontFamily:
                                                  "Roboto Slab Regular"),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              a[index].source!.name.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFbababa),
                                                  fontSize: 16.sp,
                                                  fontFamily:
                                                      "Roboto Slab Bold"),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              a[index]
                                                  .publishedAt
                                                  .toString()
                                                  .substring(0, 10),
                                              style: TextStyle(
                                                  color: Color(0xFFbababa),
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      "Roboto Slab Regular"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (((context, index) => Padding(
                            padding: EdgeInsets.fromLTRB(5.w, 3.h, 5.w, 1.h),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewsDesc(
                                              datee:
                                                  items[index].date.toString(),
                                              descc: items[index]
                                                  .description
                                                  .toString(),
                                              heading:
                                                  items[index].id.toString(),
                                              image: items[index].image,
                                              auth: items[index]
                                                  .authorr
                                                  .toString(),
                                            )));
                              },
                              child: Container(
                                height: 30.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 15.0,
                                          offset: Offset(0.0, 1))
                                    ],
                                    // color: Colors.amber,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          items[index].image.toString(),
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(.2.cm)),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 30.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.transparent,
                                          Colors.black,
                                        ],
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(.2.cm)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, bottom: 3.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index].id.toString(),
                                          style: TextStyle(
                                              color: Color(0xFFf2f2f2),
                                              fontSize: 20.sp,
                                              fontFamily:
                                                  "Roboto Slab Regular"),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              items[index].authorr.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFbababa),
                                                  fontSize: 16.sp,
                                                  fontFamily:
                                                      "Roboto Slab Bold"),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              items[index]
                                                  .date
                                                  .toString()
                                                  .substring(0, 10),
                                              style: TextStyle(
                                                  color: Color(0xFFbababa),
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      "Roboto Slab Regular"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )))),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onnewserror(String error) {
    // TODO: implement onnewserror
  }

  @override
  void onnewssuccess(FetchNews fetch) {
    fetch.status.toString() == "ok" ? isonline = true : print(fetch);
    setState(() {});

    a = fetch.articles!;
    print(a[1].author);
    var len = a.length;
    setState(() {});
    for (int i = 0; i < len; i++) {
      DBHelper.insert('thecart', {
        'id': a[i].title.toString(),
        'heading': a[i].title.toString(),
        'date': a[i].publishedAt.toString(),
        'image': a[i].urlToImage.toString(),
        'description': a[i].description.toString(),
        'authorr': a[i].author.toString(),
      });
    }

    // TODO: implement onnewssuccess
  }

  database() async {
    dataList = await DBHelper.getData('thecart');
    print('Entt ${jsonEncode(dataList)}  and  ${dataList.length}');
    var length = dataList.length;

    items = dataList
        .map(
          (item) => Place(
              authorr: item['authorr'],
              date: item['date'],
              description: item['authorr'],
              heading: 'heading',
              id: item['id'],
              image: item['image']),
        )
        .toList();
    setState(() {});
  }
}
//