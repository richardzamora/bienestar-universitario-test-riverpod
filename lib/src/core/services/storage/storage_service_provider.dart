import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app_bienestar_universitario/src/core/services/storage/hive_storage_service.dart';
import 'package:app_bienestar_universitario/src/core/services/storage/storage_service.dart';

/// Provider that locates an [StorageService] interface to implementation
final storageServiceProvider = Provider<StorageService>(
  (_) => HiveStorageService(),
);
