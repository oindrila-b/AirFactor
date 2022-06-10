class PollutionDataModel {

  late String timeStamp;
  late num coValue;
  late num no2Value;
  late num o3Value;
  late num pm10Value;
  late num pm25Value;
  late num so2Value;

  PollutionDataModel(
      {required this.timeStamp,
        required this.coValue,
        required this.no2Value,
        required this.o3Value,
        required this.pm10Value,
        required this.pm25Value,
        required this.so2Value});

  factory PollutionDataModel.fromJson(Map<String, dynamic> json) {
    return PollutionDataModel(
      timeStamp: "${json['TimeStamp']}",
      coValue: json['Carbon_Monoxide'],
      no2Value: json['Nitrogen_DiOxide'],
      o3Value: json['Ozone'],
      pm10Value: json['PM_10'],
      pm25Value: json['PM_25'],
      so2Value: json['SO2'],
    );
  }

}