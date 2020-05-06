import 'package:flutter/cupertino.dart';

///Will be used in different screens so better have it's own widget
class CircularAvatar extends StatelessWidget {
  final String url;

  const CircularAvatar({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      height: 75.0,
      decoration: new BoxDecoration(
        border: Border.all(color: Color(0xFFE8C590), width: 3.0),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(url),
        ),
      ),
    );
  }
}
