class OtherAQIModel {
  late String stationName;
  late num aqiValue;

  OtherAQIModel({ required this.stationName ,required this.aqiValue});


  factory OtherAQIModel.fromJson(Map<String,dynamic> json) {
    return OtherAQIModel(
      stationName: "${json['StationName']}",
      aqiValue: json['AQIValue'],
    );
  }
}