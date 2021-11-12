part of katana_module;

@immutable
abstract class RerouteConfig {
  const RerouteConfig();
  Map<String, bool Function(BuildContext context)> get value;

  static RerouteConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("type")) {
      return null;
    }
    switch (map.get("type", "")) {
      case "loginRequired":
        return LoginRequiredRerouteConfig._fromMap(map);
      case "userDocumentQuery":
        return UserDocumentQueryRerouteConfig._fromMap(map);
    }
  }

  /// Convert the reroute config to [DynamicMap].
  DynamicMap toMap();
}

class LoginRequiredRerouteConfig extends RerouteConfig {
  const LoginRequiredRerouteConfig({
    this.routePath = "/landing",
  });

  final String routePath;

  @override
  Map<String, bool Function(BuildContext context)> get value => {
        routePath: (context) {
          return !(context.model?.isSignedIn ?? true);
        },
      };

  static LoginRequiredRerouteConfig? _fromMap(DynamicMap map) {
    return LoginRequiredRerouteConfig(
      routePath: map.get("path", "/landing"),
    );
  }

  /// Convert the reroute config to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": "loginRequired",
      "path": routePath,
    };
  }
}

class UserDocumentQueryRerouteConfig extends RerouteConfig {
  const UserDocumentQueryRerouteConfig({
    this.routePath = "/landing",
    required this.query,
  });

  final String routePath;
  final ModelQuery query;

  @override
  Map<String, bool Function(BuildContext context)> get value => {
        routePath: (context) {
          final provider = context.model?.documentProvider(query.path);
          if (provider == null) {
            return false;
          }
          final doc = read(provider);
          return query.check(doc);
        },
      };

  static UserDocumentQueryRerouteConfig? _fromMap(DynamicMap map) {
    final query = map.getAsMap("query").toModelQuery();
    if (query == null) {
      return null;
    }
    return UserDocumentQueryRerouteConfig(
      query: query,
      routePath: map.get("path", "/landing"),
    );
  }

  /// Convert the reroute config to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": "userDocumentQuery",
      "query": query.toMap(),
      "path": routePath,
    };
  }
}
