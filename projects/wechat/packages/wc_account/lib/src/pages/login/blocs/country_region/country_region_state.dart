part of 'country_region_bloc.dart';

@immutable
sealed class CountryRegionState extends Equatable {
  const CountryRegionState({
    required this.regionCodes,
    this.chooseRegionCode,
  });
  final List<CountryRegionPhoneCode> regionCodes;
  final CountryRegionPhoneCode? chooseRegionCode;

  @override
  List<Object?> get props => [regionCodes, chooseRegionCode];
}

/// 加载列表
final class CountryRegionLoadingState extends CountryRegionState {
  const CountryRegionLoadingState({super.chooseRegionCode})
      : super(regionCodes: const []);
}

/// 选择
final class CountryRegionChooseState extends CountryRegionState {
  const CountryRegionChooseState({
    CountryRegionPhoneCode? regionCode,
  }) : super(
            regionCodes: const [],
            chooseRegionCode: regionCode ?? CountryRegionPhoneCode.us);
}

/// 加载列表成功
final class CountryRegionLoadedState extends CountryRegionState {
  const CountryRegionLoadedState({
    required List<CountryRegionPhoneCode> regions,
    super.chooseRegionCode,
  }) : super(
          regionCodes: regions,
        );
}
