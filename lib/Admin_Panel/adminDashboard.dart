import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _totalWords = 156;
  int _totalCategories = 8;
  int _totalUsers = 1247;
  int _recentActivity = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'शब्दरूप प्रबंधक',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange.shade800,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            _buildWelcomeSection(),
            const SizedBox(height: 24),

            // Statistics Cards
            _buildStatisticsSection(),
            const SizedBox(height: 24),

            // Quick Actions
            _buildQuickActionsSection(),
            const SizedBox(height: 24),

            // Recent Activity
            _buildRecentActivitySection(),
          ],
        ),
      ),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildWelcomeSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.orange.shade700,
              Colors.orange.shade500,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'नमस्ते प्रबंधक!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'शब्दरूप ऐप का स्वागत है',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.white.withOpacity(0.8)),
                const SizedBox(width: 8),
                Text(
                  'आज: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'आँकड़े',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildStatCard(
              'कुल शब्द',
              _totalWords.toString(),
              Icons.library_books,
              Colors.blue.shade500,
            ),
            _buildStatCard(
              'श्रेणियाँ',
              _totalCategories.toString(),
              Icons.category,
              Colors.green.shade500,
            ),
            _buildStatCard(
              'उपयोगकर्ता',
              _totalUsers.toString(),
              Icons.people,
              Colors.purple.shade500,
            ),
            _buildStatCard(
              'सक्रियता',
              '$_recentActivity नए',
              Icons.trending_up,
              Colors.red.shade500,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'त्वरित कार्य',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildActionCard(
              'नया शब्द जोड़ें',
              Icons.add_circle,
              Colors.green,
              () {
                _navigateToAddWord();
              },
            ),
            _buildActionCard(
              'श्रेणियाँ प्रबंधित करें',
              Icons.edit_note,
              Colors.blue,
              () {
                _navigateToManageCategories();
              },
            ),
            _buildActionCard(
              'उपयोगकर्ता देखें',
              Icons.people_alt,
              Colors.purple,
              () {
                _navigateToUsers();
              },
            ),
            _buildActionCard(
              'विश्लेषण',
              Icons.analytics,
              Colors.orange,
              () {
                _navigateToAnalytics();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'हाल की गतिविधियाँ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('सभी देखें'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildActivityItem(
                  'राजन् शब्द जोड़ा गया',
                  '2 मिनट पहले',
                  Icons.add,
                  Colors.green,
                ),
                _buildActivityItem(
                  'उपयोगकर्ता ने राम शब्द देखा',
                  '15 मिनट पहले',
                  Icons.visibility,
                  Colors.blue,
                ),
                _buildActivityItem(
                  'नई श्रेणी बनाई गई',
                  '1 घंटा पहले',
                  Icons.create_new_folder,
                  Colors.orange,
                ),
                _buildActivityItem(
                  'सर्व शब्द अपडेट किया गया',
                  '2 घंटे पहले',
                  Icons.update,
                  Colors.purple,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        time,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.orange.shade800,
                  Colors.orange.shade600,
                ],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'प्रबंधक',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'admin@sanskritapp.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            Icons.dashboard,
            'डैशबोर्ड',
            () {
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            Icons.library_books,
            'शब्द प्रबंधन',
            () {
              _navigateToWordManagement();
            },
          ),
          _buildDrawerItem(
            Icons.category,
            'श्रेणी प्रबंधन',
            () {
              _navigateToCategoryManagement();
            },
          ),
          _buildDrawerItem(
            Icons.people,
            'उपयोगकर्ता प्रबंधन',
            () {
              _navigateToUserManagement();
            },
          ),
          _buildDrawerItem(
            Icons.analytics,
            'विश्लेषण',
            () {
              _navigateToAnalytics();
            },
          ),
          _buildDrawerItem(
            Icons.settings,
            'सेटिंग्स',
            () {
              _navigateToSettings();
            },
          ),
          const Divider(),
          _buildDrawerItem(
            Icons.logout,
            'लॉगआउट',
            () {
              _logout();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange.shade700),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Navigation Methods
  void _navigateToAddWord() {
    // Navigate to Add Word Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('नया शब्द जोड़ें पेज खोलें')),
    );
  }

  void _navigateToManageCategories() {
    // Navigate to Manage Categories Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('श्रेणियाँ प्रबंधित करें पेज खोलें')),
    );
  }

  void _navigateToUsers() {
    // Navigate to Users Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('उपयोगकर्ता पेज खोलें')),
    );
  }

  void _navigateToAnalytics() {
    // Navigate to Analytics Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('विश्लेषण पेज खोलें')),
    );
  }

  void _navigateToWordManagement() {
    // Navigate to Word Management Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('शब्द प्रबंधन पेज खोलें')),
    );
  }

  void _navigateToCategoryManagement() {
    // Navigate to Category Management Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('श्रेणी प्रबंधन पेज खोलें')),
    );
  }

  void _navigateToUserManagement() {
    // Navigate to User Management Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('उपयोगकर्ता प्रबंधन पेज खोलें')),
    );
  }

  void _navigateToSettings() {
    // Navigate to Settings Page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('सेटिंग्स पेज खोलें')),
    );
  }

  void _logout() {
    // Logout logic
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('लॉगआउट'),
        content: const Text('क्या आप वाकई लॉगआउट करना चाहते हैं?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('रद्द करें'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Add logout logic here
            },
            child: const Text('लॉगआउट'),
          ),
        ],
      ),
    );
  }
}