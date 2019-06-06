import 'package:flutter/material.dart';
import 'package:coin_flutter/bloc/coin_bloc.dart';

class CoinBlocProvider extends InheritedWidget {
  final CoinBloc bloc;

  CoinBlocProvider({Key key, Widget child})
      : bloc = CoinBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static CoinBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CoinBlocProvider)
            as CoinBlocProvider)
        .bloc;
  }
}
