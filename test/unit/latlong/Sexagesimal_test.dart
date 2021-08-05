//@TestOn("content-shell")
import 'package:test/test.dart';

import 'package:latlong/latlong.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
// import 'package:logging/logging.dart';

// Browser
// import "package:console_log_handler/console_log_handler.dart";

// Commandline
// import "package:console_log_handler/print_log_handler.dart";

main() async {
  // final Logger _logger = new Logger("test.Sexagesimal");
  // configLogging();

  //await saveDefaultCredentials();

  group('Sexagesimal', () {
    setUp(() {});

    test('> decimal2sexagesimal', () {
      final String sexa1 = decimal2sexagesimal(51.519475);
      final String sexa2 = decimal2sexagesimal(-19.37555556);
      final String sexa3 = decimal2sexagesimal(50.0);

      expect(sexa1, '51° 31\' 10.11"');
      expect(sexa2, '19° 22\' 32.00"');
      expect(sexa3, '50° 0\' 0.00"');

      final LatLng p1 = new LatLng(51.519475, -19.37555556);
      expect(toSexagesimal(p1.latitude, p1.longitude),
          '51° 31\' 10.11" N, 19° 22\' 32.00" W');
    }); // end of 'decimal2sexagesimal' test
  });
  // End of 'Sexagesimal' group
}

String toSexagesimal(latitude, longitude) {
  String latDirection = latitude >= 0 ? "N" : "S";
  String lonDirection = longitude >= 0 ? "O" : "W";
  return "${decimal2sexagesimal(latitude)} ${latDirection}, ${decimal2sexagesimal(longitude)} ${lonDirection}";
}

// - Helper --------------------------------------------------------------------------------------
