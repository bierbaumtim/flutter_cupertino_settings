part of '../flutter_cupertino_settings.dart';

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl({
  /// The widget displayed at the left side of the widget.
  required final Widget nameWidget,

  /// The widget displayed at the right side of the widget.
  required final Widget contentWidget,
  CSWidgetStyle? style,

  /// The fontsize applied to the children.
  final double fontSize = kCSTitleFontsize,
}) extends CSWidget {
  this
    : super(
        _ControlWidget(
          fontSize: fontSize,
          contentWidget: contentWidget,
          nameWidget: nameWidget,
        ),
        style: style,
      );
}

class const _ControlWidget({
  // ignore: unused_element_parameter
  super.key,
  required final double fontSize,
  required final Widget contentWidget,
  required final Widget nameWidget,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: basicTextStyle(context).copyWith(
        color: CupertinoColors.label.resolveFrom(context),
        fontSize: fontSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[nameWidget, contentWidget],
      ),
    );
  }
}
