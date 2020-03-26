import 'package:flutter/material.dart';
import 'package:flutter_app/data/repository/genericRepository.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<dynamic> _dynamic;

  @override
  void initState() {
    super.initState();
    _dynamic = GenericRepository().getFoo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: _dynamic,
                builder: (context, AsyncSnapshot<dynamic> data) {
                  if (data.hasData) {
                    dynamic foo = data.data;
                    return Text(
                      foo.toString(),
                      maxLines: 10,
                    );
                  } else {
                    return Container(
                      height: 0.0,
                      width: 0.0,
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
