import 'package:google_maps/google_maps.dart' show LatLng;

class CustomerInfo {
  final String street;
  final String city;
  final String state;
  final String zipcode;
  String coverageType;
  final LatLng locationPosition;

  CustomerInfo({
    required this.street,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.coverageType,
    required this.locationPosition,
  });
}
