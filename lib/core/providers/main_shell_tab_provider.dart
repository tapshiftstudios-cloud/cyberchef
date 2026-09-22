import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bottom nav index for [MainShell]: 0 Scan, 1 Freshness, 2 Shopping.
final mainShellTabIndexProvider = StateProvider<int>((ref) => 0);
