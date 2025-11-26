import 'package:flutter/material.dart';

class WordDetailPage extends StatelessWidget {
  final String categoryTitle;
  final String type;
  final String word;

  const WordDetailPage({
    super.key,
    required this.categoryTitle,
    required this.type,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    final details = _getWordDetails(word);

    return Scaffold(
      appBar: AppBar(
        title: Text('$word - $type'),
        backgroundColor: Colors.orange.shade800,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.orange.shade100, Colors.orange.shade50],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade800,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.menu_book,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  word,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$categoryTitle - $type',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.orange.shade700,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Table Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.shade800,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        'विभक्ति',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'एकवचन',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'द्विवचन',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'बहुवचन',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Word Forms List
              Expanded(
                child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    final detail = details[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.white
                            : Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text(
                                detail['case']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.brown,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                detail['singular']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                detail['dual']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                detail['plural']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, String>> _getWordDetails(String word) {
    final Map<String, List<Map<String, String>>> wordDetails = {
      'राम': [
        {
          'case': 'प्रथमा',
          'singular': 'रामः',
          'dual': 'रामौ',
          'plural': 'रामाः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'रामम्',
          'dual': 'रामौ',
          'plural': 'रामान्',
        },
        {
          'case': 'तृतीया',
          'singular': 'रामेण',
          'dual': 'रामाभ्याम्',
          'plural': 'रामैः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'रामाय',
          'dual': 'रामाभ्याम्',
          'plural': 'रामेभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'रामात्',
          'dual': 'रामाभ्याम्',
          'plural': 'रामेभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'रामस्य',
          'dual': 'रामयोः',
          'plural': 'रामाणाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'रामे',
          'dual': 'रामयोः',
          'plural': 'रामेषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे राम',
          'dual': 'हे रामौ',
          'plural': 'हे रामाः',
        },
      ],
      'फल': [
        {
          'case': 'प्रथमा',
          'singular': 'फलम्',
          'dual': 'फले',
          'plural': 'फलानि',
        },
        {
          'case': 'द्वितीया',
          'singular': 'फलम्',
          'dual': 'फले',
          'plural': 'फलानि',
        },
        {
          'case': 'तृतीया',
          'singular': 'फलेन',
          'dual': 'फलाभ्याम्',
          'plural': 'फलैः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'फलाय',
          'dual': 'फलाभ्याम्',
          'plural': 'फलेभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'फलात्',
          'dual': 'फलाभ्याम्',
          'plural': 'फलेभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'फलस्य',
          'dual': 'फलयोः',
          'plural': 'फलानाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'फले',
          'dual': 'फलयोः',
          'plural': 'फलेषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे फल',
          'dual': 'हे फले',
          'plural': 'हे फलानि',
        },
      ],
      'लता': [
        {'case': 'प्रथमा', 'singular': 'लता', 'dual': 'लते', 'plural': 'लताः'},
        {
          'case': 'द्वितीया',
          'singular': 'लताम्',
          'dual': 'लते',
          'plural': 'लताः',
        },
        {
          'case': 'तृतीया',
          'singular': 'लतया',
          'dual': 'लताभ्याम्',
          'plural': 'लताभिः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'लतायै',
          'dual': 'लताभ्याम्',
          'plural': 'लताभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'लतायाः',
          'dual': 'लताभ्याम्',
          'plural': 'लताभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'लतायाः',
          'dual': 'लतयोः',
          'plural': 'लतानाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'लतायाम्',
          'dual': 'लतयोः',
          'plural': 'लतासु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे लते',
          'dual': 'हे लते',
          'plural': 'हे लताः',
        },
      ],
      'नदी': [
        {
          'case': 'प्रथमा',
          'singular': 'नदी',
          'dual': 'नद्यौ',
          'plural': 'नद्यः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'नदीम्',
          'dual': 'नद्यौ',
          'plural': 'नदीः',
        },
        {
          'case': 'तृतीया',
          'singular': 'नद्या',
          'dual': 'नदीभ्याम्',
          'plural': 'नदीभिः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'नद्यै',
          'dual': 'नदीभ्याम्',
          'plural': 'नदीभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'नद्याः',
          'dual': 'नदीभ्याम्',
          'plural': 'नदीभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'नद्याः',
          'dual': 'नद्योः',
          'plural': 'नदीनाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'नद्याम्',
          'dual': 'नद्योः',
          'plural': 'नदीषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे नदि',
          'dual': 'हे नद्यौ',
          'plural': 'हे नद्यः',
        },
      ],
      'साधु': [
        {
          'case': 'प्रथमा',
          'singular': 'साधुः',
          'dual': 'साधू',
          'plural': 'साधवः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'साधुम्',
          'dual': 'साधू',
          'plural': 'साधून्',
        },
        {
          'case': 'तृतीया',
          'singular': 'साधुना',
          'dual': 'साधुभ्याम्',
          'plural': 'साधुभिः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'साधवे',
          'dual': 'साधुभ्याम्',
          'plural': 'साधुभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'साधोः',
          'dual': 'साधुभ्याम्',
          'plural': 'साधुभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'साधोः',
          'dual': 'साध्वोः',
          'plural': 'साधूनाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'साधौ',
          'dual': 'साध्वोः',
          'plural': 'साधुषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे साधो',
          'dual': 'हे साधू',
          'plural': 'हे साधवः',
        },
      ],
      'बालक': [
        {
          'case': 'प्रथमा',
          'singular': 'बालकः',
          'dual': 'बालकौ',
          'plural': 'बालकाः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'बालकम्',
          'dual': 'बालकौ',
          'plural': 'बालकान्',
        },
        {
          'case': 'तृतीया',
          'singular': 'बालकेन',
          'dual': 'बालकाभ्याम्',
          'plural': 'बालकैः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'बालकाय',
          'dual': 'बालकाभ्याम्',
          'plural': 'बालकेभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'बालकात्',
          'dual': 'बालकाभ्याम्',
          'plural': 'बालकेभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'बालकस्य',
          'dual': 'बालकयोः',
          'plural': 'बालकानाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'बालके',
          'dual': 'बालकयोः',
          'plural': 'बालकेषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे बालक',
          'dual': 'हे बालकौ',
          'plural': 'हे बालकाः',
        },
      ],
      'वृक्ष': [
        {
          'case': 'प्रथमा',
          'singular': 'वृक्षः',
          'dual': 'वृक्षौ',
          'plural': 'वृक्षाः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'वृक्षम्',
          'dual': 'वृक्षौ',
          'plural': 'वृक्षान्',
        },
        {
          'case': 'तृतीया',
          'singular': 'वृक्षेण',
          'dual': 'वृक्षाभ्याम्',
          'plural': 'वृक्षैः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'वृक्षाय',
          'dual': 'वृक्षाभ्याम्',
          'plural': 'वृक्षेभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'वृक्षात्',
          'dual': 'वृक्षाभ्याम्',
          'plural': 'वृक्षेभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'वृक्षस्य',
          'dual': 'वृक्षयोः',
          'plural': 'वृक्षाणाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'वृक्षे',
          'dual': 'वृक्षयोः',
          'plural': 'वृक्षेषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे वृक्ष',
          'dual': 'हे वृक्षौ',
          'plural': 'हे वृक्षाः',
        },
      ],
      'मुनि': [
        {
          'case': 'प्रथमा',
          'singular': 'मुनिः',
          'dual': 'मुनि',
          'plural': 'मुनयः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'मुनिम्',
          'dual': 'मुनि',
          'plural': 'मुनीन्',
        },
        {
          'case': 'तृतीया',
          'singular': 'मुनिना',
          'dual': 'मुनिभ्याम्',
          'plural': 'मुनिभिः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'मुनये',
          'dual': 'मुनिभ्याम्',
          'plural': 'मुनिभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'मुनेः',
          'dual': 'मुनिभ्याम्',
          'plural': 'मुनिभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'मुनेः',
          'dual': 'मुन्योः',
          'plural': 'मुनीनाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'मुनौ',
          'dual': 'मुन्योः',
          'plural': 'मुनिषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे मुने',
          'dual': 'हे मुनि',
          'plural': 'हे मुनयः',
        },
      ],
      'गुरु': [
        {
          'case': 'प्रथमा',
          'singular': 'गुरुः',
          'dual': 'गुरू',
          'plural': 'गुरवः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'गुरुम्',
          'dual': 'गुरू',
          'plural': 'गुरून्',
        },
        {
          'case': 'तृतीया',
          'singular': 'गुरुणा',
          'dual': 'गुरुभ्याम्',
          'plural': 'गुरुभिः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'गुरवे',
          'dual': 'गुरुभ्याम्',
          'plural': 'गुरुभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'गुरोः',
          'dual': 'गुरुभ्याम्',
          'plural': 'गुरुभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'गुरोः',
          'dual': 'गुर्वोः',
          'plural': 'गुरूणाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'गुरौ',
          'dual': 'गुर्वोः',
          'plural': 'गुरुषु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे गुरो',
          'dual': 'हे गुरू',
          'plural': 'हे गुरवः',
        },
      ],
      'माला': [
        {
          'case': 'प्रथमा',
          'singular': 'माला',
          'dual': 'माले',
          'plural': 'मालाः',
        },
        {
          'case': 'द्वितीया',
          'singular': 'मालाम्',
          'dual': 'माले',
          'plural': 'मालाः',
        },
        {
          'case': 'तृतीया',
          'singular': 'मालया',
          'dual': 'मालाभ्याम्',
          'plural': 'मालाभिः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'मालायै',
          'dual': 'मालाभ्याम्',
          'plural': 'मालाभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'मालायाः',
          'dual': 'मालाभ्याम्',
          'plural': 'मालाभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'मालायाः',
          'dual': 'मालयोः',
          'plural': 'मालानाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'मालायाम्',
          'dual': 'मालयोः',
          'plural': 'मालासु',
        },
        {
          'case': 'सम्बोधन',
          'singular': 'हे माले',
          'dual': 'हे माले',
          'plural': 'हे मालाः',
        },
      ],
      'एक': [
        {'case': 'प्रथमा', 'singular': 'एकः', 'dual': 'एके', 'plural': 'एकानि'},
        {
          'case': 'द्वितीया',
          'singular': 'एकम्',
          'dual': 'एके',
          'plural': 'एकानि',
        },
        {
          'case': 'तृतीया',
          'singular': 'एकेन',
          'dual': 'एकाभ्याम्',
          'plural': 'एकैः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'एकस्मै',
          'dual': 'एकाभ्याम्',
          'plural': 'एकेभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'एकस्मात्',
          'dual': 'एकाभ्याम्',
          'plural': 'एकेभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'एकस्य',
          'dual': 'एकयोः',
          'plural': 'एकेषाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'एकस्मिन्',
          'dual': 'एकयोः',
          'plural': 'एकेषु',
        },
      ],
      'द्वि': [
        {
          'case': 'प्रथमा',
          'singular': 'द्वौ',
          'dual': 'द्वे',
          'plural': 'द्वे',
        },
        {
          'case': 'द्वितीया',
          'singular': 'द्वौ',
          'dual': 'द्वे',
          'plural': 'द्वे',
        },
        {
          'case': 'तृतीया',
          'singular': 'द्वाभ्याम्',
          'dual': 'द्वाभ्याम्',
          'plural': 'द्वाभ्याम्',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'द्वाभ्याम्',
          'dual': 'द्वाभ्याम्',
          'plural': 'द्वाभ्याम्',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'द्वाभ्याम्',
          'dual': 'द्वाभ्याम्',
          'plural': 'द्वाभ्याम्',
        },
        {
          'case': 'षष्ठी',
          'singular': 'द्वयोः',
          'dual': 'द्वयोः',
          'plural': 'द्वयोः',
        },
        {
          'case': 'सप्तमी',
          'singular': 'द्वयोः',
          'dual': 'द्वयोः',
          'plural': 'द्वयोः',
        },
      ],
      'त्रि': [
        {
          'case': 'प्रथमा',
          'singular': 'त्रयः',
          'dual': 'त्रीणि',
          'plural': 'त्रीणि',
        },
        {
          'case': 'द्वितीया',
          'singular': 'त्रीन्',
          'dual': 'त्रीणि',
          'plural': 'त्रीणि',
        },
        {
          'case': 'तृतीया',
          'singular': 'त्रिभिः',
          'dual': 'त्रिभ्याम्',
          'plural': 'त्रिभिः',
        },
        {
          'case': 'चतुर्थी',
          'singular': 'त्रिभ्यः',
          'dual': 'त्रिभ्याम्',
          'plural': 'त्रिभ्यः',
        },
        {
          'case': 'पञ्चमी',
          'singular': 'त्रिभ्यः',
          'dual': 'त्रिभ्याम्',
          'plural': 'त्रिभ्यः',
        },
        {
          'case': 'षष्ठी',
          'singular': 'त्रयाणाम्',
          'dual': 'त्रयोः',
          'plural': 'त्रयाणाम्',
        },
        {
          'case': 'सप्तमी',
          'singular': 'त्रिषु',
          'dual': 'त्रयोः',
          'plural': 'त्रिषु',
        },
      ],
    };

    return wordDetails[word] ??
        [
          {
            'case': 'प्रथमा',
            'singular': '$word:',
            'dual': 'द्विवचन उपलब्ध नहीं',
            'plural': 'बहुवचन उपलब्ध नहीं',
          },
        ];
  }
}
