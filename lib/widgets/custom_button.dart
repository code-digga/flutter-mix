import 'package:flutter/material.dart';
import 'package:flutter_mix_tutorial/theme_data.dart';
import 'package:mix/mix.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.btnTitle,
      this.shouldEnable = true,
      this.customStyle});
  final void Function() onPressed;
  final String btnTitle;
  final bool shouldEnable;
  final Style? customStyle;

  @override
  Widget build(BuildContext context) {
    return PressableBox(
        onPress: onPressed,
        style: customStyle ?? baseBtnStyle,
        enabled: shouldEnable,
        child: Center(child: StyledText(btnTitle)));
  }
}

// Base style for all custom buttons
final baseBtnStyle = Style(
    $box.width(150),
    $box.height(70),
    $box.borderRadius.all.ref(smallRadius),
    $box.border.all.color.ref(primaryColor),
    $box.color.ref(primaryColor),
    $text.style.ref(largeText),
    $text.style.color(Colors.white),
    $text.style.ref(largeText),

    // style for any button marked as disabled
    $on.disabled($box.color(Colors.grey), $box.border.all.color(Colors.grey)),

    // style for any button with the next variant applied to it.
    nextVariant($box.border.all.color.ref(secondaryColor),
        $box.color.ref(secondaryColor)));

// variant for the 'Next' button specific style
const nextVariant = Variant('next-button');
