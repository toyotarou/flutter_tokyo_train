import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/controllers_mixin.dart';
import '../../models/tokyo_train_model.dart';
import '../../utility/tile_provider.dart';

class TrainMapAlert extends ConsumerStatefulWidget {
  const TrainMapAlert({super.key, this.trainModel, this.selectedTrainName});

  final TokyoTrainModel? trainModel;
  final List<String>? selectedTrainName;

  @override
  ConsumerState<TrainMapAlert> createState() => _TrainMapAlertState();
}

class _TrainMapAlertState extends ConsumerState<TrainMapAlert> with ControllersMixin<TrainMapAlert> {
  final MapController mapController = MapController();

  double currentZoomEightTeen = 18;

  List<double> latList = <double>[];
  List<double> lngList = <double>[];

  double minLat = 0.0;
  double maxLat = 0.0;
  double minLng = 0.0;
  double maxLng = 0.0;

  bool isLoading = false;

  double? currentZoom;

  List<LatLng> latLngList = <LatLng>[];

  List<Marker> stationMarkerList = <Marker>[];

  ///
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isLoading = true);

      // ignore: always_specify_types
      Future.delayed(const Duration(seconds: 2), () {
        setDefaultBoundsMap();

        setState(() => isLoading = false);
      });
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    makeMinMaxLatLng();

    makeStationMarker();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: const LatLng(35.718532, 139.586639),
                initialZoom: currentZoomEightTeen,
                onPositionChanged: (MapCamera position, bool isMoving) {
                  if (isMoving) {
                    appParamNotifier.setCurrentZoom(zoom: position.zoom);
                  }
                },
              ),
              children: <Widget>[
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileProvider: CachedTileProvider(),
                  userAgentPackageName: 'com.example.app',
                ),

                MarkerLayer(markers: stationMarkerList),
              ],
            ),
          ),

          if (isLoading) ...<Widget>[const Center(child: CircularProgressIndicator())],
        ],
      ),
    );
  }

  ///
  void makeMinMaxLatLng() {
    latList.clear();
    lngList.clear();

    latLngList.clear();

    if (widget.trainModel == null) {
      for (final TokyoTrainModel element2 in appParamState.keepTokyoTrainList) {
        for (final TokyoStationModel element in element2.station) {
          latList.add(element.lat);
          lngList.add(element.lng);

          latLngList.add(LatLng(element.lat, element.lng));
        }
      }
    } else {
      for (final TokyoStationModel element in widget.trainModel!.station) {
        latList.add(element.lat);
        lngList.add(element.lng);

        latLngList.add(LatLng(element.lat, element.lng));
      }
    }

    latList = latList.toSet().toList();
    lngList = lngList.toSet().toList();

    if (latList.isNotEmpty && lngList.isNotEmpty) {
      minLat = latList.reduce(min);
      maxLat = latList.reduce(max);
      minLng = lngList.reduce(min);
      maxLng = lngList.reduce(max);
    }
  }

  ///
  void setDefaultBoundsMap() {
    mapController.rotate(0);

    final LatLngBounds bounds = LatLngBounds.fromPoints(<LatLng>[LatLng(minLat, maxLng), LatLng(maxLat, minLng)]);

    final CameraFit cameraFit = CameraFit.bounds(
      bounds: bounds,
      padding: EdgeInsets.all(appParamState.currentPaddingIndex * 10),
    );

    mapController.fitCamera(cameraFit);

    /// これは残しておく
    // final LatLng newCenter = mapController.camera.center;

    final double newZoom = mapController.camera.zoom;

    setState(() => currentZoom = newZoom);

    appParamNotifier.setCurrentZoom(zoom: newZoom);
  }

  ///
  void makeStationMarker() {
    stationMarkerList.clear();

    for (final LatLng element in latLngList) {
      stationMarkerList.add(
        Marker(
          point: element,
          child: const Icon(Icons.location_on, color: Colors.redAccent),
        ),
      );
    }
  }
}
