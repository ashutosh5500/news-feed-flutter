import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/helper/data.dart';
import 'package:news_feed/helper/news.dart';
import 'package:news_feed/models/article_model.dart';
import 'package:news_feed/models/catogory_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<Articles> articles = <Articles>[];

  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(articles);
    fetchData();
    categories = getCategories();
    print(categories.length);
  }

  fetchData() async {
    articles = await getData();
    setState(() {});
  }

  getData() async {
    News newsClass = News();
    await newsClass.getNewsDataAPI();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NEWS',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'FEED',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return BlogTile(
                            blogDescription:
                                articles[index].description.toString(),
                            blogImageUrl: articles[index].urlToImage.toString(),
                            blogTitle: articles[index].title.toString());
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  BlogTile({
    required this.blogDescription,
    required this.blogImageUrl,
    required this.blogTitle,
  });

  final String blogImageUrl, blogTitle, blogDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(blogImageUrl),
          Text(blogTitle),
          Text(blogDescription),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicked category');
      },
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                (imageUrl),
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black45,
              ),
              height: 60,
              width: 120,
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
