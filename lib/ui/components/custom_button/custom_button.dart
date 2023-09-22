import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/styles.dart';
import 'custom_cupertino_button.dart';

class CustomButton extends StatelessWidget {

  final Function()? onPressed;
  final Widget text;
  final EdgeInsets? externalMargin;
  final EdgeInsets? innerPadding;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? disabledColor;
  final bool loading;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final bool useShadow;
  final Widget? additionalWidget;
  final bool enabled;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.externalMargin,
    this.innerPadding,
    this.gradient,
    this.backgroundColor,
    this.disabledColor,
    this.loading = false,
    this.border,
    this.borderRadius,
    this.width,
    this.height,
    required this.useShadow,
    this.additionalWidget,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: externalMargin ?? const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        boxShadow: useShadow ? Styles.defaultShadow : null
      ),
      child: CustomCupertinoButton(
        padding: innerPadding,
        color: backgroundColor,
        border: border,
        gradient: gradient,
        borderRadius: borderRadius,
        disabledColor: disabledColor ?? CupertinoColors.quaternarySystemFill,
        onPressed: !enabled ? null : () {
          HapticFeedback.mediumImpact();
          if(onPressed != null) {
            onPressed!();
          }
        },
        child: _getChild(),
      ),
    );
  }

  Widget _getChild() {
    Widget result = Container();
    if(loading) {
      result = Container(
        margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: const CircularProgressIndicator.adaptive()
      );
    } else {
      if(additionalWidget != null) {
        result = Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            additionalWidget!,
            text
          ],
        );
      } else {
        result = text;
      }
    }
    return result;
  }
}
