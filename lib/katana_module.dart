// Copyright 2021 mathru. All rights reserved.

/// Package that defines a base class for modularization.
///
/// To use, import `package:katana_module/katana_module.dart`.
///
/// [mathru.net]: https://mathru.net
/// [YouTube]: https://www.youtube.com/c/mathrunetchannel
library katana_module;

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:katana/katana.dart';
import "package:flutter/material.dart";
import 'package:katana_routing/katana_routing.dart';
import 'package:model_notifier/model_notifier.dart';
export 'package:katana_routing/katana_routing.dart';
export 'package:model_notifier/model_notifier.dart';
export 'package:katana_module_builder_annotation/katana_module_builder_annotation.dart';

part "src/app_module.dart";
part "src/page_module.dart";
part 'src/menu_config.dart';
part "src/ui_module_material_app.dart";
part "src/module.dart";
part "src/extensions.dart";
part 'src/model_adapter.dart';
part "src/platform_adapter.dart";
part "src/role_config.dart";
part 'src/permission.dart';
