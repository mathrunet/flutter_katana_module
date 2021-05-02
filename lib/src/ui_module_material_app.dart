part of katana_module;

/// Widget which extended [MaterialApp] for Path.
class UIModuleMaterialApp extends StatelessWidget {
  /// Widget which extended [MaterialApp] for Path.
  const UIModuleMaterialApp({
    Key? key,
    this.widgetTheme = const WidgetTheme(),
    this.flavor = "",
    this.home,
    this.navigatorKey,
    this.routes = const <String, RouteConfig>{},
    this.initialRoute = "/",
    this.navigatorObservers = const <NavigatorObserver>[],
    this.title = "",
    this.onGenerateTitle,
    this.onUnknownRoute,
    this.onBootRoute,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.builder,
    this.debugShowCheckedModeBanner = true,
    this.minTextScaleFactor = 0.8,
    this.maxTextScaleFactor = 1.2,
    this.moduleConfigs = const [],
    this.moduleAdapter,
  }) : super(key: key);

  final String flavor;
  final double minTextScaleFactor;
  final double maxTextScaleFactor;
  final WidgetBuilder? home;
  final Widget Function(BuildContext, Widget?)? builder;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Map<String, RouteConfig> routes;
  final String initialRoute;
  final List<NavigatorObserver> navigatorObservers;
  final String title;
  final RouteFactory? onGenerateTitle;
  final RouteConfig? onUnknownRoute;
  final RouteConfig? onBootRoute;
  final List<ModuleConfig> moduleConfigs;
  final Color? color;
  final ThemeColor? theme;
  final ThemeColor? darkTheme;
  final ThemeMode themeMode;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
      localeListResolutionCallback;
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final WidgetTheme widgetTheme;
  final ModuleAdapter? moduleAdapter;

  @override
  Widget build(BuildContext context) {
    final moduleConfig = ModuleConfig._merge(moduleConfigs);
    return ModuleAdapterScope(
      adapter: moduleAdapter,
      child: UIMaterialApp(
        key: key,
        widgetTheme: moduleConfig?.widgetTheme ?? widgetTheme,
        flavor: flavor,
        home: home,
        navigatorKey: navigatorKey,
        routes: routes.merge(moduleConfig?.routeSettings),
        initialRoute: moduleConfig?.initialRoute ?? initialRoute,
        navigatorObservers: navigatorObservers,
        title: moduleConfig?.title ?? title,
        onGenerateTitle: onGenerateTitle,
        onUnknownRoute: moduleConfig?.unknownSettings ?? onUnknownRoute,
        onBootRoute: moduleConfig?.bootSettings ?? onBootRoute,
        color: color,
        theme: moduleConfig?.themeColor ?? theme,
        darkTheme: moduleConfig?.themeColor ?? darkTheme,
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        supportedLocales: supportedLocales,
        debugShowMaterialGrid: debugShowMaterialGrid,
        showPerformanceOverlay: showPerformanceOverlay,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        showSemanticsDebugger: showSemanticsDebugger,
        builder: builder,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        minTextScaleFactor: minTextScaleFactor,
        maxTextScaleFactor: maxTextScaleFactor,
      ),
    );
  }
}

/// Widget to get the module adapter.
///
/// You can get the widget with [ModuleAdapterScope.of(context)].
class ModuleAdapterScope extends InheritedWidget {
  /// Widget to get the module adapter.
  ///
  /// You can get the widget with [ModuleAdapterScope.of(context)].
  const ModuleAdapterScope({
    Key? key,
    required this.adapter,
    required Widget child,
  }) : super(key: key, child: child);

  /// Get ModuleAdapterScope.
  ///
  /// You can check the current ModuleAdapter setting.
  static ModuleAdapterScope of(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<ModuleAdapterScope>()!
        .widget as ModuleAdapterScope;
  }

  /// Flavor.
  final ModuleAdapter? adapter;

  /// Whether the framework should notify widgets that inherit from this widget.
  ///
  /// When widget: widget, sometimes we need to rebuild the widgets that inherit from widget: widget,
  /// if the data held by widget: widget, then we do not need to rebuild the widgets that inherited the data held by oldWidget.
  ///
  /// The framework distinguishes these cases by calling this function with the widget that previously occupied this location in the tree as an argument.
  /// The given widget is guaranteed to have the same [runtimeType] as this object.
  @override
  bool updateShouldNotify(ModuleAdapterScope oldWidget) {
    return true;
  }
}
