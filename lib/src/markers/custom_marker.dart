part of google_static_maps_controller;

class CustomMarker extends Marker {
  /// Icon URL address
  final String icon;
  final MarkerAnchor? anchor;
  final int scale;

  const CustomMarker({
    required List<Location> locations,
    required this.icon,
    this.anchor,
    this.scale = 1,
  }) : super._(locations);

  @override
  String toUrlString() {
    if (locations.isEmpty) {
      throw StateError(
        'Marker must contain at least one location. '
        'Empty array was provided to "locations" argument.',
      );
    }

    String string = "";

    if (anchor != null) string += "anchor:${anchor!.value}$_separator";

    if (scale > 1) string += "scale:$scale$_separator";

    string += "icon:$icon$_separator";

    if (locations.isNotEmpty) string += _markerLocationsString;

    return string;
  }
}
