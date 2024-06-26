import 'package:flutter/material.dart';
import 'package:smart_home/views/detail/widgets/detail_widgets.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../models/models.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _headerView(context),
            ),
            SliverPrototypeExtentList.builder(
              itemCount: deviceSignals.length,
              itemBuilder: (context, index) {
                final signal = deviceSignals[index];
                return DeviceWifiSignal(
                  icon: signal.icon,
                  name: signal.name,
                  date: signal.date,
                  signal: signal.signal,
                  showDivider: index < (deviceSignals.length - 1),
                );
              },
              prototypeItem: const DeviceWifiSignal(
                icon: Icons.phone_iphone,
                name: "My Phone",
                date: "5GHz",
                signal: '6Mbps',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: const Text('Netgear WiFi Router')
              .textStyle(Theme.of(context).textTheme.titleLarge!)
              .fontSize(30),
        ),
        const Text('Your network is online and everything looks good')
            .fontSize(17)
            .textColor(const Color(0xff61688B)),
        const SizedBox(height: 25),
        const Row(
          children: [
            Expanded(
              child: DeviceSpeed(
                title: 'Download\nSpeed',
                bgColor: Color(0xff33AEFE),
                icon: Icons.arrow_downward,
                speed: '69 Mbps',
              ),
            ),
            SizedBox(width: 25),
            Expanded(
              child: DeviceSpeed(
                title: 'Upload\nSpeed',
                bgColor: Color(0xff7367FF),
                icon: Icons.arrow_upward,
                speed: '12 Mbps',
              ),
            ),
          ],
        ),
        Text('${deviceSignals.length} devices connected')
            .fontSize(20)
            .fontWeight(FontWeight.w700)
            .textColor(const Color(0xff161B3A))
            .padding(top: 55, bottom: 20),
      ],
    );
  }
}
