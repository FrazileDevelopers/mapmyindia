import 'package:mapmyindia/mmi.dart';
import 'package:mapmyindia/services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class MMIBloc {
  final serviceCaller = ServiceCaller();
  final accessToken = BehaviorSubject<MmiToken>();
  final nearBy = BehaviorSubject<Mmi>();

  Observable<MmiToken> get getAccessToken => accessToken.stream;
  Observable<Mmi> get getNearBy => nearBy.stream;

  fetchAccessToken() async {
    MmiToken token = await serviceCaller.fetchMmiToken(MmiTokenRequest());
    accessToken.sink.add(token);
  }

  near(String auth) async {
    Mmi nearby = await serviceCaller.fetchMmi(auth);
    nearBy.sink.add(nearby);
  }

  dispose() {
    accessToken.close();
    nearBy.close();
  }
}
