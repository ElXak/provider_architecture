import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/view_models/base_model.dart';
import '../../get_it.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BaseView({this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) widget.onModelReady(model);

    super.initState();
  }

/*
  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
