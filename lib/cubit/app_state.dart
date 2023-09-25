part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
final class ScreenChanged extends AppState {}
final class SelectedFilterState extends AppState {}

// Search states

final class StartSearchState extends AppState {}
final class SearchLoadingState extends AppState {}
final class SearchSuccessState extends AppState {}
final class SearchErrorState extends AppState {}
