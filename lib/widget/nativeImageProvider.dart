import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import 'package:flutter_app/util/methodChannelUtil.dart';

/// 自定义ImageProvider用于读取原生图片
class NativeImageProvider extends ImageProvider<NativeImageProvider> {
  /// 需要从原生中去加载的图片名称，比如： ic_launcher，不用带后缀
  final String imageName;

  final double scale;

  const NativeImageProvider(this.imageName, {this.scale: 1.0});

  @override
  ImageStreamCompleter load(NativeImageProvider key, DecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key),
      scale: key.scale,
      debugLabel: key.imageName,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<NativeImageProvider>('Image key', key),
        ];
      },
    );
  }

  Future<ui.Codec> _loadAsync(NativeImageProvider key) async {
    String path = await getNativeImage(imageName);
    print(">>>>>>>>>>>>>>>>$path<<<<<<<<<<<<<<<<<<<");
    var file = File(path);
    return await _loadAsyncFromFile(key, file);
  }

  Future<ui.Codec> _loadAsyncFromFile(
      NativeImageProvider key, File file) async {
    assert(key == this);

    final Uint8List bytes = await file.readAsBytes();

    if (bytes.lengthInBytes == 0) {
      throw new Exception("File was empty");
    }
    return await ui.instantiateImageCodec(bytes);
  }

  ///  获取原生图片文件路径
  Future<String> getNativeImage(String imageName) async {
    String path = "";
    try {
      path = await MethodChannelUtil.nativeChannel
          .invokeMethod("image", {'name': '$imageName'});
    } on PlatformException catch (e) {
      print(e.message);
    }
    return path;
  }

  @override
  Future<NativeImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<NativeImageProvider>(this);
  }

  /*@override
  int get hashCode => ui.hashValues(imageName, scale);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType)
      return false;
    return other is NativeImageProvider
        && other.imageName == imageName
        && other.scale == scale;
  }*/
}
