import 'package:flutter/foundation.dart';

@immutable
abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class OpenPageEvent extends HomeEvent {
  final String url;

  OpenPageEvent({
    required this.url,
  });
}
