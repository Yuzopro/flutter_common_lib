import 'package:flutter_base_ui/mvp/i_base_view.dart';

abstract class IBasePullListView<T> implements IBaseView {
 void setList(List<T> list, bool isFromMore);
}