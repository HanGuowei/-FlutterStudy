// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSharedPreferencesHash() =>
    r'befc7142223700c3bd24912abdda106644b2ea63';

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
String _$favoriteArticlesHash() => r'a2c848b6873509a7ac33fed7a6808932ff30ec4a';

/// See also [FavoriteArticles].
@ProviderFor(FavoriteArticles)
final favoriteArticlesProvider =
    AutoDisposeNotifierProvider<FavoriteArticles, List<ArticleInfo>>.internal(
  FavoriteArticles.new,
  name: r'favoriteArticlesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteArticlesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteArticles = AutoDisposeNotifier<List<ArticleInfo>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
