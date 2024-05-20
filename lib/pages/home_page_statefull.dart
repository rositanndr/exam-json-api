import 'package:exam2/models/user.dart';
import 'package:exam2/services/album.dart';
import 'package:flutter/material.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  List<Album> users = [];
  bool isLoading = true;

  void fetchUsers() async {
    isLoading = true;
  final result = await AlbumServices.fetchUsers();
  users = result;
  setState(() {});
  isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Api StateFul'),
        ),
        body: isLoading ? Center(
          child:  CircularProgressIndicator(),
        )
        : ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.thumbnailUrl),
                ),
                title: Text('${user.id} . ${user.title}'),
                subtitle: Text(user.url),
               ),
            );
          }
          ),
    );
  }
}