import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  @override
    void initState() {
    super.initState();
    datas = [
      {
        "image" : "assets/images/ara-1.jpg",
        "title" : "네메시스 축구 275",
        "location" : "제주 제주시 아라동",
        "price" : "30000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-2.jpg",
        "title" : "네메시스 축구 275",
        "location" : "제주 제주시 아라동",
        "price" : "30000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-3.jpg",
        "title" : "네메시스 축구 275",
        "location" : "제주 제주시 아라동",
        "price" : "30000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-4.jpg",
        "title" : "네메시스 축구 275",
        "location" : "제주 제주시 아라동",
        "price" : "30000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-5.jpg",
        "title" : "네메시스 축구 275",
        "location" : "제주 제주시 아라동",
        "price" : "30000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-6.jpg",
        "title" : "네메시스 축구 275",
        "location" : "제주 제주시 아라동",
        "price" : "30000",
        "likes" : "2"
      }
    ];
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString){
    return "${oCcy.format(int.parse(priceString))}원";
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              datas[index]["image"] != null
                  ? ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(datas[index]["image"]!, width: 100, height: 100,) )
                  : Container(), // 이미지가 없으면 빈 컨테이너 반환
                  Expanded(
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(left:20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(datas[index]["title"] ?? "정보 없음", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15),),
                          SizedBox(height: 5),
                          Text(datas[index]["location"] ?? "정보 없음", style: TextStyle(fontSize : 12, color: Colors.black38),),
                          SizedBox(height: 5),
                          Text(calcStringToWon(datas[index]["price"] ?? "정보 없음"), style: TextStyle(fontWeight: FontWeight.w500),),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/svg/heart_off.svg", width: 13, height: 13,),
                                SizedBox(width: 5),
                                Text(datas[index]["likes"] ?? "정보 없음"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            ],
          ),
        );
      }, // ← 여기 `,` 추가

      separatorBuilder: (BuildContext _context, int index) {
        return Container(height: 1, color: Colors.black26);
      },

      itemCount: datas.length,
    );
  }


  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: Row(
          children: [
            Text(
              "개포동",
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg/bell.svg", width: 22,)
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      // bottomNavigationBar: Container(),
    );
  }
}
