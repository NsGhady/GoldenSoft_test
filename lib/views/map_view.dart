import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapModel>(
      create: (_) => MapModel(),
      child: Consumer<MapModel>(builder: (context, mapModel, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Image.asset(
                'assets/images/diet_hub_logo.png',
                height: 50,
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.green,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.green,
                ),
                onPressed: () {
                  // Handle notification button press
                },
              ),
            ],
          ),
          body: FlutterMap(
              options: MapOptions(center: LatLng(51.5, -0.09), zoom: 13.0),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(markers: mapModel.markers),
              ]),
        );
      }),
    );
  }
}

class MapModel extends ChangeNotifier {
  final List<Marker> _markers = [];

  MapModel() {
    _markers.add(Marker(
      width: 100.0,
      height: 100.0,
      point: LatLng(51.5, -0.09),
      builder: (ctx) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: ctx,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Pizza Palace"),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/pizza_palace.png',
                              height: 60,
                            ),
                          ),
                          const Text('3.2KM away'),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('3 Orders'),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.location_on, color: Colors.green),
          ),
          Positioned(
            top: -5,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Text('3',
                  style: TextStyle(color: Colors.black, fontSize: 12)),
            ),
          )
        ],
      ),
    ));
    _markers.add(
      Marker(
        width: 100.0,
        height: 100.0,
        point: LatLng(57.6, -0.5),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: ctx,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Pizza Palace"),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/pizza_palace.png',
                            height: 60,
                          ),
                        ),
                        const Text('3.2 KM away'),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('3 Orders'),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.location_on, color: Colors.green),
        ),
      ),
    );
    _markers.add(
      Marker(
        width: 100.0,
        height: 100.0,
        point: LatLng(67.7, -0.11),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: ctx,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Pizza Palace"),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/pizza_palace.png',
                            height: 60,
                          ),
                        ),
                        const Text('3.2 KM away'),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('3 Orders'),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.location_on, color: Colors.green),
        ),
      ),
    );
  }

  List<Marker> get markers => _markers;
}
