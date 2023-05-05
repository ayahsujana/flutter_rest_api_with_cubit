import 'package:flutter/material.dart';

class AnimatedContent extends StatefulWidget {
  final Widget child;
  final bool show;

  const AnimatedContent({super.key, required this.child, this.show = false});

  @override
  AnimatedContentState createState() => AnimatedContentState();
}

class AnimatedContentState extends State<AnimatedContent>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationSlideUp;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));

    animationSlideUp =
        Tween(begin: const Offset(0.0, 5.0), end: const Offset(0.0, 0.0))
            .animate(CurvedAnimation(
                parent: animationController, curve: Curves.decelerate));

    if (widget.show) {
      animationController.forward();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedContent oldWidget) {
    if (widget != oldWidget) {
      if (widget.show && !oldWidget.show) {
        animationController.forward(from: 0.0);
      } else if (!widget.show) {
        animationController.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationSlideUp,
      child: FadeTransition(
        opacity: animationController,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
