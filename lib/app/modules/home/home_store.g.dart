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

  late final _$favoriteAppsAtom =
      Atom(name: 'HomeStoreBase.favoriteApps', context: context);

  @override
  List<ApplicationsEntity> get favoriteApps {
    _$favoriteAppsAtom.reportRead();
    return super.favoriteApps;
  }

  @override
  set favoriteApps(List<ApplicationsEntity> value) {
    _$favoriteAppsAtom.reportWrite(value, super.favoriteApps, () {
      super.favoriteApps = value;
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

  late final _$settingsPackageNameAtom =
      Atom(name: 'HomeStoreBase.settingsPackageName', context: context);

  @override
  String get settingsPackageName {
    _$settingsPackageNameAtom.reportRead();
    return super.settingsPackageName;
  }

  @override
  set settingsPackageName(String value) {
    _$settingsPackageNameAtom.reportWrite(value, super.settingsPackageName, () {
      super.settingsPackageName = value;
    });
  }

  late final _$clockPackageNameAtom =
      Atom(name: 'HomeStoreBase.clockPackageName', context: context);

  @override
  String get clockPackageName {
    _$clockPackageNameAtom.reportRead();
    return super.clockPackageName;
  }

  @override
  set clockPackageName(String value) {
    _$clockPackageNameAtom.reportWrite(value, super.clockPackageName, () {
      super.clockPackageName = value;
    });
  }

  late final _$calculatorPackageNameAtom =
      Atom(name: 'HomeStoreBase.calculatorPackageName', context: context);

  @override
  String get calculatorPackageName {
    _$calculatorPackageNameAtom.reportRead();
    return super.calculatorPackageName;
  }

  @override
  set calculatorPackageName(String value) {
    _$calculatorPackageNameAtom.reportWrite(value, super.calculatorPackageName,
        () {
      super.calculatorPackageName = value;
    });
  }

  late final _$saveFavoriteListAsyncAction =
      AsyncAction('HomeStoreBase.saveFavoriteList', context: context);

  @override
  Future<void> saveFavoriteList({required IsarService isarService}) {
    return _$saveFavoriteListAsyncAction
        .run(() => super.saveFavoriteList(isarService: isarService));
  }

  late final _$getFavoriteAppsAsyncAction =
      AsyncAction('HomeStoreBase.getFavoriteApps', context: context);

  @override
  Future<void> getFavoriteApps({required IsarService isarService}) {
    return _$getFavoriteAppsAsyncAction
        .run(() => super.getFavoriteApps(isarService: isarService));
  }

  late final _$getAllAppsAsyncAction =
      AsyncAction('HomeStoreBase.getAllApps', context: context);

  @override
  Future<List<Application>> getAllApps() {
    return _$getAllAppsAsyncAction.run(() => super.getAllApps());
  }

  late final _$updateInstalledAppsAsyncAction =
      AsyncAction('HomeStoreBase.updateInstalledApps', context: context);

  @override
  Future<void> updateInstalledApps() {
    return _$updateInstalledAppsAsyncAction
        .run(() => super.updateInstalledApps());
  }

  late final _$addFavoritesAsyncAction =
      AsyncAction('HomeStoreBase.addFavorites', context: context);

  @override
  Future<void> addFavorites(
      {required IsarService isarService, required List<Application> newList}) {
    return _$addFavoritesAsyncAction.run(
        () => super.addFavorites(isarService: isarService, newList: newList));
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
  dynamic populateDialer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.populateDialer');
    try {
      return super.populateDialer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic populateCamera() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.populateCamera');
    try {
      return super.populateCamera();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic populateClock() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.populateClock');
    try {
      return super.populateClock();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic populateSettings() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.populateSettings');
    try {
      return super.populateSettings();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic populateCalculator() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.populateCalculator');
    try {
      return super.populateCalculator();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homePageCurrentState: ${homePageCurrentState},
currentInstalledApps: ${currentInstalledApps},
favoriteApps: ${favoriteApps},
backupInstalledApps: ${backupInstalledApps},
cameraPackageName: ${cameraPackageName},
phonePackageName: ${phonePackageName},
settingsPackageName: ${settingsPackageName},
clockPackageName: ${clockPackageName},
calculatorPackageName: ${calculatorPackageName}
    ''';
  }
}
