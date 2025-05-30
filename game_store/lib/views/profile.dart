import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/sidebar.dart';
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
    final accentColor = Colors.tealAccent.shade400;

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/signin_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              NavBar(),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double containerWidth =
                        constraints.maxWidth > 1000
                            ? 1000
                            : constraints.maxWidth * 0.95;
                    bool isMobile = constraints.maxWidth < 750;
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            width: containerWidth,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                            child:
                                isMobile
                                    ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: _buildProfileSections(
                                        accentColor,
                                        isMobile,
                                      ),
                                    )
                                    : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: _buildProfileSections(
                                        accentColor,
                                        isMobile,
                                      ),
                                    ),
                          ),
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

  List<Widget> _buildProfileSections(Color accentColor, bool isMobile) {
    final leftSection = Expanded(
      flex: 3,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: _changeAvatar,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(avatarPaths[avatarIndex]),
                    backgroundColor: Colors.grey[800],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userEmail ?? 'Loading...',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          if (!mounted) return;
                          Navigator.of(context).pushReplacementNamed('/signin');
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text("Logout"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[600],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Card(
              color: Colors.grey[900],
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildGameTile(
                          'Red Dead Redemption 2',
                          '240 hrs on record',
                          'Last played on 28 Mar',
                          progress: 'Achievement Progress 24 of 51',
                          icon: Icons.sports_esports,
                        ),
                        _buildGameTile(
                          'Minecraft',
                          '2.4 hrs on record',
                          'Last played on 21 Nov, 2024',
                          icon: Icons.videogame_asset,
                        ),
                        _buildGameTile(
                          'GTA',
                          '35 hrs on record',
                          'Last played on 16 Nov, 2024',
                          icon: Icons.gamepad,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );

    final rightSection = Expanded(
      flex: 2,
      child: Card(
        color: Colors.grey[900],
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: 22,
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                _buildFriendTile(
                  'DeadEye',
                  'Last Online: 1 hr, 17 mins ago',
                  isOnline: true,
                ),
                _buildFriendTile(
                  'Exaygzerii',
                  'Last Online: 165 days ago',
                  isOnline: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (isMobile) {
      return [leftSection, const SizedBox(height: 24), rightSection];
    } else {
      return [leftSection, const SizedBox(width: 24), rightSection];
    }
  }

  Widget _buildGameTile(
    String title,
    String hours,
    String lastPlayed, {
    String? progress,
    IconData? icon,
  }) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon ?? Icons.videogame_asset,
              color: Colors.tealAccent,
              size: 36,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
          ],
        ),
      ),
    );
  }

  Widget _buildFriendTile(String name, String status, {bool isOnline = false}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[700],
            child: const Icon(Icons.person, color: Colors.white),
          ),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade400,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black87, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        status,
        style: TextStyle(color: Colors.grey[400], fontSize: 13),
      ),
    );
  }
}
