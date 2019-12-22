import 'package:flutter/material.dart';
import 'package:mapmyindia/bloc.dart';
import 'package:mapmyindia/mmi.dart';
import 'package:mapmyindia/nearTo.dart';

void main() => runApp(MapMyIndia());

class MapMyIndia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map My India',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MMI(),
    );
  }
}

class MMI extends StatefulWidget {
  @override
  _MMIState createState() => _MMIState();
}

class _MMIState extends State<MMI> {
  MMIBloc mmiBloc = MMIBloc();

  @override
  void initState() {
    // TODO: implement initState
    mmiBloc.fetchAccessToken();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mmiBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Map My India'),
        ),
        body: StreamBuilder(
            stream: mmiBloc.getAccessToken,
            builder: (context, AsyncSnapshot<MmiToken> snapshot) {
              return Center(
                child: snapshot.data != null
                    ? MaterialButton(
                        child: Text('click'),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NearTo(
                                    snapshot.data.accessToken,
                                    snapshot.data.tokenType))),
                      )
                    : Text('Error'),
              );
            }),
      );
}
