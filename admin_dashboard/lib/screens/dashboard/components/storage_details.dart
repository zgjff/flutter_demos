import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/generated/assets.dart';
import 'package:admin_dashboard/screens/dashboard/components/chart.dart';
import 'package:admin_dashboard/screens/dashboard/components/storage_info_card.dart';
import 'package:flutter/material.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            title: 'Document Files',
            amountOfFiles: '1.3GB',
            svgSrc: Assets.iconsDocuments,
            numberOfFiles: 1329,
          ),
          StorageInfoCard(
            title: 'Media Files',
            amountOfFiles: '15.3GB',
            svgSrc: Assets.iconsMedia,
            numberOfFiles: 1328,
          ),
          StorageInfoCard(
            title: 'Other Files',
            amountOfFiles: '1.3GB',
            svgSrc: Assets.iconsFolder,
            numberOfFiles: 1328,
          ),
          StorageInfoCard(
            title: 'Unkonwn',
            amountOfFiles: '15.GB',
            svgSrc: Assets.iconsUnknown,
            numberOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
