import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:mapmyindia/bloc.dart';

class NearTo extends StatefulWidget {
  String accessToken;
  String tokenType;
  NearTo(this.accessToken, this.tokenType);

  @override
  _NearToState createState() => _NearToState();
}

class _NearToState extends State<NearTo> {
  MMIBloc mmiBloc = MMIBloc();

  @override
  void initState() {
    // TODO: implement initState
    mmiBloc.near('${widget.tokenType} ${widget.accessToken}');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mmiBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        // child:
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(28.432889, 77.4062500000001),
            zoom: 15.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  "https://atlas.microsoft.com/map/tile/png?api-version=1&layer=basic&style=main&tileSize=256&view=Auto&zoom={z}&x={x}&y={y}&subscription-key={subscriptionKey}",
              additionalOptions: {
                'subscriptionKey': 'wZj2l4yaCgLiURMb_QESfSJu3IeO9YtkRHhBglhD_tU'
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(28.432889, 77.4062500000001),
                  builder: (ctx) =>
                      Icon(Icons.pin_drop, color: Colors.pink, size: 35.0),
                ),
              ],
            ),
          ],
        ),
        // Image.network(
        //     'https://apis.mapmyindia.com/advancedmaps/v1/swoohkpnpz3bzv1wbj16nzutj5ntikga/still_image?center=28.4890120000001, 77.4157490000001&zoom=20&size=1080x1920&ssf=1&markers=28.4890120000001, 77.4157490000001'),
      );
}
