// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$currentInstalledAppsAtom =
      Atom(name: 'HomeStoreBase.currentInstalledApps', context: context);

  @override
  List<Application> get currentInstalledApps {
    _$currentInstalledAppsAtom.reportRead();
    return super.currentInstalledApps;
  }

  @override
  set currentInstalledApps(List<Application> value) {
    _$currentInstalledAppsAtom.reportWrite(value, super.currentInstalledApps,
        () {
      super.currentInstalledApps = value;
    });
  }

  late final _$isPopupMenuOpenAtom =
      Atom(name: 'HomeStoreBase.isPopupMenuOpen', context: context);

  @override
  bool get isPopupMenuOpen {
    _$isPopupMenuOpenAtom.reportRead();
    return super.isPopupMenuOpen;
  }

  @override
  set isPopupMenuOpen(bool value) {
    _$isPopupMenuOpenAtom.reportWrite(value, super.isPopupMenuOpen, () {
      super.isPopupMenuOpen = value;
    });
  }

  late final _$getAllAppsAsyncAction =
      AsyncAction('HomeStoreBase.getAllApps', context: context);

  @override
  Future<List<Application>> getAllApps() {
    return _$getAllAppsAsyncAction.run(() => super.getAllApps());
  }

  @override
  String toString() {
    return '''
currentInstalledApps: ${currentInstalledApps},
isPopupMenuOpen: ${isPopupMenuOpen}
    ''';
  }
}
