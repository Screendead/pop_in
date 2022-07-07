import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CoolBox extends StatefulWidget {
  const CoolBox({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<CoolBox> createState() => _CoolBoxState();
}

class _CoolBoxState extends State<CoolBox> {
  double scale = 0.65;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (!mounted) return;

        setState(() {
          scale = 1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOut;

    return AnimatedRotation(
      duration: duration,
      curve: curve,
      turns: scale,
      child: AnimatedSlide(
        duration: duration,
        curve: curve,
        offset: Offset(scale - 1, scale - 1),
        child: AnimatedScale(
          duration: duration,
          curve: curve,
          scale: scale,
          child: ColoredBox(
            color: Colors.primaries[widget.index % Colors.primaries.length],
          ),
        ),
      ),
    );
  }
}
