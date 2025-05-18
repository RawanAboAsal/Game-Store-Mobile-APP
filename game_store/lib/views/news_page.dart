import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer.dart';
import '../utils/news_data.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int currentPage = 1;
  final int itemsPerPage = 3;

  List<NewsItem> get paginatedNews {
    final start = (currentPage - 1) * itemsPerPage;
    final end = start + itemsPerPage;
    return newsList.sublist(
      start,
      end > newsList.length ? newsList.length : end,
    );
  }

  int get totalPages => (newsList.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                NavBar(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Center(
                        child: Text(
                          'Latest News & Events',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // News cards
                      ...paginatedNews.map(_buildNewsCard).toList(),

                      SizedBox(height: 20),
                      _buildPagination(),

                      SizedBox(height: 30),
                      Footer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🧩 News card with image beside text
  Widget _buildNewsCard(NewsItem news) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📷 Image on the left
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              news.imagePath,
              width: 150,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          // 📝 Text on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    news.description,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey[300], fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔢 Pagination buttons
  Widget _buildPagination() {
    return Center(
      child: Wrap(
        spacing: 8,
        children: [
          if (currentPage > 1)
            OutlinedButton(
              onPressed: () => setState(() => currentPage--),
              child: Text('« Prev'),
            ),
          for (int i = 1; i <= totalPages; i++)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    i == currentPage ? Colors.white12 : Colors.transparent,
              ),
              onPressed: () => setState(() => currentPage = i),
              child: Text('$i', style: TextStyle(color: Colors.white)),
            ),
          if (currentPage < totalPages)
            OutlinedButton(
              onPressed: () => setState(() => currentPage++),
              child: Text('Next »'),
            ),
        ],
      ),
    );
  }
}
