part of '../flutter_cupertino_settings.dart';

/// Provides a button for navigation
class const CSSecret(
  final String text,
  final String secret, {
  final CSWidgetStyle? style,
  final double fontSize = kCSTitleFontsize,
}) extends StatefulWidget {
  @override
  _CSSecretState createState() => _CSSecretState();
}

class _CSSecretState() extends State<CSSecret> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return CSWidget(
      DefaultTextStyle(
        style: basicTextStyle(context).copyWith(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: widget.fontSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.text),
            Row(
              children: <Widget>[
                Text(_show ? widget.secret : '•' * widget.secret.length),
                CupertinoButton(
                  onPressed: () => setState(() => _show = !_show),
                  child: const Icon(CupertinoIcons.eye_solid),
                ),
              ],
            ),
          ],
        ),
      ),
      style: const CSWidgetStyle().merge(widget.style),
    );
  }
}
