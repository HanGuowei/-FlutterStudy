// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSharedPreferencesHash() =>
    r'fc65521645dd8c2256f5c2378936f7213079deec';

/// See also [getSharedPreferences].
@ProviderFor(getSharedPreferences)
final getSharedPreferencesProvider =
    AutoDisposeFutureProvider<SharedPreferences>.internal(
  getSharedPreferences,
  name: r'getSharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSharedPreferencesRef
    = AutoDisposeFutureProviderRef<SharedPreferences>;
String _$getTasksCategoriesHash() =>
    r'879f9f8d7e117868c6d1113ad5a8e6630117f889';

/// See also [getTasksCategories].
@ProviderFor(getTasksCategories)
final getTasksCategoriesProvider = AutoDisposeProvider<Set<String>>.internal(
  getTasksCategories,
  name: r'getTasksCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTasksCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTasksCategoriesRef = AutoDisposeProviderRef<Set<String>>;
String _$getFilterTasksHash() => r'cc7d30f66481f6408f6181374891526b9e04cd19';

/// See also [getFilterTasks].
@ProviderFor(getFilterTasks)
final getFilterTasksProvider = AutoDisposeProvider<List<Task>>.internal(
  getFilterTasks,
  name: r'getFilterTasksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFilterTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFilterTasksRef = AutoDisposeProviderRef<List<Task>>;
String _$tasksHash() => r'311ef71d9b17df2929489b0ff05caf060422cf30';

/// See also [Tasks].
@ProviderFor(Tasks)
final tasksProvider = AutoDisposeNotifierProvider<Tasks, List<Task>>.internal(
  Tasks.new,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Tasks = AutoDisposeNotifier<List<Task>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
