class LoadingBean<T> {
  bool isLoading;
  bool isError = false;
  T data;

  LoadingBean({this.isLoading, this.data, this.isError: false});

  @override
  String toString() {
    return 'LoadingBean{isLoading: $isLoading, data: $data}';
  }
}
