import 'package:flutter/foundation.dart';

@immutable
abstract class DetailedViewEvent {}

class InitDetailsEvent extends DetailedViewEvent {
  final String url;

  InitDetailsEvent({
    required this.url,
  });
}
