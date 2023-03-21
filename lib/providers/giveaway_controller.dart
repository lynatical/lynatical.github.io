import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rta_map_services/classes/participant.dart';

import '../data/constants.dart';

class GiveawayController with ChangeNotifier {
  // ignore: unused_field
  List<Participant> _participants = [];
  List<Participant> get participants => _participants;
  bool startSearch = false;
  bool play = false;

  GiveawayController() {
    loadParticipants();
    notifyListeners();
  }

  Future<List<Participant>?> loadParticipants() async {
    try {
      var url = Uri.parse('$env/planbuilder/giveaway');

      final bodyMsg = jsonEncode({
        'apiKey': apiKey,
        'action': 'giveawayReadData',
        'event': '10March2023'
      });
      var response = await http.post(url, body: bodyMsg);

      _participants = json
          .decode(response.body)["result"]
          .map<Participant>(
            (data) => Participant(
              uid: data['uuid'],
              firstName: data['firstName'],
              lastName: data['lastName'],
              email: data['email'],
              phone: data['phone'],
            ),
          )
          .toList();

      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print('Exception on loadParticipants(): $e');
    }
    return null;
  }

  searchStart() {
    startSearch = !startSearch;
    notifyListeners();
  }

  Future<Participant> getWinner() async {
    // ignore: prefer_typing_uninitialized_variables
    var winner;

    await Future.delayed(const Duration(seconds: 3), () async {
      var url = Uri.parse('$env/planbuilder/giveaway');

      final bodyMsg = jsonEncode({
        'apiKey': apiKey,
        'action': 'giveawayRunWinner',
        'event': '10March2023'
      });
      var response = await http.post(url, body: bodyMsg);

      var result = json.decode(response.body)["result"];

      winner = Participant(
        uid: result['uuid'],
        firstName: result['firstName'],
        lastName: result['lastName'],
        email: result['email'],
        phone: result['phone'],
      );
    });

    return winner;
  }
}
