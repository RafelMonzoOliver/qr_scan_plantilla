import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scan/models/scan_model.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition _punt_inicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 14.4746,
      tilt: 50,
    );

    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId("id_1"),
        position: scan.getLatLng(),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _mapType == MapType.normal
                  ? Icons.layers
                  : Icons.map,
            ),
            onPressed: () {
              setState(() {
                _mapType = _mapType == MapType.normal
                    ? MapType.hybrid
                    : MapType.normal;
              });
            },
          ),
        ],
      ),
      body: GoogleMap(
        mapType: _mapType,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: markers,
        initialCameraPosition: _punt_inicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
