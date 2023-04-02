import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/scheduler.dart';
import 'package:saif_attaya/app/configs/injection.dart';
import 'package:saif_attaya/core/utilities/app_managers/color_manager.dart';

import '../../../core/utilities/app_managers/assets_manager.dart';
import '../../../core/utilities/app_managers/values_manager.dart';
import '../../../core/utilities/navigation/compass.dart';
import '../../../core/utilities/state_renderer/state_renderer_impl.dart';
import '../manger/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = getIt.get<RegisterViewModel>();

  final _formKey = GlobalKey<FormState>();

  final _mobileNumberEditingController = TextEditingController();

  _bind() {
    _viewModel.start();
    _mobileNumberEditingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberEditingController.text);
    });
    _viewModel.isUserRegisteredInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(Compass.homeRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.verifyPhoneNumber();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
        padding: const EdgeInsets.only(top: PaddingManager.p28),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Image(
                    image: const AssetImage(AssetsManagerImage.splashLogo),
                    color: ColorsManager.main4,
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s18,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: PaddingManager.p28, right: PaddingManager.p28),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: CountryCodePicker(
                              onChanged: (country) {
                                // update view model with code
                                _viewModel.setCountryCode(
                                  country.dialCode ?? "",
                                );
                              },
                              initialSelection: '+966',
                              favorite: const ['+20', 'UAE', "+966"],
                              // optional. Shows only country name and flag
                              showCountryOnly: true,
                              hideMainText: true,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: true,
                            )),
                        Expanded(
                            flex: 4,
                            child: StreamBuilder<String?>(
                                stream: _viewModel.outputErrorMobileNumber,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: _mobileNumberEditingController,
                                    decoration: InputDecoration(
                                        hintText: "1111553377",
                                        labelText: "رقم الهاتف",
                                        errorText: snapshot.data),
                                  );
                                }))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s40,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: SizeManager.s28, right: SizeManager.s28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outputAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: SizeManager.s40,
                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _viewModel.verifyPhoneNumber();
                                    }
                                  : null,
                              child: const Text("تحقق من الهاتف")),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
