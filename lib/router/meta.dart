typedef _Meta = ({String title, bool auth});

class _Route {
  final String name;
  final _Meta meta;
  const _Route(this.name, {String title = '', bool auth = false})
      : meta = (title: title, auth: auth);
}

class Routes {
  static const home = _Route('home', title: '首頁');
  static const login = (home: _Route('loginHome', title: '登入'));
}
