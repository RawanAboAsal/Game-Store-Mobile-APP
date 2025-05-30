import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int avatarIndex = 0;
  final List<String> avatarPaths = ['assets/avatar1.png', 'assets/avatar2.png'];
  String? userEmail;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      userEmail = user?.email ?? 'Unknown User';
    });
  }

  void _changeAvatar() {
    setState(() {
      avatarIndex = (avatarIndex + 1) % avatarPaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/signin_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            NavBar(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double containerWidth = constraints.maxWidth > 1000
                      ? 1000
                      : constraints.maxWidth * 0.95;

                  return Center(
                    child: Container(
                      width: containerWidth,
                      padding: const EdgeInsets.all(20),
                      color: Colors.black.withOpacity(0.75),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: _changeAvatar,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage(
                                            avatarPaths[avatarIndex],
                                          ),
                                          backgroundColor: Colors.grey[700],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              userEmail ?? 'Loading...',
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            ElevatedButton.icon(
                                              onPressed: () async {
                                                await FirebaseAuth.instance
                                                    .signOut();
                                                if (!mounted) return;
                                                Navigator.of(context)
                                                    .pushReplacementNamed(
                                                        '/signin');
                                              },
                                              icon: const Icon(Icons.logout),
                                              label: const Text("Logout"),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 6),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Recent Activity',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Expanded(
                                          child: ListView(
                                            children: [
                                              _buildGameTile(
                                                'Red Dead Redemption 2',
                                                '240 hrs on record',
                                                'Last played on 28 Mar',
                                                progress:
                                                    'Achievement Progress 24 of 51',
                                              ),
                                              _buildGameTile(
                                                'Minecraft',
                                                '2.4 hrs on record',
                                                'Last played on 21 Nov, 2024',
                                              ),
                                              _buildGameTile(
                                                'GTA',
                                                '35 hrs on record',
                                                'Last played on 16 Nov, 2024',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Friends',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _buildFriendTile(
                                  'DeadEye',
                                  'Last Online: 1 hr, 17 mins ago',
                                ),
                                _buildFriendTile(
                                  'Exaygzerii',
                                  'Last Online: 165 days ago',
                                ),
                              ],
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
    );
  }

  Widget _buildGameTile(
    String title,
    String hours,
    String lastPlayed, {
    String? progress,
  }) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              hours,
              style: TextStyle(color: Colors.grey[300], fontSize: 12),
            ),
            Text(
              lastPlayed,
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
            if (progress != null) ...[
              const SizedBox(height: 6),
              Text(
                progress,
                style: TextStyle(color: Colors.grey[200], fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFriendTile(String name, String status) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.grey[700],
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: Text(name, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        status,
        style: TextStyle(color: Colors.grey[400], fontSize: 12),
      ),
    );
  }
}
