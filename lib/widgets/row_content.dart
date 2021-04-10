import 'package:flutter/material.dart';

class RowContent extends StatefulWidget {
  final VoidCallback onCompleted;

  const RowContent({Key key, this.onCompleted}) : super(key: key);

  @override
  State<RowContent> createState() => _RowContentState();
}

class _RowContentState extends State<RowContent>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _widthAnimation;
  Animation<Color> _colorAnimation;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..addListener(() {
            setState(() {});
          })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onCompleted();
    });
    _widthAnimation = Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0, 0.8, curve: Curves.ease)));
    _colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.green)
        .animate(CurvedAnimation(
            parent: _controller, curve: Interval(0, 0.8, curve: Curves.ease)));
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.8, 1, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: Column(
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(
              color: Color(0xff333333),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                'Some action:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 32,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      color: Colors.black.withOpacity(0.05),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.file_copy,
                            size: 16,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 1,
                            color: Colors.black.withOpacity(0.25),
                            height: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('LoremIpsum.txt')
                        ],
                      ),
                    ),
                    Container(
                      height: 32,
                      width: _widthAnimation.value,
                      color: _colorAnimation.value,
                      child: Center(
                        child: Transform.scale(
                          scale: _opacityAnimation.value,
                          child: Opacity(
                            opacity: _opacityAnimation.value,
                            child: Text(
                              'Success',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  _controller.forward();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Upload',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
