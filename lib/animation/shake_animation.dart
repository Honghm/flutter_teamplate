part of flutter_template;

class ShakeAnimation extends StatefulWidget {
  final StreamController<ErrorAnimationType> shakeController;
  final Widget child;
  final Duration duration;
  final Function()? shakeEnd;
  const ShakeAnimation({
    Key? key,
    required this.shakeController,
    required this.child,
    this.shakeEnd,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _ShakeAnimationState createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late StreamSubscription<ErrorAnimationType> _animationSubscription;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(.1, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        widget.shakeEnd!();
      }
    });
    _animationSubscription = widget.shakeController.stream.listen((animation) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animationSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}
