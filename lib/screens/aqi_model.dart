class AQIModel {
  late String timeStamp;
  late num aqiValue;



  AQIModel({ required this.timeStamp ,required this.aqiValue});


  factory AQIModel.fromJson(Map<String,dynamic> json) {
    return AQIModel(
        timeStamp: "${json['TimeStamp']}",
        aqiValue: json['AQI'],
    );
  }
}