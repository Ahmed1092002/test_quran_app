part of 'get_surah_cubit.dart';

@immutable
sealed class GetSurahState {}

final class GetSurahInitial extends GetSurahState {}
final class GetSurahLoading extends GetSurahState {}
final class GetSurahSuccess extends GetSurahState {
  final String message;


   GetSurahSuccess({required this.message });
}
final class GetSurahError extends GetSurahState {
  final String errorMessage;

   GetSurahError({required this.errorMessage });
}
