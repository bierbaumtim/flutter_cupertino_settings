part of '../flutter_cupertino_settings.dart';

/// This widgets is used as a grouping separator.
/// The [title] attribute is optional.
class const CSHeader(
  final String title, {
  final BorderSide? bottomBorder,
  final TextStyle? style,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        border: Border(bottom: bottomBorder ?? kCupertinoBorderSide(context)),
      ),
      child: Text(
        title.toUpperCase(),
        style: CupertinoTheme.of(context).textTheme.textStyle
            .merge(const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            .merge(style),
      ),
    );
  }
}
