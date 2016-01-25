# LatLong provides a lightweight library for common latitude and longitude calculation.

## Basic usage
```dart
    final Distance distance = new Distance();
    
    expect(distance.vincenty(new LatLng(52.518611,13.408056),new LatLng(51.519475,7.46694444)),422592.0);
    
    expect(distance(new LatLng(52.518611,13.408056),new LatLng(51.519475,7.46694444)),422592.0);
    
    expect(distance.as(LengthUnit.Kilometer,
        new LatLng(52.518611,13.408056),new LatLng(51.519475,7.46694444)),423.0);
                    
```
## Features and bugs
Please file feature requests and bugs at the [issue tracker](https://github.com/MikeMitterer/dart-latlong/issues).

## License

    Copyright 2015 Michael Mitterer (office@mikemitterer.at),
    IT-Consulting and Development Limited, Austrian Branch

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
    either express or implied. See the License for the specific language
    governing permissions and limitations under the License.


If this plugin is helpful for you - please [(Circle)](http://gplus.mikemitterer.at/) me
or **star** this repo here on GitHub
