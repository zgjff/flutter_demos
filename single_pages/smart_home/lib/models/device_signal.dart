import 'package:flutter/material.dart';

class DeviceSignal {
  const DeviceSignal({
    required this.icon,
    required this.name,
    required this.date,
    required this.signal,
  });
  final IconData icon;
  final String name, date, signal;
}

const List<DeviceSignal> deviceSignals = [
  DeviceSignal(
    icon: Icons.phone_iphone,
    name: 'My Phone',
    date: '5GHz, 2h ago',
    signal: '6Mbps',
  ),
  DeviceSignal(
    icon: Icons.phone_iphone,
    name: "Emi's iPhone",
    date: '5GHz, 2h ago',
    signal: '4Mbps',
  ),
  DeviceSignal(
    icon: Icons.laptop_mac,
    name: 'MacBook',
    date: '2.4GHz, 7h ago',
    signal: '7Mbps',
  ),
  DeviceSignal(
    icon: Icons.laptop_mac,
    name: 'iMac',
    date: '2.4GHz, 03/17 16:20',
    signal: '9Mbps',
  ),
];
