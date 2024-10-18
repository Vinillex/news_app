// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String greetings) noInternetState,
    required TResult Function(String greetings) internetAvailable,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String greetings)? noInternetState,
    TResult? Function(String greetings)? internetAvailable,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String greetings)? noInternetState,
    TResult Function(String greetings)? internetAvailable,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoInternetState value) noInternetState,
    required TResult Function(_InternetAvailableState value) internetAvailable,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoInternetState value)? noInternetState,
    TResult? Function(_InternetAvailableState value)? internetAvailable,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoInternetState value)? noInternetState,
    TResult Function(_InternetAvailableState value)? internetAvailable,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String greetings) noInternetState,
    required TResult Function(String greetings) internetAvailable,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String greetings)? noInternetState,
    TResult? Function(String greetings)? internetAvailable,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String greetings)? noInternetState,
    TResult Function(String greetings)? internetAvailable,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoInternetState value) noInternetState,
    required TResult Function(_InternetAvailableState value) internetAvailable,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoInternetState value)? noInternetState,
    TResult? Function(_InternetAvailableState value)? internetAvailable,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoInternetState value)? noInternetState,
    TResult Function(_InternetAvailableState value)? internetAvailable,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NoInternetStateImplCopyWith<$Res> {
  factory _$$NoInternetStateImplCopyWith(_$NoInternetStateImpl value,
          $Res Function(_$NoInternetStateImpl) then) =
      __$$NoInternetStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String greetings});
}

/// @nodoc
class __$$NoInternetStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$NoInternetStateImpl>
    implements _$$NoInternetStateImplCopyWith<$Res> {
  __$$NoInternetStateImplCopyWithImpl(
      _$NoInternetStateImpl _value, $Res Function(_$NoInternetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greetings = null,
  }) {
    return _then(_$NoInternetStateImpl(
      null == greetings
          ? _value.greetings
          : greetings // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoInternetStateImpl implements _NoInternetState {
  const _$NoInternetStateImpl(this.greetings);

  @override
  final String greetings;

  @override
  String toString() {
    return 'HomeState.noInternetState(greetings: $greetings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternetStateImpl &&
            (identical(other.greetings, greetings) ||
                other.greetings == greetings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, greetings);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoInternetStateImplCopyWith<_$NoInternetStateImpl> get copyWith =>
      __$$NoInternetStateImplCopyWithImpl<_$NoInternetStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String greetings) noInternetState,
    required TResult Function(String greetings) internetAvailable,
    required TResult Function() loading,
  }) {
    return noInternetState(greetings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String greetings)? noInternetState,
    TResult? Function(String greetings)? internetAvailable,
    TResult? Function()? loading,
  }) {
    return noInternetState?.call(greetings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String greetings)? noInternetState,
    TResult Function(String greetings)? internetAvailable,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (noInternetState != null) {
      return noInternetState(greetings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoInternetState value) noInternetState,
    required TResult Function(_InternetAvailableState value) internetAvailable,
    required TResult Function(_Loading value) loading,
  }) {
    return noInternetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoInternetState value)? noInternetState,
    TResult? Function(_InternetAvailableState value)? internetAvailable,
    TResult? Function(_Loading value)? loading,
  }) {
    return noInternetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoInternetState value)? noInternetState,
    TResult Function(_InternetAvailableState value)? internetAvailable,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (noInternetState != null) {
      return noInternetState(this);
    }
    return orElse();
  }
}

abstract class _NoInternetState implements HomeState {
  const factory _NoInternetState(final String greetings) =
      _$NoInternetStateImpl;

  String get greetings;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoInternetStateImplCopyWith<_$NoInternetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternetAvailableStateImplCopyWith<$Res> {
  factory _$$InternetAvailableStateImplCopyWith(
          _$InternetAvailableStateImpl value,
          $Res Function(_$InternetAvailableStateImpl) then) =
      __$$InternetAvailableStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String greetings});
}

/// @nodoc
class __$$InternetAvailableStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InternetAvailableStateImpl>
    implements _$$InternetAvailableStateImplCopyWith<$Res> {
  __$$InternetAvailableStateImplCopyWithImpl(
      _$InternetAvailableStateImpl _value,
      $Res Function(_$InternetAvailableStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greetings = null,
  }) {
    return _then(_$InternetAvailableStateImpl(
      null == greetings
          ? _value.greetings
          : greetings // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InternetAvailableStateImpl implements _InternetAvailableState {
  const _$InternetAvailableStateImpl(this.greetings);

  @override
  final String greetings;

  @override
  String toString() {
    return 'HomeState.internetAvailable(greetings: $greetings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternetAvailableStateImpl &&
            (identical(other.greetings, greetings) ||
                other.greetings == greetings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, greetings);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternetAvailableStateImplCopyWith<_$InternetAvailableStateImpl>
      get copyWith => __$$InternetAvailableStateImplCopyWithImpl<
          _$InternetAvailableStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String greetings) noInternetState,
    required TResult Function(String greetings) internetAvailable,
    required TResult Function() loading,
  }) {
    return internetAvailable(greetings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String greetings)? noInternetState,
    TResult? Function(String greetings)? internetAvailable,
    TResult? Function()? loading,
  }) {
    return internetAvailable?.call(greetings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String greetings)? noInternetState,
    TResult Function(String greetings)? internetAvailable,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (internetAvailable != null) {
      return internetAvailable(greetings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoInternetState value) noInternetState,
    required TResult Function(_InternetAvailableState value) internetAvailable,
    required TResult Function(_Loading value) loading,
  }) {
    return internetAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoInternetState value)? noInternetState,
    TResult? Function(_InternetAvailableState value)? internetAvailable,
    TResult? Function(_Loading value)? loading,
  }) {
    return internetAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoInternetState value)? noInternetState,
    TResult Function(_InternetAvailableState value)? internetAvailable,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (internetAvailable != null) {
      return internetAvailable(this);
    }
    return orElse();
  }
}

abstract class _InternetAvailableState implements HomeState {
  const factory _InternetAvailableState(final String greetings) =
      _$InternetAvailableStateImpl;

  String get greetings;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternetAvailableStateImplCopyWith<_$InternetAvailableStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String greetings) noInternetState,
    required TResult Function(String greetings) internetAvailable,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String greetings)? noInternetState,
    TResult? Function(String greetings)? internetAvailable,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String greetings)? noInternetState,
    TResult Function(String greetings)? internetAvailable,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoInternetState value) noInternetState,
    required TResult Function(_InternetAvailableState value) internetAvailable,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoInternetState value)? noInternetState,
    TResult? Function(_InternetAvailableState value)? internetAvailable,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoInternetState value)? noInternetState,
    TResult Function(_InternetAvailableState value)? internetAvailable,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  const factory _Loading() = _$LoadingImpl;
}
