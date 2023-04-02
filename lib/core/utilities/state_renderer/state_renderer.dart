import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:lottie/lottie.dart';

import '../app_managers/assets_manager.dart';
import '../app_managers/strings_manager.dart';
import '../app_managers/values_manager.dart';

enum StateRendererType {
  // POPUP STATES (DIALOG)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,

  // FULL SCREEN STATED (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  fullScreenHideState,
  // general
  contentState
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function retryActionFunction;

  const StateRenderer(
      {Key? key,
      required this.stateRendererType,
      required this.message,
      this.title = "",
      required this.retryActionFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AssetsManagerJson.loading),
          _getMessage(message, context),
        ]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AssetsManagerJson.error),
          _getMessage(message, context),
          _getRetryButton(StringsManager.ok, context)
        ]);
      case StateRendererType.popupSuccessState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AssetsManagerJson.success),
          _getMessage(message, context),
          _getRetryButton(StringsManager.ok, context)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          const SizedBox(height: SizeManager.s50),
          _getAnimatedImage(AssetsManagerJson.loading),
          _getMessage(message, context)
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(AssetsManagerJson.empty),
          _getMessage(message, context),
          _getRetryButton(StringsManager.retryAgain, context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(AssetsManagerJson.empty),
          _getMessage(message, context),
          _getRetryButton(StringsManager.retryAgain, context)
        ]);
      case StateRendererType.fullScreenHideState:
        return _getItemsColumn([]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeManager.s14)),
      elevation: SizeManager.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(SizeManager.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
        height: SizeManager.s100,
        width: SizeManager.s100,
        child: Lottie.asset(animationName));
  }

  Widget _getMessage(
    String message,
    BuildContext context,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.p8),
        child: Text(
          message,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.p18),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (stateRendererType ==
                      StateRendererType.fullScreenErrorState) {
                    // call retry function
                    retryActionFunction.call();
                  } else {
                    // popup error state
                    Navigator.of(context).pop();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }
}
