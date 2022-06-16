import 'package:demo/app_todolist/providers/news_api.dart';
import 'package:flutter/material.dart';

import '../models/News.dart';

class NewsScreen extends StatefulWidget {
  @override
  State createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  NewsApi newsApi = NewsApi();
  List<News> news = [];
  bool isLoading = true;

  Future initNews() async {
    news = await newsApi.getNews();
  }

  @override
  void initState() {
    super.initState();
    initNews().then((value) => setState(() {
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News page'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 3, crossAxisSpacing: 20, mainAxisSpacing: 20),
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          news[index].title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          news[index].description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
