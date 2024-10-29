import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wc_account/src/models/country_region_phone_code.dart';

part 'country_region_event.dart';
part 'country_region_state.dart';

class CountryRegionBloc extends Bloc<CountryRegionEvent, CountryRegionState> {
  CountryRegionBloc() : super(CountryRegionChooseState(regionCode: null)) {
    on<CountryRegionEvent>((event, emit) {});
  }
}
