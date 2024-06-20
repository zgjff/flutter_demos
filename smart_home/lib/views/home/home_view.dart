import 'package:flutter/material.dart';
import 'package:smart_home/views/home/widgets/device_card.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../generated/assets.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import 'widgets/feature_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sort,
            size: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 25,
              child: Image.asset(Assets.assets1),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Smart Home')
                .textStyle(Theme.of(context).textTheme.titleLarge!)
                .padding(top: 15, bottom: 30),
            _featuresView(context),
            const Text('Living Room')
                .textStyle(Theme.of(context).textTheme.titleLarge!)
                .fontSize(22)
                .padding(top: 35, bottom: 8),
            Text('${devices.length} devices')
                .fontSize(13)
                .textColor(const Color(0xff61688B)),
            const SizedBox(height: 30),
            _devicesView(),
          ],
        ),
      ),
    );
  }

  Widget _featuresView(BuildContext context) {
    const double space = 25;
    const double height = 80;
    final vh =
        height * (features.length / 2) + space * (features.length / 2 - 1);
    return SizedBox(
      width: double.infinity,
      height: vh,
      child: GridView.builder(
          itemCount: features.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedHeight(
            crossAxisCount: 2,
            height: height,
            mainAxisSpacing: space,
            crossAxisSpacing: space,
          ),
          itemBuilder: (context, index) {
            return FeatureWidget(
              icon: features[index].icon,
              title: features[index].title,
              color: features[index].color,
            );
          }),
    );
  }

  Widget _devicesView() {
    return Row(
      children: [
        Expanded(
          child: DeviceCard(
            title: devices[0].title,
            subTitle: devices[0].subTitle,
            icon: devices[0].icon,
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: DeviceCard(
            title: devices[1].title,
            subTitle: devices[1].subTitle,
            icon: devices[1].icon,
          ),
        ),
      ],
    );
  }
}
