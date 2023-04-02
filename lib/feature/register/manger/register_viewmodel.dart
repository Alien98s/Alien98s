import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saif_attaya/core/utilities/navigation/compass.dart';

import '../../../core/utilities/data_classes/freezed_data_classes.dart';
import '../../../core/utilities/state_renderer/baseviewmodel.dart';
import '../../../core/utilities/state_renderer/state_renderer.dart';
import '../../../core/utilities/state_renderer/state_renderer_impl.dart';

@injectable
class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  final _codeController = TextEditingController();

  StreamController mobileNumberStreamController =
      StreamController<String>.broadcast();

  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserRegisteredInSuccessfullyStreamController =
      StreamController<bool>();
  var registerObject = RegisterObject("", "");

  RegisterViewModel();

  // inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    mobileNumberStreamController.close();
    areAllInputsValidStreamController.close();
    isUserRegisteredInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputMobileNumber => mobileNumberStreamController.sink;

  @override
  Sink get inputAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  verifyPhoneNumber() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
        message: 'جاري ارسال الكود الي رقم الهاتف'));

    /// verifyPhoneNumber
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:
          '${registerObject.countryMobileCode} ${registerObject.mobileNumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          inputState.add(ErrorState(
              StateRendererType.popupErrorState, "رقم هاتف غير حقيقي"));
          log('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = 'xxxx';
        showDialog(
            context: Compass.navigatorKey.currentState!.context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
                  title: const Flexible(
                    child: Text("ادخل الكود المرسل عبر الهاتف"),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        smsCode = _codeController.text.trim();

                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: smsCode);

                        await FirebaseAuth.instance
                            .signInWithCredential(credential)
                            .then((_) {
                          inputState.add(ContentState());
                          isUserRegisteredInSuccessfullyStreamController.add(
                            true,
                          );
                        });
                      },
                      child: const Text("تم"),
                    )
                  ],
                ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  setCountryCode(String countryCode) {
    if (countryCode.isNotEmpty) {
      //  update register view object
      registerObject = registerObject.copyWith(countryMobileCode: countryCode);
    } else {
      // reset code value in register view object
      registerObject = registerObject.copyWith(countryMobileCode: "");
    }
    validate();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if (_isMobileNumberValid(mobileNumber)) {
      //  update register view object
      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    } else {
      // reset mobileNumber value in register view object
      registerObject = registerObject.copyWith(mobileNumber: "");
    }
    validate();
  }

  // -- outputs

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumber =>
      outputIsMobileNumberValid.map((isMobileNumberValid) =>
          isMobileNumberValid ? null : "رقم هاتف غير صحيح");

  @override
  Stream<bool> get outputAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  // --  private functions

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10;
  }

  bool _areAllInputsValid() {
    return registerObject.mobileNumber.isNotEmpty;
  }

  validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterViewModelInput {
  Sink get inputMobileNumber;

  Sink get inputAllInputsValid;

  verifyPhoneNumber();

  setMobileNumber(String mobileNumber);

  setCountryCode(String countryCode);
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsMobileNumberValid;

  Stream<String?> get outputErrorMobileNumber;

  Stream<bool> get outputAreAllInputsValid;
}
