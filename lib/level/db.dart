  import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:four_unet_one/level/level.dart';

Future<List<Level>> getLevels() async {
      final response = await rootBundle.loadString('assets/json/levels.json');
      final levelsJson = jsonDecode(response)['levels'].cast<Map<String, dynamic>>();
      final levels = levelsJson.map<Level>((json) => Level.fromJSON(json)).toList();
      return levels;
    }
