part of flutter_template;

enum ButtonStatus { idle, loading, success, fail }

class ProgressButtonAnimation extends StatefulWidget {
  final Map<ButtonStatus, Widget> stateWidgets;
  final Map<ButtonStatus, Color> stateColors;
  final Function? onPressed;
  final Function? onAnimationEnd;
  final ButtonStatus? state;
  final minWidth;
  final maxWidth;
  final radius;
  final height;
  final ProgressIndicator? progressIndicator;
  final progressIndicatorSize;
  final MainAxisAlignment progressIndicatorAlignment;
  final EdgeInsets padding;
  final List<ButtonStatus> minWidthStates;

  ProgressButtonAnimation(
      {Key? key,
      required this.stateWidgets,
      required this.stateColors,
      this.state = ButtonStatus.idle,
      this.onPressed,
      this.onAnimationEnd,
      this.minWidth = 200.0,
      this.maxWidth = 400.0,
      this.radius = 16.0,
      this.height = 53.0,
      this.progressIndicatorSize = 35.0,
      this.progressIndicator,
      this.progressIndicatorAlignment = MainAxisAlignment.spaceBetween,
      this.padding = EdgeInsets.zero,
      this.minWidthStates = const <ButtonStatus>[ButtonStatus.loading]})
      : assert(
          stateWidgets != null &&
              stateWidgets.keys
                  .toSet()
                  .containsAll(ButtonStatus.values.toSet()),
          'Must be non-null widgetds provided in map of stateWidgets. Missing keys => ${ButtonStatus.values.toSet().difference(stateWidgets.keys.toSet())}',
        ),
        assert(
          stateColors != null &&
              stateColors.keys.toSet().containsAll(ButtonStatus.values.toSet()),
          'Must be non-null widgetds provided in map of stateWidgets. Missing keys => ${ButtonStatus.values.toSet().difference(stateColors.keys.toSet())}',
        ),
        super(key: key);

  @override
  _ProgressButtonAnimationState createState() =>
      _ProgressButtonAnimationState();

  factory ProgressButtonAnimation.icon({
    required Map<ButtonStatus, StateButton> stateButton,
    Function? onPressed,
    ButtonStatus? state = ButtonStatus.idle,
    Function? animationEnd,
    maxWidth: 170.0,
    minWidth: 58.0,
    height: 53.0,
    radius: 100.0,
    progressIndicatorSize: 35.0,
    double iconPadding: 4.0,
    TextStyle? textStyle,
    CircularProgressIndicator? progressIndicator,
    MainAxisAlignment? progressIndicatorAlignment,
    EdgeInsets padding = EdgeInsets.zero,
    List<ButtonStatus> minWidthStates = const <ButtonStatus>[
      ButtonStatus.loading
    ],
  }) {
    assert(
      stateButton != null &&
          stateButton.keys.toSet().containsAll(ButtonStatus.values.toSet()),
      'Must be non-null widgets provided in map of stateWidgets. Missing keys => ${ButtonStatus.values.toSet().difference(stateButton.keys.toSet())}',
    );

    if (textStyle == null) {
      textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
    }

    Map<ButtonStatus, Widget> stateWidgets = {
      ButtonStatus.idle: buildChildWithIcon(
          stateButton[ButtonStatus.idle]!, iconPadding, textStyle),
      ButtonStatus.loading: Column(),
      ButtonStatus.fail: buildChildWithIcon(
          stateButton[ButtonStatus.fail]!, iconPadding, textStyle),
      ButtonStatus.success: buildChildWithIcon(
          stateButton[ButtonStatus.success]!, iconPadding, textStyle)
    };

    Map<ButtonStatus, Color> stateColors = {
      ButtonStatus.idle: stateButton[ButtonStatus.idle]!.color,
      ButtonStatus.loading: stateButton[ButtonStatus.loading]!.color,
      ButtonStatus.fail: stateButton[ButtonStatus.fail]!.color,
      ButtonStatus.success: stateButton[ButtonStatus.success]!.color,
    };

    return ProgressButtonAnimation(
      stateWidgets: stateWidgets,
      stateColors: stateColors,
      state: state,
      onPressed: onPressed,
      onAnimationEnd: animationEnd,
      maxWidth: maxWidth,
      minWidth: minWidth,
      radius: radius,
      height: height,
      progressIndicatorSize: progressIndicatorSize,
      progressIndicatorAlignment: MainAxisAlignment.center,
      progressIndicator: progressIndicator,
      minWidthStates: minWidthStates,
    );
  }
}

class _ProgressButtonAnimationState extends State<ProgressButtonAnimation>  with TickerProviderStateMixin {

  AnimationController? colorAnimationController;
  Animation<Color?>? colorAnimation;
  double? width;
  Duration animationDuration = Duration(milliseconds: 500);
  Widget? progressIndicator;

  void startAnimations(ButtonStatus? oldState, ButtonStatus? newState) {
    Color? begin = widget.stateColors[oldState!];
    Color? end = widget.stateColors[newState!];
    if (widget.minWidthStates.contains(newState)) {
      width = widget.minWidth;
    } else {
      width = widget.maxWidth;
    }
    colorAnimation = ColorTween(begin: begin, end: end).animate(CurvedAnimation(
      parent: colorAnimationController!,
      curve: Interval(
        0,
        1,
        curve: Curves.easeIn,
      ),
    ));
    colorAnimationController!.forward();
  }

  Color? get backgroundColor => colorAnimation == null
      ? widget.stateColors[widget.state!]
      : colorAnimation!.value ?? widget.stateColors[widget.state!];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    width = widget.maxWidth;

    colorAnimationController =
        AnimationController(duration: animationDuration, vsync: this);
    colorAnimationController!.addStatusListener((status) {
      if (widget.onAnimationEnd != null) {
        widget.onAnimationEnd!(status, widget.state);
      }
    });

    progressIndicator = widget.progressIndicator ??
        CircularProgressIndicator(
            backgroundColor: widget.stateColors[widget.state!],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    colorAnimationController!.dispose();
  }

  @override
  void didUpdateWidget(ProgressButtonAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state) {
      colorAnimationController?.reset();
      startAnimations(oldWidget.state, widget.state);
    }
  }

  Widget getButtonChild(bool visibility) {
    Widget? buttonChild = widget.stateWidgets[widget.state!];
    if (widget.state == ButtonStatus.loading) {
      return Row(
        mainAxisAlignment: widget.progressIndicatorAlignment,
        children: <Widget>[
          SizedBox(
            child: progressIndicator,
            width: widget.progressIndicatorSize,
            height: widget.progressIndicatorSize,
          ),
          buttonChild ?? Container(),
          Container()
        ],
      );
    }
    return AnimatedOpacity(
        opacity: visibility ? 1.0 : 0.0,
        duration: Duration(milliseconds: 250),
        child: buttonChild);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimationController!,
      builder: (context, child) {
        return AnimatedContainer(
            width: width,
            height: widget.height,
            duration: animationDuration,
            child: MaterialButton(
              padding: widget.padding,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  side: BorderSide(color: Colors.transparent, width: 0)),
              color: backgroundColor,
              onPressed: widget.onPressed as void Function()?,
              child: getButtonChild(
                  colorAnimation == null ? true : colorAnimation!.isCompleted),
            ));
      },
    );
  }
}
