import 'dart:io';

import 'package:flutter/material.dart';

class HttpUtils {
  static setHeader(String token, String tenantName) {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if (!tenantName.isEmpty) {
      header.addAll({"X-Tenant": tenantName});
    }
    if (!token.isEmpty) {
      header.addAll({HttpHeaders.authorizationHeader: token});
    }
    return header;
  }
}
