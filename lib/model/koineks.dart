import 'package:json_annotation/json_annotation.dart';

/// This allows the `Koineks` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'koineks.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Koineks {
  Koineks(this.shortCode, this.name, this.current);

  @JsonKey(name: 'short_code')
  String shortCode;
  String name;
  String current;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$KoineksFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Koineks.fromJson(Map<String, dynamic> json) =>
      _$KoineksFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$KoineksToJson`.
  Map<String, dynamic> toJson() => _$KoineksToJson(this);
}
