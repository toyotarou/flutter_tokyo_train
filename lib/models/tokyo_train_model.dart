class TokyoStationModel {
  final String id;
  final String stationName;
  final String address;
  final double lat;
  final double lng;

  TokyoStationModel({
    required this.id,
    required this.stationName,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory TokyoStationModel.fromJson(Map<String, dynamic> json) {
    return TokyoStationModel(
      id: json['id'] as String,
      stationName: json['station_name'] as String,
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'station_name': stationName, 'address': address, 'lat': lat, 'lng': lng};
  }
}

class TokyoTrainModel {
  final int trainNumber;
  final String trainName;
  final List<TokyoStationModel> station;

  TokyoTrainModel({required this.trainNumber, required this.trainName, required this.station});

  factory TokyoTrainModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['station'] ?? [];
    return TokyoTrainModel(
      trainNumber: json['train_number'] as int,
      trainName: json['train_name'] as String,
      station: list.map((e) => TokyoStationModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'train_number': trainNumber, 'train_name': trainName, 'station': station.map((e) => e.toJson()).toList()};
  }
}
