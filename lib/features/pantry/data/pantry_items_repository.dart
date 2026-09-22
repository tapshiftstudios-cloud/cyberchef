import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/supabase_bootstrap.dart';
import '../domain/models/pantry_item.dart';

class PantryItemsRepository {
  PantryItemsRepository({SupabaseClient? client})
      : _client = client ?? SupabaseBootstrap.client;

  final SupabaseClient? _client;

  bool get isAvailable => _client != null;

  /// Yerel id → Supabase uuid eşlemesi.
  Future<Map<String, String>> insertItems(List<PantryItem> items) async {
    final client = _client;
    final userId = client?.auth.currentUser?.id;
    if (client == null) {
      throw const PantryItemsException(
        'Supabase is not configured.',
        type: PantryItemsErrorType.notConfigured,
      );
    }
    if (userId == null) {
      throw const PantryItemsException(
        'Sign in to sync pantry items.',
        type: PantryItemsErrorType.notAuthenticated,
      );
    }

    final idMap = <String, String>{};
    try {
      for (final item in items) {
        final row = await client
            .from('pantry_items')
            .insert(item.toSupabaseInsert(userId))
            .select('id')
            .single();
        idMap[item.id] = row['id'] as String;
      }
      return idMap;
    } on PostgrestException catch (e) {
      throw PantryItemsException(
        e.message,
        type: PantryItemsErrorType.database,
      );
    }
  }

  Future<List<PantryItem>> fetchActive({int limit = 100}) async {
    final client = _client;
    final userId = client?.auth.currentUser?.id;
    if (client == null) {
      throw const PantryItemsException(
        'Supabase is not configured.',
        type: PantryItemsErrorType.notConfigured,
      );
    }
    if (userId == null) {
      throw const PantryItemsException(
        'Sign in to load pantry items.',
        type: PantryItemsErrorType.notAuthenticated,
      );
    }

    try {
      final rows = await client
          .from('pantry_items')
          .select()
          .eq('user_id', userId)
          .eq('is_consumed', false)
          .order('purchase_date', ascending: false)
          .limit(limit);

      return (rows as List<dynamic>)
          .map((e) => PantryItem.fromSupabaseRow(e as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw PantryItemsException(
        e.message,
        type: PantryItemsErrorType.database,
      );
    }
  }

  Future<void> updateItem(PantryItem item) async {
    final client = _client;
    if (client == null) {
      throw const PantryItemsException(
        'Supabase is not configured.',
        type: PantryItemsErrorType.notConfigured,
      );
    }

    try {
      await client
          .from('pantry_items')
          .update(item.toSupabaseUpdate())
          .eq('id', item.id);
    } on PostgrestException catch (e) {
      throw PantryItemsException(
        e.message,
        type: PantryItemsErrorType.database,
      );
    }
  }

  Future<void> markConsumed(String itemId) async {
    final client = _client;
    if (client == null) {
      throw const PantryItemsException(
        'Supabase is not configured.',
        type: PantryItemsErrorType.notConfigured,
      );
    }

    try {
      await client.from('pantry_items').update({
        'is_consumed': true,
        'consumed_at': DateTime.now().toUtc().toIso8601String(),
      }).eq('id', itemId);
    } on PostgrestException catch (e) {
      throw PantryItemsException(
        e.message,
        type: PantryItemsErrorType.database,
      );
    }
  }
}

enum PantryItemsErrorType { notConfigured, notAuthenticated, database, unknown }

class PantryItemsException implements Exception {
  const PantryItemsException(
    this.message, {
    this.type = PantryItemsErrorType.unknown,
  });

  final String message;
  final PantryItemsErrorType type;

  @override
  String toString() => message;
}
