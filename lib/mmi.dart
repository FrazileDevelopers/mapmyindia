class MmiTokenRequest {
  String grantType = 'client_credentials';
  String clientId =
      'yvV0U15dX4xfLWVs9QCr39tL0Rdy8DjOEBUACmIqJybVQXjzT8AuhG-oMzHbWoOhkZmpHB2mFOnkLHuyVUsBFw==';
  String clientSecret =
      'kCZgyC2hGNJ6UqiCAXkFtqhnE5bF7pezs3_o2Rrh5c9i1GQrnhfxvk3hVCWRCxWb9XgH2oFVQFgT5LMr8IpfoHwGG9wUaZ-_';

  Map<String, dynamic> toJson() => {
        'grant_type': grantType,
        'client_id': clientId,
        'client_secret': clientSecret,
      };
}

class MmiToken {
  String accessToken;
  String tokenType;
  int expiresIn;
  String scope;
  String projectCode;

  MmiToken({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.scope,
    this.projectCode,
  });

  factory MmiToken.fromJson(Map<String, dynamic> json) => MmiToken(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        scope: json["scope"] == null ? null : json["scope"],
        projectCode: json["project_code"] == null ? null : json["project_code"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "scope": scope == null ? null : scope,
        "project_code": projectCode == null ? null : projectCode,
      };
}

class Mmi {
  List<SuggestedLocation> suggestedLocations;
  PageInfo pageInfo;

  Mmi({
    this.suggestedLocations,
    this.pageInfo,
  });

  factory Mmi.fromJson(Map<String, dynamic> json) => Mmi(
        suggestedLocations: json["suggestedLocations"] == null
            ? null
            : List<SuggestedLocation>.from(json["suggestedLocations"]
                .map((x) => SuggestedLocation.fromJson(x))),
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "suggestedLocations": suggestedLocations == null
            ? null
            : List<dynamic>.from(suggestedLocations.map((x) => x.toJson())),
        "pageInfo": pageInfo == null ? null : pageInfo.toJson(),
      };
}

class PageInfo {
  int pageCount;
  int totalHits;
  int totalPages;
  int pageSize;

  PageInfo({
    this.pageCount,
    this.totalHits,
    this.totalPages,
    this.pageSize,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        totalHits: json["totalHits"] == null ? null : json["totalHits"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "pageCount": pageCount == null ? null : pageCount,
        "totalHits": totalHits == null ? null : totalHits,
        "totalPages": totalPages == null ? null : totalPages,
        "pageSize": pageSize == null ? null : pageSize,
      };
}

class SuggestedLocation {
  int distance;
  String eLoc;
  String email;
  double entryLatitude;
  double entryLongitude;
  List<String> keywords;
  String landlineNo;
  double latitude;
  double longitude;
  String mobileNo;
  int orderIndex;
  String placeAddress;
  String placeName;
  String type;

  SuggestedLocation({
    this.distance,
    this.eLoc,
    this.email,
    this.entryLatitude,
    this.entryLongitude,
    this.keywords,
    this.landlineNo,
    this.latitude,
    this.longitude,
    this.mobileNo,
    this.orderIndex,
    this.placeAddress,
    this.placeName,
    this.type,
  });

  factory SuggestedLocation.fromJson(Map<String, dynamic> json) =>
      SuggestedLocation(
        distance: json["distance"] == null ? null : json["distance"],
        eLoc: json["eLoc"] == null ? null : json["eLoc"],
        email: json["email"] == null ? null : json["email"],
        entryLatitude: json["entryLatitude"] == null
            ? null
            : json["entryLatitude"].toDouble(),
        entryLongitude: json["entryLongitude"] == null
            ? null
            : json["entryLongitude"].toDouble(),
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
        landlineNo: json["landlineNo"] == null ? null : json["landlineNo"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        mobileNo: json["mobileNo"] == null ? null : json["mobileNo"],
        orderIndex: json["orderIndex"] == null ? null : json["orderIndex"],
        placeAddress:
            json["placeAddress"] == null ? null : json["placeAddress"],
        placeName: json["placeName"] == null ? null : json["placeName"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance == null ? null : distance,
        "eLoc": eLoc == null ? null : eLoc,
        "email": email == null ? null : email,
        "entryLatitude": entryLatitude == null ? null : entryLatitude,
        "entryLongitude": entryLongitude == null ? null : entryLongitude,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords.map((x) => x)),
        "landlineNo": landlineNo == null ? null : landlineNo,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "mobileNo": mobileNo == null ? null : mobileNo,
        "orderIndex": orderIndex == null ? null : orderIndex,
        "placeAddress": placeAddress == null ? null : placeAddress,
        "placeName": placeName == null ? null : placeName,
        "type": type == null ? null : type,
      };
}
