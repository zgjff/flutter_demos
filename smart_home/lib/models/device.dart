import 'package:smart_home/generated/assets.dart';

class Device {
  const Device({
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle, icon;
}

const List<Device> devices = [
  Device(
    title: 'Netgear',
    subTitle: 'WiFi Router',
    icon: Assets.assetsWifiRouter,
  ),
  Device(
    title: 'Living Room',
    subTitle: 'Speaker',
    icon: Assets.assetsRoomSpeaker,
  ),
];
