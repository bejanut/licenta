import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class MapLoader {
  static openMaps(context, String name, Coords coords) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () => map.showMarker(
                        coords: coords,
                        title: name,
                      ),
                      title: Text(map.mapName),
                      leading: const Icon(Icons.map),
                    ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}