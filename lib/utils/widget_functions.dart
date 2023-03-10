import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget itemNavBar(data, index) {
  return Container(
    color: Colors.white,
    width: 74,
    height: 40,
    child: Column(
      children: [
        IconButton(
          onPressed: () => {print(data[index][0])},
          icon: Icon(data[index][1]),
        ),
        Text(
          data[index][0],
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w100,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget CarouselCard(e, size, _margin) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.46,
    child: Card(
      margin: EdgeInsets.zero,
      color: COLOR_DARK_BLUE,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: _margin, left: _margin + 2.0),
                child: Container(
                  height: size.height * 0.30,
                  width: size.width * 0.40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(e['url']), fit: BoxFit.fill),
                  ),
                ),
              ),
              addHorizontalSpace(16.0),
              SizedBox(
                width: size.width * 0.48,
                height: size.height * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(18.0),
                    AutoSizeText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      presetFontSizes: [25],
                      e['movieName'] as String,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    addVerticalSpace(8.0),
                    AutoSizeText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      presetFontSizes: [15],
                      e['duration'] + e['genres'] as String,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                    addVerticalSpace(8.0),
                    AutoSizeText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      presetFontSizes: [15],
                      e['language'] as String,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                    addVerticalSpace(12.0),
                    AutoSizeText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      presetFontSizes: [15],
                      e['about'] as String,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () => print("Buy or Rent Clicked"),
              child: Container(
                width: size.width * 0.82,
                height: size.height * 0.05,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Buy or Rent',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}

Widget EventBuilder(data, height) {
  return Container(
    height: height,
    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) {
        return Container(
          height: 300,
          child: Container(
            width: 130,
            height: 300,
            color: Colors.indigo.shade50,
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(data[index]['url']),
                      Container(
                        height: 30,
                        color: Colors.black,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(data[index]['liveDate'],
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(8.0),
                AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  presetFontSizes: [12],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                  data[index]['showName'] as String,
                ),
                addVerticalSpace(8.0),
                AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  presetFontSizes: [11],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                  data[index]['otherInfo'] as String,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: data.length,
      separatorBuilder: (context, index) => addHorizontalSpace(8.0),
    ),
  );
}

Widget addBuzz(data, size) {
  return Container(
    height: size.height * 0.18,
    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) {
        return Container(
          height: 180,
          width: size.width * 0.80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: COLOR_DARK_BLUE,
          ),
          child: Card(
            margin: EdgeInsets.all(8.0),
            color: COLOR_DARK_BLUE,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        data[index]['url'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  width: size.width * 0.50,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      presetFontSizes: [13],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      data[index]['otherInfo'] as String,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: data.length,
      separatorBuilder: (context, index) => addHorizontalSpace(8.0),
    ),
  );
}

Widget buildLoader(Size size, Color color) {
  return SafeArea(
    child: Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/book my show.png',
              width: size.width,
              fit: BoxFit.cover,
              height: size.height * 0.12,
            ),
            addVerticalSpace(
              8.0,
            ),
            const Text(
              style: TextStyle(color: Colors.white, fontSize: 18),
              'It All Starts Here',
            ),
            addVerticalSpace(
              size.height * 0.10,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    ),
  );
}

Widget imageBuilder(
    type,
    _rightPadding,
    data,
    size,
    maxCrossAxisExtent,
    childAspectRatio,
    crossAxisSpacing,
    mainAxisSpacing,
    ScrollDirection,
    physics) {
  return Padding(
    padding: EdgeInsets.only(right: _rightPadding),
    child: Container(
      width: size.width,
      child: data.length >= 1
          ? GridView.builder(
              scrollDirection: ScrollDirection,
              physics: physics,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: maxCrossAxisExtent,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: crossAxisSpacing,
                  mainAxisSpacing: mainAxisSpacing),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            data[index]['url'],
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 100,
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    ),
  );
}
