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

/// Circle-base GEO algorithms.
///
/// Circle uses by default the Vincenty-Algorithm for distance computations
class Circle {
  // final Logger _logger = new Logger('latlong.Circle');

  final double radius;
  final google_maps.LatLng center;
  final DistanceCalculator _calculator;

  Circle(final google_maps.LatLng this.center, this.radius,
      {final DistanceCalculator calculator: const Vincenty()})
      : _calculator = calculator;

  /// Checks if a [point] is inside the given [Circle]
  ///
  ///     final Circle circle = new Circle(new google_maps.LatLng(0.0,0.0), 111319.0);
  ///     final google_maps.LatLng newPos = new google_maps.LatLng(1.0,0.0);
  ///
  ///     expect(circle.isPointInside(newPos),isTrue);
  ///
  ///     final Circle circle2 = new Circle(new google_maps.LatLng(0.0,0.0), 111318.0);
  ///
  ///     expect(circle2.isPointInside(newPos),isFalse);
  ///
  bool isPointInside(final google_maps.LatLng point) {
    Validate.notNull(point);

    final Distance distance = new Distance(calculator: _calculator);

    final double dist = distance(center, point);
    return dist <= radius;
  }

  //- private -----------------------------------------------------------------------------------
}
