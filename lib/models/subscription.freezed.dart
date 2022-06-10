// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
mixin _$Subscription {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get billingInterval => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get startAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get billingAt => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String billingInterval,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime startAt,
      @DateTimeTimestampConverter() DateTime billingAt,
      int price,
      bool isSubscribed});
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res> implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  final Subscription _value;
  // ignore: unused_field
  final $Res Function(Subscription) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? billingInterval = freezed,
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? billingAt = freezed,
    Object? price = freezed,
    Object? isSubscribed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      billingInterval: billingInterval == freezed
          ? _value.billingInterval
          : billingInterval // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      billingAt: billingAt == freezed
          ? _value.billingAt
          : billingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isSubscribed: isSubscribed == freezed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SubscriptionCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$_SubscriptionCopyWith(
          _$_Subscription value, $Res Function(_$_Subscription) then) =
      __$$_SubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String billingInterval,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime startAt,
      @DateTimeTimestampConverter() DateTime billingAt,
      int price,
      bool isSubscribed});
}

/// @nodoc
class __$$_SubscriptionCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res>
    implements _$$_SubscriptionCopyWith<$Res> {
  __$$_SubscriptionCopyWithImpl(
      _$_Subscription _value, $Res Function(_$_Subscription) _then)
      : super(_value, (v) => _then(v as _$_Subscription));

  @override
  _$_Subscription get _value => super._value as _$_Subscription;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? billingInterval = freezed,
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? billingAt = freezed,
    Object? price = freezed,
    Object? isSubscribed = freezed,
  }) {
    return _then(_$_Subscription(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      billingInterval: billingInterval == freezed
          ? _value.billingInterval
          : billingInterval // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      billingAt: billingAt == freezed
          ? _value.billingAt
          : billingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isSubscribed: isSubscribed == freezed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subscription with DiagnosticableTreeMixin implements _Subscription {
  _$_Subscription(
      {required this.id,
      required this.name,
      required this.billingInterval,
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeTimestampConverter() required this.startAt,
      @DateTimeTimestampConverter() required this.billingAt,
      required this.price,
      required this.isSubscribed});

  factory _$_Subscription.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriptionFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String billingInterval;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime startAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime billingAt;
  @override
  final int price;
  @override
  final bool isSubscribed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Subscription(id: $id, name: $name, billingInterval: $billingInterval, createdAt: $createdAt, startAt: $startAt, billingAt: $billingAt, price: $price, isSubscribed: $isSubscribed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Subscription'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('billingInterval', billingInterval))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('startAt', startAt))
      ..add(DiagnosticsProperty('billingAt', billingAt))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('isSubscribed', isSubscribed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subscription &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.billingInterval, billingInterval) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.startAt, startAt) &&
            const DeepCollectionEquality().equals(other.billingAt, billingAt) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.isSubscribed, isSubscribed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(billingInterval),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(startAt),
      const DeepCollectionEquality().hash(billingAt),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(isSubscribed));

  @JsonKey(ignore: true)
  @override
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      __$$_SubscriptionCopyWithImpl<_$_Subscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionToJson(this);
  }
}

abstract class _Subscription implements Subscription {
  factory _Subscription(
      {required final String id,
      required final String name,
      required final String billingInterval,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      @DateTimeTimestampConverter() required final DateTime startAt,
      @DateTimeTimestampConverter() required final DateTime billingAt,
      required final int price,
      required final bool isSubscribed}) = _$_Subscription;

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$_Subscription.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get billingInterval => throw _privateConstructorUsedError;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @DateTimeTimestampConverter()
  DateTime get startAt => throw _privateConstructorUsedError;
  @override
  @DateTimeTimestampConverter()
  DateTime get billingAt => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  bool get isSubscribed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}
