import 'package:flutter/material.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:flutter_common_util/flutter_common_util.dart';

typedef OnTouchingLetterChanged = void Function(String letter);

const List<String> _list = const [
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
  final OnTouchingLetterChanged onTouch;
  final int width;
  final int letterHeight;
  final Color color;
  final Color touchDownColor;
  final TextStyle textStyle;
  final TextStyle touchDownTextStyle;

  SideBar(
      {Key key,
      @required this.onTouch,
      this.width: 30,
      this.letterHeight: 18,
      this.color: Colors.transparent,
      this.touchDownColor: const Color(0x40E0E0E0),
      this.textStyle: YZStyle.minSubText,
      this.touchDownTextStyle: YZStyle.minText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SideBarState();
  }
}

class _SideBarState extends State<SideBar> {
  bool _isTouchDown = false;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        _isTouchDown ? widget.touchDownTextStyle : widget.textStyle;

    return Container(
      alignment: Alignment.center,
      color: _isTouchDown ? widget.touchDownColor : widget.color,
      width: widget.width.toDouble(),
      child: _SideBarItem(
          textStyle: textStyle,
          width: widget.width,
          letterHeight: widget.letterHeight,
          onTouch: (letter) {
            if (widget.onTouch != null) {
              setState(() {
                _isTouchDown = !TextUtil.isEmpty(letter);
              });
              widget.onTouch(letter);
            }
          }),
    );
  }
}

class _SideBarItem extends StatefulWidget {
  final TextStyle textStyle;
  final int width;
  final int letterHeight;
  final OnTouchingLetterChanged onTouch;

  _SideBarItem({this.textStyle, this.width, this.letterHeight, this.onTouch});

  @override
  State<StatefulWidget> createState() {
    return _SideBarItemState();
  }
}

class _SideBarItemState extends State<_SideBarItem> {
  List<int> _letterPositionList = List();
  int _widgetTop = -1;
  int _lastIndex = 0;

  double _height = 0;

  @override
  void initState() {
    super.initState();
    _height = _list.length * widget.letterHeight.toDouble();
    _initPosition();
  }

  @override
  Widget build(BuildContext context) {
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
          _triggerLetterChange(_list[index]);
        }
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        int offset = details.globalPosition.dy.toInt() - _widgetTop;
        int index = _getIndex(offset);
        if (index != -1 && _lastIndex != index) {
          _lastIndex = index;
          _triggerLetterChange(_list[index]);
        }
      },
      onVerticalDragEnd: (DragEndDetails details) {
        _lastIndex = -1;
        _triggerLetterChange('');
      },
      child: CustomPaint(
        painter: _SideBarPainter(
            widget.textStyle, widget.width, widget.letterHeight),
        size: Size(widget.width.toDouble(), _height),
      ),
    );
  }

  void _initPosition() {
    _letterPositionList.clear();
    _letterPositionList.add(0);
    int tempHeight = 0;
    _list?.forEach((value) {
      tempHeight = tempHeight + widget.letterHeight;
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

  _triggerLetterChange(String letter) {
    if (widget.onTouch != null) {
      widget.onTouch(letter);
    }
  }
}

class _SideBarPainter extends CustomPainter {
  final TextStyle textStyle;
  final int width;
  final int height;

  TextPainter _textPainter;

  _SideBarPainter(this.textStyle, this.width, this.height) {
    _textPainter = new TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    int length = _list.length;

    for (int i = 0; i < length; i++) {
      _textPainter.text = new TextSpan(
        text: _list[i],
        style: textStyle,
      );

      _textPainter.layout();
      _textPainter.paint(
          canvas, Offset(width.toDouble() / 2, i * height.toDouble()));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
