// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:http/http.dart' as http;
import '../classes/customer_info.dart';
import '../data/constants.dart';

class CustomerInfoProvider with ChangeNotifier {
  final TextEditingController parsedFName = TextEditingController();
  final TextEditingController parsedLName = TextEditingController();
  final TextEditingController parsedPhone = TextEditingController();
  final TextEditingController parsedEmail = TextEditingController();

  String origin = '';
  String lastName = '';
  String firstName = '';
  String phone = '';
  String custEmail = '';
  late CustomerInfo leadInfo;

  // ignore: prefer_final_fields
  bool _internetCheckbox = true, _tvCheckbox = true, _voiceCheckbox = true;

  bool get internetCheckbox => _internetCheckbox;
  bool get tvCheckbox => _tvCheckbox;
  bool get voiceCheckbox => _voiceCheckbox;

  bool orderSent = false;

  Color panelcolor = const Color(0xFF2E5899);

  final TextEditingController engageSelect = TextEditingController();

  void setlName(String lName) {
    lastName = lName;
    notifyListeners();
  }

  void setLeadInfo(CustomerInfo lead) {
    leadInfo = lead;
    notifyListeners();
  }

  void setfName(String fname) {
    firstName = fname;
    notifyListeners();
  }

  void setPhone(String phone) {
    this.phone = phone;
    //notifyListeners();
  }

  void setEmail(String email) {
    custEmail = email;
    notifyListeners();
  }

  void setColor(Color pancolor) {
    panelcolor = pancolor;
    notifyListeners();
  }

  void orderStatus(bool value) {
    orderSent = value;
    notifyListeners();
  }

  void setInternetCheckbox(bool? value) {
    if (value == false && _voiceCheckbox == false && _tvCheckbox == false) {
      null;
    } else {
      _internetCheckbox = value ?? true;
      notifyListeners();
    }
  }

  void setTvCheckbox(bool? value) {
    if (value == false &&
        _internetCheckbox == false &&
        _voiceCheckbox == false) {
      null;
    } else {
      _tvCheckbox = value ?? true;
      notifyListeners();
    }
  }

  void setVoiceCheckbox(bool? value) {
    if (value == false && _internetCheckbox == false && _tvCheckbox == false) {
      null;
    } else {
      _voiceCheckbox = value ?? true;
      notifyListeners();
    }
  }

  Future<void> createLead() async {
    LatLng location = leadInfo.locationPosition;
    Map<String, dynamic> lead = {
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': custEmail,
      'phone': [
        {
          'Type': 'Home',
          'Number': phone,
        }
      ],
      'physicalStreet': leadInfo.street,
      'physicalCity': leadInfo.city,
      'physicalState': leadInfo.state,
      'physicalZip': leadInfo.zipcode,
      'physicalLatitude': location.lat.toString(),
      'physicalLongitude': location.lng.toString(),
    };

    Map<String, dynamic> body = {
      'apiKey': apiKey,
      'action': 'formLead',
      "networkType": leadInfo.coverageType,
      "locationGroup": leadInfo.locationGroup,
      'customer': lead,
      "servicesInterest": {
        "internet": internetCheckbox,
        "voice": voiceCheckbox,
        "tv": tvCheckbox
      }
    };

    try {
      var url = Uri.parse('$env/planbuilder/api');

      await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
    } catch (e) {
      // ignore: avoid_print
      print('ERROR - function createLead(): $e');
    }
  }
}
