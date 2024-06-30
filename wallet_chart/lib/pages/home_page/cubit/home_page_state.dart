part of 'home_page_cubit.dart';

final class HomePageState extends Equatable {
  const HomePageState({required String title}) : _title = title;

  final String _title;

  String title() => _title;

  @override
  List<Object> get props => [_title];
}
