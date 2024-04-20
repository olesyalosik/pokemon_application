import 'package:flutter/foundation.dart';

@immutable
abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class OpenDetailedViewEvent extends HomeEvent {
  final String url;

  OpenDetailedViewEvent({
    required this.url,
  });
}

class OpenPageEvent extends HomeEvent {
  final String url;

  OpenPageEvent({
    required this.url,
  });
}
