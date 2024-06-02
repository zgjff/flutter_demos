import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/generated/assets.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  const CloudStorageInfo(
      {required this.svgSrc,
      required this.title,
      required this.totalStorage,
      required this.numberOfFiles,
      required this.percentage,
      required this.color});
  final String svgSrc, title, totalStorage;
  final int numberOfFiles, percentage;
  final Color color;
}

const List demoMyFiles = [
  CloudStorageInfo(
    svgSrc: Assets.iconsDocuments,
    title: "Documents",
    totalStorage: "1.9GB",
    numberOfFiles: 1328,
    percentage: 35,
    color: primaryColor,
  ),
  CloudStorageInfo(
    svgSrc: Assets.iconsGoogleDrive,
    title: "Google Driver",
    totalStorage: "2.9GB",
    numberOfFiles: 1328,
    percentage: 35,
    color: Color(0xFFFFA113),
  ),
  CloudStorageInfo(
    svgSrc: Assets.iconsOneDrive,
    title: "One Drive",
    totalStorage: "1GB",
    numberOfFiles: 1328,
    percentage: 10,
    color: Color(0xFFA4CDFF),
  ),
  CloudStorageInfo(
    svgSrc: Assets.iconsDropBox,
    title: "Documents",
    totalStorage: "7.3GB",
    numberOfFiles: 5328,
    percentage: 78,
    color: Color(0xFF007EE5),
  ),
];
