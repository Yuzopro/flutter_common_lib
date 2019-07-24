import 'package:flutter_base_ui/bloc/base_bloc.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';

abstract class BaseListBloc<T> extends BaseBloc<LoadingBean<List<T>>> {
  LoadingBean<List<T>> bean;

  BaseListBloc() {
    bean = new LoadingBean(isLoading: false, data: []);
  }

  void onRefresh() async {
    page = 1;
    super.onRefresh();
  }

  void onLoadMore() async {
    page++;
    super.onLoadMore();
  }
}
