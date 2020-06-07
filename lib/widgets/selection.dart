part of flutter_cupertino_settings;

/// A selection view
/// Allows to select between multiple items
/// Every item is represented by a String
///
/// If an item is selected, onSelected is called with its index
///
/// eg:
/// items = ["hello","world","flutter"]
/// select "world"
///
/// onSelected(1)

class CSSelection<T> extends StatelessWidget {
  final List<CSSelectionItem<T>> items;
  final void Function(T selected) onSelected;
  final T currentSelection;
  final double fontSize;
  final Color backgroundColor;

  const CSSelection({
    @required this.items,
    @required this.onSelected,
    @required this.currentSelection,
    this.fontSize,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items.map<Widget>((item) => createItem(context, item)).toList(),
    );
  }

  Widget createItem(BuildContext context, CSSelectionItem<T> item) {
    return CSWidget(
      CupertinoButton(
        onPressed: () {
          if (item.value != currentSelection) {
            HapticFeedback.selectionClick();
            onSelected(item.value);
          }
        },
        pressedOpacity: 1.0,
        padding: const EdgeInsets.fromLTRB(4, 1, 2, 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                item.text,
                style: TextStyle(
                  color: CupertinoColors.label.resolveFrom(context),
                  fontSize: fontSize ?? CS_TITLE_FONT_SIZE,
                ),
              ),
            ),
            Icon(
              CupertinoIcons.check_mark,
              color: item.value == currentSelection
                  ? CupertinoColors.activeBlue
                  : const Color(0x00000000),
              size: CS_CHECK_SIZE,
            ),
          ],
        ),
      ),
      addPaddingToBorder: items.last != item,
      showTopBorder: item.showTopBorder,
      backgroundColor: backgroundColor,
    );
  }
}

class CSSelectionItem<T> {
  final T value;
  final String text;
  final bool showTopBorder;

  const CSSelectionItem({
    this.value,
    this.text,
    this.showTopBorder = false,
  }) : assert(value != null);
}
