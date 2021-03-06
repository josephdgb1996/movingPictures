part of 'search_bloc.dart';

@freezed
abstract class SearchEvent with _$SearchEvent {
  const factory SearchEvent.trendingCalled() = _TrendingCalled;
  const factory SearchEvent.queryCalled(String query) = _QueryCalled;
}
