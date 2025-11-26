import 'package:flutter/material.dart';
import 'package:sanskrit_project/sabdarup/wordDetailPage.dart';

// Detailed Page for each type
class TypeDetailPage extends StatelessWidget {
  final String categoryTitle;
  final String type;

  const TypeDetailPage({
    super.key,
    required this.categoryTitle,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // Sample data for different types with actual words
    final Map<String, List<String>> typeWords = {
      'आकारान्त': ['राम', 'फल', 'वृक्ष', 'बालक', 'गज'],
      'इकारान्त': ['मुनि', 'ऋषि', 'पति', 'गिरि', 'वणिज'],
      'उकारान्त': ['गुरु', 'साधु', 'भानु', 'केतु', 'विद्यार्थी'],
      'अकारान्त': ['बालक', 'विद्यार्थी', 'पुस्तक', 'गृह', 'पुष्प'],
      'ईकारान्त': ['नदी', 'लता', 'माला', 'वाणी', 'सभा'],
      '१-२०': ['एक', 'द्वि', 'त्रि', 'चतुर्', 'पञ्च'],
      '२१-४०': [
        'एकविंशति',
        'द्वाविंशति',
        'त्रयोविंशति',
        'चतुर्विंशति',
        'पञ्चविंशति',
      ],
    };

    final words = typeWords[type] ?? ['उपलब्ध नहीं'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle - $type'),
        backgroundColor: Colors.orange.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$categoryTitle - $type',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${type} प्रकार के शब्दों की सूची',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'शब्द सूची:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: words.length,
                itemBuilder: (context, index) {
                  final word = words[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.shade800,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        word,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _navigateToWordDetailPage(
                          context,
                          categoryTitle,
                          type,
                          word,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToWordDetailPage(
    BuildContext context,
    String categoryTitle,
    String type,
    String word,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WordDetailPage(
          categoryTitle: categoryTitle,
          type: type,
          word: word,
        ),
      ),
    );
  }
}
