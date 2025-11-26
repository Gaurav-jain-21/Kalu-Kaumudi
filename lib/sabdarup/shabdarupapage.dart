import 'package:flutter/material.dart';
import 'package:sanskrit_project/sabdarup/typeDetailPage.dart';

class Shabdarupapage extends StatefulWidget {
  const Shabdarupapage({super.key});

  @override
  State<Shabdarupapage> createState() => _ShabdarupapageState();
}

class _ShabdarupapageState extends State<Shabdarupapage> {
  // List of शब्दरूप categories
  final List<Map<String, dynamic>> shabdarupaCategories = [
    {
      'title': 'स्वरान्त पुल्लिंग',
      'description': 'स्वर से समाप्त होने वाले पुल्लिंग शब्दों के रूप',
      'example': 'राम, फल, वृक्ष',
      'types': [
        'अकारान्त', // e.g. रामः (Rāmaḥ)
        'आकारान्त', // e.g. सीता (Sītā)
        'इकारान्त', // e.g. मुनिः (Muniḥ)
        'ईकारान्त', //e.g. मात्री (Mātrī)
        'उकारान्त', //# e.g. गुरुः (Guruḥ)
        'ऊकारान्त', //# e.g. धेनुः (Dhenuḥ)
        'ऋकारान्त', //# e.g. पितृ (Pitṛ)
        'ऐकारान्त',
        'ओकारान्त',
        'औकारान्त',
      ],
    },
    {
      'title': 'स्वरान्त स्त्रीलिंग',
      'description': 'स्वर से समाप्त होने वाले स्त्रीलिंग शब्दों के रूप',
      'example': 'लता, माला, नदी',
      'types': ['आकारान्त', 'इकारान्त', 'उकारान्त', 'ईकारान्त'],
    },
    {
      'title': 'स्वरान्त नपुंसकलिंग',
      'description': 'स्वर से समाप्त होने वाले नपुंसकलिंग शब्दों के रूप',
      'example': 'वन, जल, फल',
      'types': ['अकारान्त', 'इकारान्त', 'उकारान्त'],
    },
    {
      'title': 'हसान्त पुल्लिंग',
      'description': 'हस्व स्वर से समाप्त होने वाले पुल्लिंग शब्दों के रूप',
      'example': 'देव, राज, गज',
      'types': ['अकारान्त', 'इकारान्त', 'उकारान्त'],
    },
    {
      'title': 'हसान्त स्त्रीलिंग',
      'description': 'हस्व स्वर से समाप्त होने वाले स्त्रीलिंग शब्दों के रूप',
      'example': 'भूमि, रात्रि, मति',
      'types': ['इकारान्त', 'उकारान्त', 'ऋकारान्त'],
    },
    {
      'title': 'हसान्त नपुंसकलिंग',
      'description': 'हस्व स्वर से समाप्त होने वाले नपुंसकलिंग शब्दों के रूप',
      'example': 'मन, शरीर, हृदय',
      'types': ['अकारान्त', 'इकारान्त'],
    },
    {
      'title': 'संख्यावाची शब्द',
      'description': 'संख्याओं को दर्शाने वाले शब्दों के रूप',
      'example': 'एक, दो, तीन',
      'types': ['१-२०', '२१-४०', '४१-६०', '६१-८०', '८१-१००'],
    },
    {
      'title': 'सर्वनाम शब्द',
      'description': 'संज्ञा के स्थान पर प्रयुक्त होने वाले शब्दों के रूप',
      'example': 'यह, वह, मैं, तुम',
      'types': [
        'पुरुषवाचक सर्वनाम',
        'निजवाचक सर्वनाम',
        'निश्चयवाचक सर्वनाम',
        'अनिश्चयवाचक सर्वनाम',
        'संबंधवाचक सर्वनाम',
        'प्रश्नवाचक सर्वनाम',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("शब्दरूप पृष्ठ"),
        backgroundColor: Colors.orange.shade800,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: shabdarupaCategories.length,
        itemBuilder: (context, index) {
          final category = shabdarupaCategories[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: () {
                _navigateToDetailPage(context, category);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category['title']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['description']!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "उदाहरण: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade700,
                            ),
                          ),
                          Text(
                            category['example']!,
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      children: (category['types'] as List<String>)
                          .take(3)
                          .map(
                            (type) => Chip(
                              label: Text(
                                type,
                                style: const TextStyle(fontSize: 12),
                              ),
                              backgroundColor: Colors.orange.shade100,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade800,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'विस्तार से देखें',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetailPage(
    BuildContext context,
    Map<String, dynamic> category,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailPage(category: category),
      ),
    );
  }
}

// Detailed Page for each category
class CategoryDetailPage extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryDetailPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category['title']),
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
                      category['description']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "उदाहरण: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade700,
                            ),
                          ),
                          Text(
                            category['example']!,
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'प्रकार:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: (category['types'] as List<String>).length,
                itemBuilder: (context, index) {
                  final type = category['types'][index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.shade800,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        type,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _navigateToTypeDetailPage(
                          context,
                          category['title'],
                          type,
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

  void _navigateToTypeDetailPage(
    BuildContext context,
    String categoryTitle,
    String type,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TypeDetailPage(categoryTitle: categoryTitle, type: type),
      ),
    );
  }
}

// // Detailed Page for each type
// class TypeDetailPage extends StatelessWidget {
//   final String categoryTitle;
//   final String type;

//   const TypeDetailPage({
//     super.key,
//     required this.categoryTitle,
//     required this.type,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Sample data for different types - you can replace with actual data
//     final Map<String, List<Map<String, String>>> typeExamples = {
//       'आकारान्त': [
//         {'case': 'प्रथमा', 'singular': 'रामः', 'plural': 'रामाः'},
//         {'case': 'द्वितीया', 'singular': 'रामम्', 'plural': 'रामान्'},
//         {'case': 'तृतीया', 'singular': 'रामेण', 'plural': 'रामैः'},
//       ],
//       'इकारान्त': [
//         {'case': 'प्रथमा', 'singular': 'मुनिः', 'plural': 'मुनयः'},
//         {'case': 'द्वितीया', 'singular': 'मुनिम्', 'plural': 'मुनीन्'},
//         {'case': 'तृतीया', 'singular': 'मुनिना', 'plural': 'मुनिभिः'},
//       ],
//       'उकारान्त': [
//         {'case': 'प्रथमा', 'singular': 'गुरुः', 'plural': 'गुरवः'},
//         {'case': 'द्वितीया', 'singular': 'गुरुम्', 'plural': 'गुरून्'},
//         {'case': 'तृतीया', 'singular': 'गुरुणा', 'plural': 'गुरुभिः'},
//       ],
//       'अकारान्त': [
//         {'case': 'प्रथमा', 'singular': 'बालकः', 'plural': 'बालकाः'},
//         {'case': 'द्वितीया', 'singular': 'बालकम्', 'plural': 'बालकान्'},
//         {'case': 'तृतीया', 'singular': 'बालकेन', 'plural': 'बालकैः'},
//       ],
//       'ईकारान्त': [
//         {'case': 'प्रथमा', 'singular': 'नदी', 'plural': 'नद्यः'},
//         {'case': 'द्वितीया', 'singular': 'नदीम्', 'plural': 'नदीः'},
//         {'case': 'तृतीया', 'singular': 'नद्या', 'plural': 'नदीभिः'},
//       ],
//       '१-२०': [
//         {'number': 'एक', 'word': 'एकम्'},
//         {'number': 'द्वि', 'word': 'द्वे'},
//         {'number': 'त्रि', 'word': 'त्रीणि'},
//       ],
//       '२१-४०': [
//         {'number': 'एकविंशति', 'word': 'एकविंशतिः'},
//         {'number': 'द्वाविंशति', 'word': 'द्वाविंशतिः'},
//       ],
//     };

//     final examples = typeExamples[type] ?? [
//       {'case': 'विवरण', 'singular': 'उपलब्ध नहीं', 'plural': 'उपलब्ध नहीं'}
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$categoryTitle - $type'),
//         backgroundColor: Colors.orange.shade800,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '$categoryTitle - $type',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       '${type} प्रकार के शब्दों के विस्तृत रूप',
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'विस्तृत रूप:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: examples.length,
//                 itemBuilder: (context, index) {
//                   final example = examples[index];
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 8),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           if (example.containsKey('case'))
//                             Column(
//                               children: [
//                                 const Text(
//                                   'विभक्ति',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(example['case']!),
//                               ],
//                             ),
//                           if (example.containsKey('number'))
//                             Column(
//                               children: [
//                                 const Text(
//                                   'संख्या',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(example['number']!),
//                               ],
//                             ),
//                           Column(
//                             children: [
//                               const Text(
//                                 'एकवचन',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(example['singular'] ?? example['word']!),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               const Text(
//                                 'बहुवचन',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(example['plural'] ?? '-'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
