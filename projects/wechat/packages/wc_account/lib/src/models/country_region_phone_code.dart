import 'package:equatable/equatable.dart';

/// 国家地区电话区号
class CountryRegionPhoneCode extends Equatable {
  const CountryRegionPhoneCode({
    required this.englishName,
    required this.chineseName,
    required this.countryCode,
    required this.phoneCode,
  });
  final String englishName;
  final String chineseName;
  final String countryCode;
  final String phoneCode;

  @override
  List<Object?> get props => [englishName, chineseName, countryCode, phoneCode];

  @override
  bool? get stringify => true;

  /// 美国
  static const CountryRegionPhoneCode us = CountryRegionPhoneCode(
      englishName: "United States",
      chineseName: "美国",
      countryCode: "US",
      phoneCode: "1");
}
