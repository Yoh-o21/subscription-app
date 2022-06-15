import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'date_time_converter.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
class Subscription with _$Subscription {
  factory Subscription(
      {required String id,
      required String name,
      required int price,
      required BillingInterval billingInterval,
      @DateTimeTimestampConverter() required DateTime createdAt,
      @DateTimeTimestampConverter() required DateTime startAt,
      @DateTimeTimestampConverter() required DateTime billingAt,
      @Default(true) bool isSubscribed}) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

enum BillingInterval { monthly, yearly }
