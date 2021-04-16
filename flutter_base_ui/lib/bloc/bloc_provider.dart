import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() {
    return _BlocProviderState<T>();
  }

  static T of<T extends BaseBloc>(BuildContext context) {
    BlocProvider<T> provider =
    context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  static final String TAG = "_BlocProviderState";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }
}
