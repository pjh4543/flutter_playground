import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/model/lot.dart';
import 'package:http/http.dart' as http;

// Lot fetchLot() {
//   Lot lot = Lot();
//   return lot;
// }

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

class GetLotInformation extends StatelessWidget {
  Future<Lot> lot = fetchLot();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.yellow,
        padding: EdgeInsets.only(left: 10),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Text('Lot ID: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(left: 10)),
              //Text(lot.lotId),
              FutureBuilder(
                  future: lot,
                  builder: (BuildContext context, AsyncSnapshot snaphost) {
                    // 데이터 아직 없음
                    if (snaphost.hasData == false) {
                      return Text('Empty1');
                    } else if (snaphost.hasError) {
                      return Text(' Error: ${snaphost.error}');
                    }
                    // 정상
                    else {
                      return Text(snaphost.data.lotid);
                    }
                  })
            ],
          ),
          // Text('PARTID: ' + lot.partId,
          //     textAlign: TextAlign.left,
          //     style: TextStyle(fontWeight: FontWeight.bold)),
          // Text('PARTID: ' + lot.partId,
          //     textAlign: TextAlign.left,
          //     style: TextStyle(fontWeight: FontWeight.bold)),
        ]));
  }
}
