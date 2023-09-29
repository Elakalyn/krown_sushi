part of 'app_cubit.dart';

@immutable
sealed class AppState {}
final class AppInitial extends AppState {}

// Navigation states

final class ScreenChanged extends AppState {}
final class SelectedFilterState extends AppState {}

// Search states

final class StartSearchState extends AppState {}
final class SearchLoadingState extends AppState {}
final class SearchSuccessState extends AppState {}
final class SearchErrorState extends AppState {}

// Make Order states

final class MakeOrderLoadingState extends AppState {}
final class MakeOrderSuccessState extends AppState {}
final class MakeOrderErrorState extends AppState {}

// Apply filter

final class ApplyFilter extends AppState {}

// Book table

final class SelectTimeState extends AppState {}
final class SelectTableState extends AppState {}
