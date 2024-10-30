part of 'country_region_bloc.dart';

@immutable
final class CountryRegionState extends Equatable {
  const CountryRegionState({
    this.regionCodes = const [],
    this.chooseRegionCode,
  });
  final List<CountryRegionPhoneCode> regionCodes;
  final CountryRegionPhoneCode? chooseRegionCode;

  CountryRegionState copyWith(
      {List<CountryRegionPhoneCode>? regionCodes,
      CountryRegionPhoneCode? chooseRegionCode}) {
    return CountryRegionState(
      regionCodes: regionCodes ?? this.regionCodes,
      chooseRegionCode: chooseRegionCode ?? this.chooseRegionCode,
    );
  }

  @override
  List<Object?> get props => [chooseRegionCode, regionCodes];
}
