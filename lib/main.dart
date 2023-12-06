import 'package:flutter/material.dart';
import 'package:gen/presenter/user_provider.dart';
import 'package:provider/provider.dart';

import 'domain/user_entity.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: userProvider.loadUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar usuários: ${snapshot.error}');
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: userProvider.users.length,
                      itemBuilder: (context, index) {
                        UserEntity user = userProvider.users[index];

                        return ListTile(
                          title: Text(user.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${user.id}'),
                              Text('Original Title: ${user.originalTitle}'),
                              Text('Original Language: ${user.originalLanguage}'),
                              Text('Overview: ${user.overview}'),
                              Text('Popularity: ${user.popularity}'),
                              Text('Release Date: ${user.releaseDate}'),
                              Text('Vote Average: ${user.voteAverage}'),
                              Text('Vote Count: ${user.voteCount}'),
                            ],
                          ),
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500${user.posterPath}',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
