import 'dart:convert' as convert;

import 'package:boyo_todo/features/login/dtos.dart';
import 'package:built_value/serializer.dart';

part 'serialization.g.dart';

@SerializersFor(const [
  UserDto,
])

// Support for BuiltList<$X> needs to be added explicitly because there are no
// BuiltList<$X> instances anywhere in the DTOs, but we need it for API endpoints.
final Serializers serializers = (_$serializers.toBuilder()).build();

/// A mixin that provides JSON (de)serialization support.
abstract class SerializationMixin {
  /// Serializes [object] to JSON.
  ///
  /// [fullType] must fully describe the type being serialized. Due to limitations in Dart's
  /// type system, it cannot be inferred from a generic type parameter `T`.
  ///
  /// More information at https://github.com/google/built_value.dart/issues/438.
  String serialize(Object object, FullType fullType) {
    assert(object != null, "Unable to serialize null.");
    assert(fullType != null);

    return convert.json.encode(serializers.serialize(object, specifiedType: fullType));
  }

  /// Deserializes [json] into a [T].
  ///
  /// [fullType] must fully describe the type being serialized. Due to limitations in Dart's
  /// type system, it cannot be inferred from the generic type parameter [T].
  ///
  /// More information at https://github.com/google/built_value.dart/issues/438.
  T deserialize<T>(String json, FullType fullType) {
    assert(json != null);
    assert(fullType != null);

    final result = serializers.deserialize(convert.json.decode(json), specifiedType: fullType);

    if (result is T) {
      return result;
    } else {
      final error = "Result of deserialization is of type ${result?.runtimeType}, not the expected type $T.";
      throw Exception(error);
    }
  }
}
