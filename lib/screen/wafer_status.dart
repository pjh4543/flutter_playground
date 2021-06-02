import 'package:flutter/material.dart';
import 'package:myapp/model/lot.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Lot> fetchLot() async {
  final response =
      await http.get(Uri.parse("http://192.168.203.83:8081/asset/test"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Lot.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

Row insertWaferRow(Wafer wafer) {
  Image waferImage = Image.asset('asset/wafer.jpg');
  Text _text = wafer != null
      ? Text('#' + wafer.waferNo.toString() + ' ' + wafer.goods.toString())
      : Text('');

  if (wafer == null) {
    waferImage = Image.asset('asset/empty_wafer.jpg');
  }
  return Row(
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 50),
      ),
      InkWell(
          child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          waferImage,
          _text,
        ],
      ))
    ],
  );
}

class DrawWaferState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          color: Colors.greenAccent,
          child: FutureBuilder(
              future: fetchLot(),
              builder: (BuildContext context, AsyncSnapshot snaphost) {
                // 데이터 아직 없음
                if (snaphost.hasData == false) {
                  return Text('Empty');
                } else if (snaphost.hasError) {
                  return Text(' Error: ${snaphost.error}');
                }
                // 정상
                else {
                  List<Row> abb = [];

                  for (int _waferNo = 1; _waferNo <= 25; _waferNo++) {
                    Wafer wafer;
                    bool isData = false;

                    snaphost.data.wafers.forEach((_wafer) {
                      if (_wafer.waferNo == _waferNo) {
                        wafer = _wafer;
                        abb.add(insertWaferRow(wafer));
                        isData = true;
                      }
                    });

                    // empty wafer
                    if (!isData) {
                      abb.add(insertWaferRow(wafer));
                    }
                  }
                  return Column(children: abb);
                }
              }),
        ),
      ],
    ));
  }
}
