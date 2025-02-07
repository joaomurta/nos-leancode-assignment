import 'package:flutter/widgets.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

GlobalKey<T> useGlobalKey<T extends State>() => useMemoized(GlobalKey<T>.new);
