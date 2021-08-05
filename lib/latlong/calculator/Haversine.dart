/*
 * Copyright (c) 2016, Michael Mitterer (office@mikemitterer.at),
 * IT-Consulting and Development Limited.
 * 
 * All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

part of latlong;

class Haversine implements DistanceCalculator {
  // final Logger _logger = new Logger('latlong.Haversine');

  const Haversine();

  /// Calculates distance with Haversine algorithm.
  ///
  /// Accuracy can be out by 0.3%
  /// More on [Wikipedia](https://en.wikipedia.org/wiki/Haversine_formula)
  @override
  double distance(final google_maps.LatLng p1, final google_maps.LatLng p2) {
    final sinDLat = math.sin((latitudeInRad(p2) - latitudeInRad(p1)) / 2);
    final sinDLng = math.sin((longitudeInRad(p2) - longitudeInRad(p1)) / 2);

    // Sides
    final a = sinDLat * sinDLat +
        sinDLng *
            sinDLng *
            math.cos(latitudeInRad(p1)) *
            math.cos(latitudeInRad(p2));
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return EQUATOR_RADIUS * c;
  }

  double latitudeInRad(google_maps.LatLng deg) {
    return double.parse(deg.toString()) * (PI / 180.0);
  }

  double longitudeInRad(google_maps.LatLng deg) {
    return double.parse(deg.toString()) * (PI / 180.0);
  }

  /// Returns a destination point based on the given [distance] and [bearing]
  ///
  /// Given a [from] (start) point, initial [bearing], and [distance],
  /// this will calculate the destination point and
  /// final bearing travelling along a (shortest distance) great circle arc.
  ///
  ///     final Haversine distance = const Haversine();
  ///
  ///     final num distanceInMeter = (EARTH_RADIUS * math.PI / 4).round();
  ///
  ///     final p1 = new google_maps.LatLng(0.0, 0.0);
  ///     final p2 = distance.offset(p1, distanceInMeter, 180);
  ///
  @override
  google_maps.LatLng offset(final google_maps.LatLng from,
      final double distanceInMeter, final double bearing) {
    Validate.inclusiveBetween(-180.0, 180.0, bearing,
        "Angle must be between -180 and 180 degrees but was $bearing");

    final double h = degToRadian(bearing.toDouble());

    final double a = distanceInMeter / EQUATOR_RADIUS;

    final double lat2 = math.asin(math.sin(latitudeInRad(from)) * math.cos(a) +
        math.cos(latitudeInRad(from)) * math.sin(a) * math.cos(h));

    final double lng2 = longitudeInRad(from) +
        math.atan2(math.sin(h) * math.sin(a) * math.cos(latitudeInRad(from)),
            math.cos(a) - math.sin(latitudeInRad(from)) * math.sin(lat2));

    return new google_maps.LatLng(radianToDeg(lat2), radianToDeg(lng2));
  }

  //- private -----------------------------------------------------------------------------------
}
