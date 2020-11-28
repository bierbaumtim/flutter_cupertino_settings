part of flutter_cupertino_settings;

/// A button-cell inside [CupertinoSettings]
/// 3 different types are available (they only affect the design):
/// [CSButtonType.DESTRUCTIVE] Red and centered
/// [CSButtonType.DEFAULT] Blue and left aligned
/// [CSButtonType.DEFAULT_CENTER] Blue and centered
/// Provides the correct paddings and text properties
///
/// It is quite complex:
///
/// -- Widget
///   |- Flex
///     |- Expand
///       |- CupertinoButton
///         |- Container        (<--- For text-alignment)
///           |- Text
///
/// This "hack" is mandatory to archive that...
/// 1) The button can be aligned
/// 2) The entire row is touch-sensitive
class CSButton extends CSWidget {
  /// Default: CS_TITLE_FONT_SIZE which is actually 16.0
  final double fontSize;
  final CSButtonType buttonType;
  final VoidCallback pressed;
  final Widget child;

  CSButton({
    required this.child,
    required this.pressed,
    this.buttonType = CSButtonType.defaultStyle,
    this.fontSize = kCSTitleFontsize,
    CSWidgetStyle? style,
  }) : super(
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: pressed,
                  child: Container(
                    alignment: buttonType.alignment,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: buttonType.color,
                        fontSize: fontSize,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),
          style: style,
        );
}

/// Defines different types for [CSButton]
/// Specifies color and alignment
class CSButtonType {
  final Color color;
  final AlignmentGeometry alignment;

  const CSButtonType(this.color, this.alignment);

  static const CSButtonType defaultStyle = CSButtonType(
    CupertinoColors.systemBlue,
    AlignmentDirectional.centerStart,
  );

  static const CSButtonType destructiveStyle = CSButtonType(
    CupertinoColors.destructiveRed,
    AlignmentDirectional.center,
  );

  static const CSButtonType defaultCenterStyle = CSButtonType(
    CupertinoColors.systemBlue,
    AlignmentDirectional.center,
  );
}
