part of 'surah_list_cubit.dart';

@immutable
sealed class SurahListState {}

final class SurahListInitial extends SurahListState {}

final class SurahListDataLoading extends SurahListState {}
final class SurahListDataSuccess extends SurahListState {}
final class SurahListDataFailed extends SurahListState {}
