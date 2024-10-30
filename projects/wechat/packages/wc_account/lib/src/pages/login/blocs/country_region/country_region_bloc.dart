import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wc_account/src/models/country_region_phone_code.dart';

part 'country_region_event.dart';
part 'country_region_state.dart';

class CountryRegionBloc extends Bloc<CountryRegionEvent, CountryRegionState> {
  CountryRegionBloc()
      : super(CountryRegionState(chooseRegionCode: CountryRegionPhoneCode.us)) {
    on<ChangedCountryRegion>((event, emit) {
      emit(state.copyWith(chooseRegionCode: event.regionPhoneCode));
    });
    on<LoadCountryRegion>((event, emit) {
      if (state.regionCodes.isNotEmpty) {
        emit(state.copyWith());
        return;
      }
      _onLoadCountryRegion(event, emit);
    });
  }

  Future<void> _onLoadCountryRegion(
      LoadCountryRegion event, Emitter<CountryRegionState> emit) async {
    try {
      final result = await _fetchRegionPhoneCodes();
      emit(state.copyWith(regionCodes: result));
    } catch (error) {
      emit(state.copyWith(regionCodes: null));
    }
  }

  Future<List<CountryRegionPhoneCode>> _fetchRegionPhoneCodes() async {
    return Future.value([]);
  }
}
