part of katana_module;

@immutable
class _WidgetRefNavigatorContainer implements NavigatorState {
  const _WidgetRefNavigatorContainer(
    NavigatorState navigator,
    WidgetRef ref,
  )   : _navigator = navigator,
        _ref = ref;
  final NavigatorState _navigator;
  final WidgetRef _ref;

  @override
  void activate() {
    _navigator.activate();
  }

  @override
  RestorationBucket? get bucket => _navigator.bucket;

  @override
  Widget build(BuildContext context) {
    return _navigator.build(context);
  }

  @override
  bool canPop() {
    return _navigator.canPop();
  }

  @override
  BuildContext get context => _navigator.context;

  @override
  Ticker createTicker(TickerCallback onTick) {
    return _navigator.createTicker(onTick);
  }

  @override
  void deactivate() {
    _navigator.deactivate();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    _navigator.debugFillProperties(properties);
  }

  @override
  void didChangeDependencies() {
    _navigator.didChangeDependencies();
  }

  @override
  void didStartUserGesture() {
    _navigator.didStartUserGesture();
  }

  @override
  void didStopUserGesture() {
    _navigator.didStopUserGesture();
  }

  @override
  void didToggleBucket(RestorationBucket? oldBucket) {
    _navigator.didToggleBucket(oldBucket);
  }

  @override
  void didUpdateRestorationId() {
    _navigator.didUpdateRestorationId();
  }

  @override
  void didUpdateWidget(covariant Navigator oldWidget) {
    _navigator.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _navigator.dispose();
  }

  @override
  void finalizeRoute(Route route) {
    _navigator.finalizeRoute(route);
  }

  @override
  FocusScopeNode get focusScopeNode => _navigator.focusScopeNode;

  @override
  void initState() {
    _navigator.initState();
  }

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) {
    return _navigator.maybePop<T>(result);
  }

  @override
  bool get mounted => _navigator.mounted;

  @override
  OverlayState? get overlay => _navigator.overlay;

  @override
  void pop<T extends Object?>([T? result]) {
    return _navigator.pop<T>(result);
  }

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.popAndPushNamed<T, TO>(
      _ref.applyModuleTag(routeName),
      result: result,
      arguments: arguments,
    );
  }

  @override
  void popUntil(RoutePredicate predicate) {
    _navigator.popUntil(predicate);
  }

  @override
  Future<T?> push<T extends Object?>(Route<T> route) {
    return _navigator.push<T>(route);
  }

  @override
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) {
    return _navigator.pushAndRemoveUntil<T>(newRoute, predicate);
  }

  @override
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator.pushNamed<T>(
      _ref.applyModuleTag(routeName),
      arguments: arguments,
    );
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return _navigator.pushNamedAndRemoveUntil<T>(
      _ref.applyModuleTag(newRouteName),
      predicate,
    );
  }

  @override
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return _navigator.pushReplacement<T, TO>(newRoute, result: result);
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.pushReplacementNamed<T, TO>(
      _ref.applyModuleTag(routeName),
      result: result,
      arguments: arguments,
    );
  }

  @override
  void reassemble() {
    _navigator.reassemble();
  }

  @override
  void registerForRestoration(
    RestorableProperty<Object?> property,
    String restorationId,
  ) {
    _navigator.registerForRestoration(property, restorationId);
  }

  @override
  void removeRoute(Route route) {
    _navigator.removeRoute(route);
  }

  @override
  void removeRouteBelow(Route anchorRoute) {
    _navigator.removeRouteBelow(anchorRoute);
  }

  @override
  void replace<T extends Object?>({
    required Route oldRoute,
    required Route<T> newRoute,
  }) {
    _navigator.replace<T>(oldRoute: oldRoute, newRoute: newRoute);
  }

  @override
  void replaceRouteBelow<T extends Object?>({
    required Route anchorRoute,
    required Route<T> newRoute,
  }) {
    return _navigator.replaceRouteBelow<T>(
        anchorRoute: anchorRoute, newRoute: newRoute);
  }

  @override
  String restorablePopAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.restorablePopAndPushNamed<T, TO>(
      _ref.applyModuleTag(routeName),
      result: result,
      arguments: arguments,
    );
  }

  @override
  String restorablePush<T extends Object?>(
    RestorableRouteBuilder<T> routeBuilder, {
    Object? arguments,
  }) {
    return _navigator.restorablePush<T>(routeBuilder, arguments: arguments);
  }

  @override
  String restorablePushAndRemoveUntil<T extends Object?>(
    RestorableRouteBuilder<T> newRouteBuilder,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return _navigator.restorablePushAndRemoveUntil<T>(
      newRouteBuilder,
      predicate,
      arguments: arguments,
    );
  }

  @override
  String restorablePushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator.restorablePushNamed<T>(
      _ref.applyModuleTag(routeName),
      arguments: arguments,
    );
  }

  @override
  String restorablePushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return _navigator.restorablePushNamedAndRemoveUntil<T>(
      _ref.applyModuleTag(newRouteName),
      predicate,
      arguments: arguments,
    );
  }

  @override
  String restorablePushReplacement<T extends Object?, TO extends Object?>(
    RestorableRouteBuilder<T> routeBuilder, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.restorablePushReplacement<T, TO>(
      routeBuilder,
      result: result,
      arguments: arguments,
    );
  }

  @override
  String restorablePushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.restorablePushReplacementNamed<T, TO>(
      _ref.applyModuleTag(routeName),
      result: result,
      arguments: arguments,
    );
  }

  @override
  String restorableReplace<T extends Object?>({
    required Route oldRoute,
    required RestorableRouteBuilder<T> newRouteBuilder,
    Object? arguments,
  }) {
    return _navigator.restorableReplace<T>(
      oldRoute: oldRoute,
      newRouteBuilder: newRouteBuilder,
      arguments: arguments,
    );
  }

  @override
  String restorableReplaceRouteBelow<T extends Object?>({
    required Route anchorRoute,
    required RestorableRouteBuilder<T> newRouteBuilder,
    Object? arguments,
  }) {
    return _navigator.restorableReplaceRouteBelow<T>(
        anchorRoute: anchorRoute,
        newRouteBuilder: newRouteBuilder,
        arguments: arguments);
  }

  @override
  String? get restorationId => _navigator.restorationId;

  @override
  bool get restorePending => _navigator.restorePending;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    _navigator.restoreState(oldBucket, initialRestore);
  }

  @override
  void setState(VoidCallback fn) {
    _navigator.setState(fn);
  }

  @override
  DiagnosticsNode toDiagnosticsNode({
    String? name,
    DiagnosticsTreeStyle? style,
  }) {
    return _navigator.toDiagnosticsNode(name: name, style: style);
  }

  @override
  String toStringShort() {
    return _navigator.toStringShort();
  }

  @override
  void unregisterFromRestoration(RestorableProperty<Object?> property) {
    _navigator.unregisterFromRestoration(property);
  }

  @override
  bool get userGestureInProgress => _navigator.userGestureInProgress;

  @override
  ValueNotifier<bool> get userGestureInProgressNotifier =>
      _navigator.userGestureInProgressNotifier;

  @override
  Navigator get widget => _navigator.widget;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return _navigator.toString(minLevel: minLevel);
  }
}
