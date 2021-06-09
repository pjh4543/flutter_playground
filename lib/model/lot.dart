import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Lot {
  // final String lotId = "A1AP3L2";
  // final String lotType = "PW";
  // final String partId = "S5E9840A02-N3L";
  // final String step = "-";
  // final int qty = 3;
  // final int totalGoods = 655;
  // final String edsStatus = "SHIPPED";
  // final String roomBay = "-";
  // final String currentStatus = "IN-BAY";
  // final List<Wafer> wafers = [
  //   Wafer.fromMap({'waferNo': 23, 'goods': 1234}),
  //   Wafer.fromMap({'waferNo': 24, 'goods': 5678})
  // ];

  final String lotId;
  final String lotType;
  final String partId;
  final String step;
  final int qty;
  final int totalGoods;
  final String edsStatus;
  final String roomBay;
  final String currentStatus;
  final List<Wafer> wafers;

  Lot(
      {this.lotId,
      this.lotType,
      this.partId,
      this.step,
      this.qty,
      this.totalGoods,
      this.edsStatus,
      this.roomBay,
      this.currentStatus,
      this.wafers});

  List<Wafer> getWafers() {
    return this.wafers;
  }

  factory Lot.fromJson(Map<String, dynamic> json) {
    return Lot(
        lotId: json['lotId'],
        lotType: json['lotType'],
        partId: json['partId'],
        step: json['step'],
        qty: json['qty'],
        totalGoods: json['goods'],
        edsStatus: json['edsStat'],
        currentStatus: json['currentLoc'],
        roomBay: json['roomBay'],
        wafers: List<Wafer>.from(
            json['wafers'].map((model) => Wafer.fromJson(model))));
  }

  Future<Lot> fetchLot(String lotid) async {
    print('fecthLost실행 ' + lotid);
    final response = await http
        .get(Uri.parse("http://192.168.203.83:8081/asset/test/" + lotid));

    if (response.statusCode == 200) {
      // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
      return Lot.fromJson(json.decode(response.body));
    } else {
      // 만약 요청이 실패하면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}

class Wafer {
  final int waferNo;
  final int goods;

  // Wafer.fromMap(Map<String, dynamic> map)
  //     : waferNo = map['waferNo'],
  //       goods = map['goods'];

  Wafer({this.waferNo, this.goods});

  factory Wafer.fromJson(Map<String, dynamic> json) {
    return Wafer(waferNo: json['waferNo'], goods: json['goods']);
  }
}
