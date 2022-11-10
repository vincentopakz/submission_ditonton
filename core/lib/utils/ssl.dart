import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';

import 'package:core/core.dart';

class SSLPinning {
  static Future<IOClient> get ioClient async {
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(utf8.encode(sslCertificate));
    HttpClient client = HttpClient(context: securityContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    return IOClient(client);
  }
}
