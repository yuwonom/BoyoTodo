import 'package:boyo_todo/themes/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool hasBackButton;

  const CustomAppBar(this.title, {
    Key key, 
    this.hasBackButton = false,
  })
  : assert(title != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.start,
          style: AppTextStyles.header1,
        ),
      ),
    );

    final back = Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
        color: AppColors.white,
      ),
    );

    final appBar = AppBar(
      brightness: Brightness.dark,
      elevation: 0.0,
      backgroundColor: AppColors.black,
      title: text,
      automaticallyImplyLeading: true,
      leading: hasBackButton ? back : null,
    );

    return appBar;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}