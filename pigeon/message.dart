import 'package:pigeon/pigeon.dart';

// ------------------------------------- 定义数据类型 -------------------------------------
class Book {
  //Pigeon数据类中的字段不支持初始化
  //所以只能使用 nullable 类型，即默认值都是 null
  String? title;
  Author? author; // 支持嵌套类
}

class Author {
  String? name;
  bool? male;
  StateEnum? state; // 支持枚举
}

enum StateEnum { success, error, unknown }

// ------------------------------------- 定义 native 方法 -------------------------------------

// 使用注解 @HostApi 修饰的类，是在 native 中实现的，可以被 flutter 调用的方法
@HostApi()
abstract class NativeApi {

  bool saveBook(Book book);

  // 支持可为空的参数或返回值
  Book? searchBook(String keyword);

  // 也支持不可为空的参数或返回值
  List<Book> searchBooks(String keyword);

  // 虽然定义的泛型参数 <String?> 可为空，但生产的代码仍是不可为空的
  List<Book?> searchBooks2(List<String?> keys);

  void noArguments();

  //默认生成同步的 handlers，可以使用 @async 注解异步响应消息
  @async
  String getSomething();

  //任务队列，当使用支持TaskQueue API的Flutter版本时，可以使用 @TaskQueue 注解选择用于处理HostApi方法的线程模型
  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  int add(int a, int b);
}

// ------------------------------------- 定义 Flutter 方法 -------------------------------------

// 使用注解 @FlutterApi 修饰的类，是在 flutter 中实现的，可以被 native 调用的方法
@FlutterApi()
abstract class MyFlutterApi {
  String getAppVersion();
}
