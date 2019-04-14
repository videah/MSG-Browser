import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:frideos_core/frideos_core.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SettingsBloc extends Bloc {
  final cacheSize = StreamedValue<double>();

  SettingsBloc() {
    _refreshCacheSize();
  }

  Future clearCache() async {
    await DiskCache().clear();
    await _refreshCacheSize();
  }

  Future _refreshCacheSize() async {
    double size = await DiskCache().cacheSize() / 1000 / 1000;
    cacheSize.value = size.roundToDouble();
  }

  @override
  void dispose() {
    cacheSize.dispose();
  }
}