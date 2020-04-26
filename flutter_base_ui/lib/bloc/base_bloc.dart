import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends LoadingBean> {
  static final String TAG = "BaseBloc";

  bool _isInit = false;

  int page = 1;

  bool noMore = true;

  T bean;

  BehaviorSubject<T> _subject = BehaviorSubject<T>();

  Sink<T> get sink => _subject.sink;

  Stream<T> get stream => _subject.stream;

  void initData(BuildContext context);

  Future getData();

  void onReload();

  void firstInit(BuildContext context) async {
    if (_isInit) {
      return;
    }
    _isInit = true;

    initData(context);
  }

  onRefresh() async {
    await getData();

    notifyDataChanged();
  }

  onLoadMore() async {
    await getData();

    notifyDataChanged();
  }

  void dispose() {
    _subject.close();
    sink.close();
  }

  void showLoading() {
    bean.isLoading = true;
    notifyDataChanged();
  }

  void hideLoading() {
    bean.isLoading = false;
    notifyDataChanged();
  }

  void notifyDataChanged() {
    sink.add(bean);
  }
}
