import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final ValueChanged<String> onGetLotid;

  SearchScreen({Key key, this.onGetLotid}) : super(key: key);

  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // 검색 위젯 컨트롤
  final TextEditingController _filter = TextEditingController();

//검색 위젯에 커서가 있는지 상태
  FocusNode focuseNode = FocusNode();
  String _searchText = "";

// _filter 변화 감지하여 _searchText 에 상태변화
  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().toString() + '----------------------------------');
    // TODO: implement build
    return Container(
        child: Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(30),
      ),
      Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: TextField(
                onSubmitted: (String text) {
                  widget.onGetLotid(text);
                  setState(() {
                    print('haa' + text);
                    _filter.clear();
                    _searchText = "";
                  });
                },
                focusNode: focuseNode,
                style: TextStyle(fontSize: 35, color: Colors.white70),
                autofocus: true,
                controller: _filter,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white60,
                      size: 20,
                    ),
                    suffixIcon: focuseNode.hasFocus
                        ? IconButton(
                            icon: Icon(
                              Icons.cancel,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _filter.clear();
                                _searchText = "";
                              });
                            },
                          )
                        : Container(),
                    hintText: '검색',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ),
            focuseNode.hasFocus
                ? Expanded(
                    child: TextButton(
                      child: Text('취소'),
                      onPressed: () {
                        setState(() {
                          _filter.clear();
                          _searchText = "";
                          focuseNode.unfocus();
                        });
                      },
                    ),
                  )
                : Expanded(
                    flex: 0,
                    child: Container(),
                  )
          ],
        ),
      ),
    ]));
  }
}
