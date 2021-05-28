import 'package:flutter/material.dart';
import 'package:myapp/model/lot.dart';

Lot fetchLot() {
  Lot lot = Lot();
  return lot;
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
        padding: EdgeInsets.only(right: 10),
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

List<Widget> gg() {
  List<Widget> list = [];
  Lot lot = fetchLot();

  // lot을 순회하면서 lot.wafers.waferNo 와 _waferNo 가 일치하면 wafer Row
  // 일치하지 않으면 빈 Row
  for (int _waferNo = 1; _waferNo <= 25; _waferNo++) {
    Wafer wafer;
    bool isData = false;

    lot.wafers.forEach((_wafer) {
      if (_wafer.waferNo == _waferNo) {
        wafer = _wafer;
        list.add(insertWaferRow(wafer));
        isData = true;
      }
    });

    // empty wafer
    if (!isData) {
      list.add(insertWaferRow(wafer));
    }
  }

  return list;
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
          child: Column(
            children: gg(),
          ),
        )
      ],
    ));
  }
}
