typedef _Meta = ({String title, bool auth});

class _Route {
  final String name;
  final _Meta meta;
  const _Route(this.name, {String title = '', bool auth = false})
      : meta = (title: title, auth: auth);
}

class Routes {
  static const home = _Route('home', title: '首頁');
  static const activity = (
    home: _Route('activity_home', title: 'Activity Home'),
    add: _Route('activity_add', title: 'Add'),
    edit: _Route('activity_edit', title: 'Edit'),
    activity: _Route('activity', title: 'Activity')
  );
  static const expense = (
    add: _Route('expense_add', title: 'Add'),
    edit: _Route('expense_edit', title: 'Edit'),
  );
  static const login = (home: _Route('loginHome', title: '登入'));
}
