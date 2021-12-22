// Copyright 2022 mathru. All rights reserved.

/// Package that defines a base class for modularization.
///
/// To use, import `package:katana_module/katana_module.dart`.
///
/// [mathru.net]: https://mathru.net
/// [YouTube]: https://www.youtube.com/c/mathrunetchannel
library katana_module;

import 'dart:math';

import "package:flutter/material.dart";
import 'package:katana_routing/katana_routing.dart';
import 'package:model_notifier/model_notifier.dart';

export 'package:katana_module_builder_annotation/katana_module_builder_annotation.dart';
export 'package:katana_routing/katana_routing.dart';
export 'package:model_notifier/model_notifier.dart';

part "src/app_module.dart";
part 'src/condition_module.dart';
part "src/extensions.dart";
part 'src/function_module.dart';
part 'src/menu_config.dart';
part "src/module.dart";
part "src/boot_config.dart";
part "src/page_module.dart";
part 'src/permission.dart';
part "src/local_media.dart";
part "src/role_config.dart";
part "src/ui_module_material_app.dart";
part "src/purchase_product.dart";
part 'src/commerce_platform_status.dart';
part 'src/module_hook.dart';
part 'src/adapter_module.dart';
part 'src/variable_config.dart';

part 'src/reroute/reroute_config.dart';
part 'src/reroute/login_required_reroute_config.dart';
part 'src/reroute/registration_required_reroute_config.dart';
part 'src/reroute/user_document_query_reroute_config.dart';

part 'src/form/form_config.dart';
part 'src/form/text_form_config.dart';
part 'src/form/select_form_config.dart';
part 'src/form/date_time_form_config.dart';
part 'src/form/multiple_text_form_config.dart';
part 'src/form/multiple_select_form_config.dart';

part 'src/adapter/ads_adapter.dart';
part 'src/adapter/dynamic_links_adapter.dart';
part 'src/adapter/location_adapter.dart';
part "src/adapter/platform_adapter.dart";
part "src/adapter/purchase_adapter.dart";
part 'src/adapter/model_adapter.dart';
part 'src/adapter/messaging_adapter.dart';
part 'src/adapter/streaming_adapter.dart';
