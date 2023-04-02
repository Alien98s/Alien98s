import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(String countryMobileCode, String mobileNumber) =
      _RegisterObject;
}
