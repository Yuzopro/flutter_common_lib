import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';
import 'package:flutter_base_ui/bloc/page_type.dart';
import 'package:rxdart/rxdart.dart';

class StatusEvent {
  final int page;
  final bool noMore;
  final PageType type;

  StatusEvent(this.page, this.noMore, this.type);
}


abstract class BaseBloc<T extends LoadingBean> {
  static final String TAG = "BaseBloc";

  int page = 1;

  bool noMore = true;

  T bean;

  BehaviorSubject<T> _subject = BehaviorSubject<T>();

  Sink<T> get sink => _subject.sink;

  Stream<T> get stream => _subject.stream;

  BehaviorSubject<StatusEvent> _statusSubject = BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get statusSink => _statusSubject.sink;

  Stream<StatusEvent> get statusStream =>
      _statusSubject.stream.asBroadcastStream();

  void initData(BuildContext context);

  PageType getPageType();

  Future getData();

  void onReload();

  void onRefresh() async {
    await getData();
    refreshStatusEvent();
  }

  void onLoadMore() async {
    await getData();
    refreshStatusEvent();
  }

  void dispose() {
    _subject.close();
    sink.close();
    _statusSubject.close();
    statusSink.close();
  }

  void refreshStatusEvent() {
    statusSink.add(StatusEvent(page, noMore, getPageType()));
  }

  void showLoading() {
    bean.isLoading = true;
    sink.add(bean);
  }

  void hideLoading() {
    bean.isLoading = false;
    sink.add(bean);
  }
}
