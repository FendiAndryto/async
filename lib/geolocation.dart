import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
    getPosition().then((Position myPos) {
      setState(() {
        myPosition =
            'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      });
    });
  }

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Future.delayed(const Duration(seconds: 3));
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    final myWidget = myPosition.isEmpty
        ? const CircularProgressIndicator()
        : Text(myPosition);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location Fendi'),
      ),
      body: Center(
        child: FutureBuilder(
            future: position,
            builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Something terrible happened!');
                }
                return Text(snapshot.data.toString());
              } else {
                return const Text('');
              }
            }),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({super.key});

//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   String myPosition = '';
//   Future<Position>? position;

//   @override
//   void initState() {
//     super.initState();
//     position = getPosition();
//   }

//   Future<Position> getPosition() async {
//     // Meminta izin lokasi
//     LocationPermission permission = await Geolocator.requestPermission();
//     if (permission != LocationPermission.whileInUse &&
//         permission != LocationPermission.always) {
//       throw Exception('Izin lokasi diperlukan');
//     }

//     // Memeriksa apakah layanan lokasi diaktifkan
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       throw Exception('Layanan lokasi tidak diaktifkan');
//     }

//     // Mengambil posisi
//     Position position = await Geolocator.getCurrentPosition();
//     return position;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Current Location Fendi'),
//       ),
//       body: Center(
//         child: FutureBuilder<Position>(
//           future: position,
//           builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.connectionState == ConnectionState.done) {
//               if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }

//               // Menampilkan latitude dan longitude
//               return Text(
//                 'Latitude: ${snapshot.data?.latitude}, Longitude: ${snapshot.data?.longitude}',
//               );
//             } else {
//               return const Text('');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
