// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFavoritesHash() => r'f735895c809f00b0d52aa50e43dcea68b71ad38b';

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
    required ArticleInfo info,
  }) : this._internal(
          (ref) => isFavorites(
            ref as IsFavoritesRef,
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
          info: info,
        );

  IsFavoritesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.info,
  }) : super.internal();

  final ArticleInfo info;

  @override
  Override overrideWith(
    bool Function(IsFavoritesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavoritesProvider._internal(
        (ref) => create(ref as IsFavoritesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        info: info,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFavoritesProviderElement(this);
  }

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

mixin IsFavoritesRef on AutoDisposeProviderRef<bool> {
  /// The parameter `info` of this provider.
  ArticleInfo get info;
}

class _IsFavoritesProviderElement extends AutoDisposeProviderElement<bool>
    with IsFavoritesRef {
  _IsFavoritesProviderElement(super.provider);

  @override
  ArticleInfo get info => (origin as IsFavoritesProvider).info;
}

String _$articleNotifierHash() => r'4d31db014e5dc4392b859542941cc0e6b8f8ca9a';

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
