part of 'country_region_bloc.dart';

sealed class CountryRegionEvent extends Equatable {
  const CountryRegionEvent();
}

final class ChangedCountryRegion extends CountryRegionEvent {
  const ChangedCountryRegion({required this.regionPhoneCode});

  final CountryRegionPhoneCode regionPhoneCode;
  @override
  List<Object?> get props => [regionPhoneCode];
}

final class LoadCountryRegion extends CountryRegionEvent {
  const LoadCountryRegion();
  @override
  List<Object?> get props => [];
}
