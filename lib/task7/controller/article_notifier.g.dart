// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFavoritesHash() => r'e0738540ffb46af26d44ceb4fa82a98e8069bae6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef IsFavoritesRef = AutoDisposeProviderRef<bool>;

/// See also [isFavorites].
@ProviderFor(isFavorites)
const isFavoritesProvider = IsFavoritesFamily();

/// See also [isFavorites].
class IsFavoritesFamily extends Family<bool> {
  /// See also [isFavorites].
  const IsFavoritesFamily();

  /// See also [isFavorites].
  IsFavoritesProvider call({
    required ArticleInfo info,
  }) {
    return IsFavoritesProvider(
      info: info,
    );
  }

  @override
  IsFavoritesProvider getProviderOverride(
    covariant IsFavoritesProvider provider,
  ) {
    return call(
      info: provider.info,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isFavoritesProvider';
}

/// See also [isFavorites].
class IsFavoritesProvider extends AutoDisposeProvider<bool> {
  /// See also [isFavorites].
  IsFavoritesProvider({
    required this.info,
  }) : super.internal(
          (ref) => isFavorites(
            ref,
            info: info,
          ),
          from: isFavoritesProvider,
          name: r'isFavoritesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavoritesHash,
          dependencies: IsFavoritesFamily._dependencies,
          allTransitiveDependencies:
              IsFavoritesFamily._allTransitiveDependencies,
        );

  final ArticleInfo info;

  @override
  bool operator ==(Object other) {
    return other is IsFavoritesProvider && other.info == info;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, info.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$articleNotifierHash() => r'2f8e560f701d5bb39155d458169a403441e358b3';

/// See also [ArticleNotifier].
@ProviderFor(ArticleNotifier)
final articleNotifierProvider =
    AutoDisposeNotifierProvider<ArticleNotifier, List<ArticleInfo>>.internal(
  ArticleNotifier.new,
  name: r'articleNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$articleNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ArticleNotifier = AutoDisposeNotifier<List<ArticleInfo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
