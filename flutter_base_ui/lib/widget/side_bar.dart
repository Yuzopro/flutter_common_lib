import 'package:flutter/material.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:flutter_common_util/flutter_common_util.dart';

typedef OnTouchingLetterChanged = void Function(String letter);

const List<String> A_Z_LIST = const [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];

class SideBar extends StatefulWidget {
  SideBar({
    Key key,
    this.data = A_Z_LIST,
    @required this.onTouch,
    this.width = 30,
    this.itemHeight = 16,
    this.color = Colors.transparent,
    this.textStyle = const TextStyle(
      fontSize: 12.0,
      color: Color(YZColors.subTextColor),
    ),
    this.touchDownColor = const Color(0x40E0E0E0),
    this.touchDownTextStyle = const TextStyle(
      fontSize: 12.0,
      color: Color(YZColors.mainTextColor),
    ),
  });

  final List<String> data;

  final int width;

  final int itemHeight;

  final Color color;

  final Color touchDownColor;

  final TextStyle textStyle;

  final TextStyle touchDownTextStyle;

  final OnTouchingLetterChanged onTouch;

  @override
  _SideBarState createState() {
    return _SideBarState();
  }
}

class _SideBarState extends State<SideBar> {
  bool _isTouchDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: _isTouchDown ? widget.touchDownColor : widget.color,
      width: widget.width.toDouble(),
      child: _SlideItemBar(
        data: widget.data,
        width: widget.width,
        itemHeight: widget.itemHeight,
        textStyle: widget.textStyle,
        touchDownTextStyle: widget.touchDownTextStyle,
        onTouch: (letter) {
          if (widget.onTouch != null) {
            setState(() {
              _isTouchDown = !TextUtil.isEmpty(letter);
            });
            widget.onTouch(letter);
          }
        },
      ),
    );
  }
}

class _SlideItemBar extends StatefulWidget {
  final List<String> data;

  final int width;

  final int itemHeight;

  final TextStyle textStyle;

  final TextStyle touchDownTextStyle;

  final OnTouchingLetterChanged onTouch;

  _SlideItemBar(
      {Key key,
      this.data = A_Z_LIST,
      @required this.onTouch,
      this.width = 30,
      this.itemHeight = 16,
      this.textStyle,
      this.touchDownTextStyle})
      : assert(onTouch != null),
        super(key: key);

  @override
  _SlideItemBarState createState() {
    return _SlideItemBarState();
  }
}

class _SlideItemBarState extends State<_SlideItemBar> {
  List<int> _letterPositionList = new List();
  int _widgetTop = -1;
  int _lastIndex = 0;
  bool _isTouchDown = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _style = widget.textStyle;
    if (_isTouchDown == true) {
      _style = widget.touchDownTextStyle;
    }
    _init();

    List<Widget> children = new List();
    widget.data.forEach((v) {
      children.add(new SizedBox(
        width: widget.width.toDouble(),
        height: widget.itemHeight.toDouble(),
        child: new Text(v, textAlign: TextAlign.center, style: _style),
      ));
    });

    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details) {
        if (_widgetTop == -1) {
          RenderBox box = context.findRenderObject();
          Offset topLeftPosition = box.localToGlobal(Offset.zero);
          _widgetTop = topLeftPosition.dy.toInt();
        }

        int offset = details.globalPosition.dy.toInt() - _widgetTop;
        int index = _getIndex(offset);
        if (index != -1) {
          _lastIndex = index;
          _isTouchDown = true;
          _triggerTouchEvent(widget.data[index]);
        }
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        int offset = details.globalPosition.dy.toInt() - _widgetTop;
        int index = _getIndex(offset);
        if (index != -1 && _lastIndex != index) {
          _lastIndex = index;
          _isTouchDown = true;
          _triggerTouchEvent(widget.data[index]);
        }
      },
      onVerticalDragEnd: (DragEndDetails details) {
        _lastIndex = -1;
        _isTouchDown = false;
        _triggerTouchEvent('');
      },
      onTapUp: (TapUpDetails details) {
        _lastIndex = -1;
        _isTouchDown = false;
        _triggerTouchEvent('');
      },
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  void _init() {
    _letterPositionList.clear();
    _letterPositionList.add(0);
    int tempHeight = 0;
    widget.data?.forEach((value) {
      tempHeight = tempHeight + widget.itemHeight;
      _letterPositionList.add(tempHeight);
    });
  }

  int _getIndex(int offset) {
    for (int i = 0, length = _letterPositionList.length; i < length - 1; i++) {
      int a = _letterPositionList[i];
      int b = _letterPositionList[i + 1];
      if (offset >= a && offset < b) {
        return i;
      }
    }
    return -1;
  }

  _triggerTouchEvent(String letter) {
    if (widget.onTouch != null) {
      widget.onTouch(letter);
    }
  }
}
