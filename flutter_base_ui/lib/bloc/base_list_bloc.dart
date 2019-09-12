import 'package:flutter_base_ui/bloc/base_bloc.dart';
import 'package:flutter_base_ui/bloc/loading_bean.dart';

abstract class BaseListBloc<T> extends BaseBloc<LoadingBean<List<T>>> {
  BaseListBloc() {
    bean = new LoadingBean(isLoading: false, data: []);
  }

  onRefresh() async {
    page = 1;
    await super.onRefresh();
  }

  onLoadMore() async {
    page++;
    await super.onLoadMore();
  }
}
