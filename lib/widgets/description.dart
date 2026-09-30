part of '../flutter_cupertino_settings.dart';

class const CSDescription(
  final String description, {
  final Color? backgroundColor,
  final TextStyle? style,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 7.5, 5, 5),
      color:
          backgroundColor ??
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: Text(
        description,
        style: basicTextStyle(context)
            .copyWith(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: kCSDescriptionFontsize,
              height: 1.1,
            )
            .merge(style),
      ),
    );
  }
}
