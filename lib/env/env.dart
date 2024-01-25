import 'package:flutter/foundation.dart' show kDebugMode;
import 'env_debug.dart' as debug;
import 'env_production.dart' as production;

const env = kDebugMode ? debug.env : production.env;
