import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_flutter_app/models/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final users = [
    User(
      online: false,
      email: 'test001@test.com',
      name: 'test001',
      userId: '001',
    ),
    User(
      online: true,
      email: 'test002@test.com',
      name: 'test002',
      userId: '002',
    ),
    User(
      online: false,
      email: 'test003@test.com',
      name: 'test003',
      userId: '003',
    ),
    User(
      online: false,
      email: 'test004@test.com',
      name: 'test004',
      userId: '004',
    ),
    User(
      online: true,
      email: 'test005@test.com',
      name: 'test005',
      userId: '005',
    ),
    User(
      online: true,
      email: 'test006@test.com',
      name: 'test006',
      userId: '006',
    ),
    User(
      online: true,
      email: 'test007@test.com',
      name: 'test007',
      userId: '007',
    ),
  ];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My name...',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.exit_to_app_rounded,
            color: Colors.black87,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              Icons.check_circle_outline,
              color: Colors.cyanAccent,
            ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _loadingUsers,
        enablePullDown: true,
        header: const WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.blue,
          ),
          waterDropColor: Colors.grey,
        ),
        child: _usersListView(),
      ),
    );
  }

  ListView _usersListView() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) =>
          _userListTile(users[index]),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        child: Text(
          user.name.substring(0, 2),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      trailing: Icon(
        Icons.circle_rounded,
        color: !user.online ? Colors.greenAccent : Colors.red,
        size: 15,
      ),
    );
  }

  _loadingUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
