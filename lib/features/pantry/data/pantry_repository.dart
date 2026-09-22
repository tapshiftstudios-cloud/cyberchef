import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/enums/scan_mode.dart';
import '../../../services/supabase_bootstrap.dart';
import '../../recipes/domain/models/recipe_models.dart';
import '../domain/models/pantry_scan_record.dart';

class PantryRepository {
  PantryRepository({SupabaseClient? client})
      : _client = client ?? SupabaseBootstrap.client;

  final SupabaseClient? _client;

  bool get isAvailable => _client != null;

  Future<String> saveScan({
    required ScanMode mode,
    required PantryAnalysisResult result,
  }) async {
    final client = _client;
    final userId = client?.auth.currentUser?.id;
    if (client == null) {
      throw const PantryException(
        'Supabase is not configured.',
        type: PantryErrorType.notConfigured,
      );
    }
    if (userId == null) {
      throw const PantryException(
        'Sign in to save pantry history.',
        type: PantryErrorType.notAuthenticated,
      );
    }

    try {
      final row = await client.from('pantry_scans').insert({
        'user_id': userId,
        'mode': mode.apiValue,
        'ingredients': result.ingredients,
        'recipes': result.recipes.map((r) => r.toJson()).toList(),
      }).select('id').single();

      return row['id'] as String;
    } on PostgrestException catch (e) {
      throw PantryException(
        e.message,
        type: PantryErrorType.database,
      );
    }
  }

  Future<List<PantryScanRecord>> fetchHistory({int limit = 50}) async {
    final client = _client;
    final userId = client?.auth.currentUser?.id;
    if (client == null) {
      throw const PantryException(
        'Supabase is not configured.',
        type: PantryErrorType.notConfigured,
      );
    }
    if (userId == null) {
      throw const PantryException(
        'Sign in to view pantry history.',
        type: PantryErrorType.notAuthenticated,
      );
    }

    try {
      final rows = await client
          .from('pantry_scans')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(limit);

      return (rows as List<dynamic>)
          .map((e) => PantryScanRecord.fromJson(e as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw PantryException(
        e.message,
        type: PantryErrorType.database,
      );
    }
  }

  Future<void> deleteScan(String scanId) async {
    final client = _client;
    if (client == null) {
      throw const PantryException(
        'Supabase is not configured.',
        type: PantryErrorType.notConfigured,
      );
    }

    try {
      await client.from('pantry_scans').delete().eq('id', scanId);
    } on PostgrestException catch (e) {
      throw PantryException(
        e.message,
        type: PantryErrorType.database,
      );
    }
  }
}

enum PantryErrorType { notConfigured, notAuthenticated, database, unknown }

class PantryException implements Exception {
  const PantryException(
    this.message, {
    this.type = PantryErrorType.unknown,
  });

  final String message;
  final PantryErrorType type;

  @override
  String toString() => message;
}
