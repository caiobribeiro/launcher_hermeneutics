// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$homePageCurrentStateAtom =
      Atom(name: 'HomeStoreBase.homePageCurrentState', context: context);

  @override
  HomePageCurrentState get homePageCurrentState {
    _$homePageCurrentStateAtom.reportRead();
    return super.homePageCurrentState;
  }

  @override
  set homePageCurrentState(HomePageCurrentState value) {
    _$homePageCurrentStateAtom.reportWrite(value, super.homePageCurrentState,
        () {
      super.homePageCurrentState = value;
    });
  }

  late final _$isPopUpMenuOpenAtom =
      Atom(name: 'HomeStoreBase.isPopUpMenuOpen', context: context);

  @override
  bool get isPopUpMenuOpen {
    _$isPopUpMenuOpenAtom.reportRead();
    return super.isPopUpMenuOpen;
  }

  @override
  set isPopUpMenuOpen(bool value) {
    _$isPopUpMenuOpenAtom.reportWrite(value, super.isPopUpMenuOpen, () {
      super.isPopUpMenuOpen = value;
    });
  }

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

  late final _$backupInstalledAppsAtom =
      Atom(name: 'HomeStoreBase.backupInstalledApps', context: context);

  @override
  List<Application> get backupInstalledApps {
    _$backupInstalledAppsAtom.reportRead();
    return super.backupInstalledApps;
  }

  @override
  set backupInstalledApps(List<Application> value) {
    _$backupInstalledAppsAtom.reportWrite(value, super.backupInstalledApps, () {
      super.backupInstalledApps = value;
    });
  }

  late final _$cameraPackageNameAtom =
      Atom(name: 'HomeStoreBase.cameraPackageName', context: context);

  @override
  String get cameraPackageName {
    _$cameraPackageNameAtom.reportRead();
    return super.cameraPackageName;
  }

  @override
  set cameraPackageName(String value) {
    _$cameraPackageNameAtom.reportWrite(value, super.cameraPackageName, () {
      super.cameraPackageName = value;
    });
  }

  late final _$phonePackageNameAtom =
      Atom(name: 'HomeStoreBase.phonePackageName', context: context);

  @override
  String get phonePackageName {
    _$phonePackageNameAtom.reportRead();
    return super.phonePackageName;
  }

  @override
  set phonePackageName(String value) {
    _$phonePackageNameAtom.reportWrite(value, super.phonePackageName, () {
      super.phonePackageName = value;
    });
  }

  late final _$getAllAppsAsyncAction =
      AsyncAction('HomeStoreBase.getAllApps', context: context);

  @override
  ObservableFuture<List<Application>> getAllApps() {
    return ObservableFuture<List<Application>>(
        _$getAllAppsAsyncAction.run(() => super.getAllApps()));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void updateHomeStateTo({required HomePageCurrentState newHomeState}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.updateHomeStateTo');
    try {
      return super.updateHomeStateTo(newHomeState: newHomeState);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetInstalledApps() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetInstalledApps');
    try {
      return super.resetInstalledApps();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homePageCurrentState: ${homePageCurrentState},
isPopUpMenuOpen: ${isPopUpMenuOpen},
currentInstalledApps: ${currentInstalledApps},
backupInstalledApps: ${backupInstalledApps},
cameraPackageName: ${cameraPackageName},
phonePackageName: ${phonePackageName}
    ''';
  }
}
