import 'package:flutter/material.dart';
import 'package:myapp/model/lot.dart';

class GetLotInformation extends StatefulWidget {
  final String lotid;
  GetLotInformation({Key key, @required this.lotid}) : super(key: key);
  _GetLotInfState createState() => _GetLotInfState();
}

class _GetLotInfState extends State<GetLotInformation> {
// 오류나는ㄷ 왜지
  // _GetLotInfState() {
  //   setState(() {
  //     lot = ();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Lot l = new Lot();
    // TODO: implement build
    return Container(
        color: Colors.yellow,
        padding: EdgeInsets.only(left: 10),
        child: Column(children: <Widget>[
          FutureBuilder(
              future: l.fetchLot(widget.lotid),
              builder: (BuildContext context, AsyncSnapshot snaphost) {
                // 데이터 아직 없음
                if (snaphost.hasData == false) {
                  return Text('Empty');
                } else if (snaphost.hasError) {
                  return Text(' Error: ${snaphost.error}');
                }
                // 정상
                else {
                  List<Row> _rows = [];
                  _rows.add(new Row(children: [
                    Text('Lot ID: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.lotId)
                  ]));

                  _rows.add(new Row(children: [
                    Text('Part ID: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.partId)
                  ]));

                  _rows.add(new Row(children: [
                    Text('Lots Type: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.lotType)
                  ]));

                  _rows.add(new Row(children: [
                    Text('STEP: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.step)
                  ]));

                  _rows.add(new Row(children: [
                    Text('QTY : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.qty.toString())
                  ]));

                  _rows.add(new Row(children: [
                    Text('Goods: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.totalGoods.toString())
                  ]));

                  _rows.add(new Row(children: [
                    Text('edsStatus: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.edsStatus.toString())
                  ]));

                  _rows.add(new Row(children: [
                    Text('currentStatus: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.currentStatus.toString())
                  ]));
                  _rows.add(new Row(children: [
                    Text('Room/Bay: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(snaphost.data.roomBay)
                  ]));

                  return Column(children: _rows);
                }
              }),

          // Text('PARTID: ' + lot.partId,
          //     textAlign: TextAlign.left,
          //     style: TextStyle(fontWeight: FontWeight.bold)),
          // Text('PARTID: ' + lot.partId,
          //     textAlign: TextAlign.left,
          //     style: TextStyle(fontWeight: FontWeight.bold)),
        ]));
  }
}
