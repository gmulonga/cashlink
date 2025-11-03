import 'package:cashlink/config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(child: Text("Settings", style: TextStyle(color: kPrimary, fontWeight: FontWeight.bold, fontSize: 20),)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  // Account Settings Section
                  _buildSectionHeader('Account'),
                  _buildSettingsCard(
                    child: Column(
                      children: [
                        _buildSettingsItem(
                          icon: Icons.person_outline,
                          title: 'Account Details',
                          subtitle: 'Manage your profile information',
                          onTap: () {
                          },
                        ),
                        _buildDivider(),
                        _buildSettingsItem(
                          icon: Icons.lock_outline,
                          title: 'Change Password',
                          subtitle: 'Update your account password',
                          onTap: () {
                          },
                        ),
                        _buildDivider(),
                        _buildSettingsItem(
                          icon: Icons.wallet,
                          title: 'My Wallet',
                          subtitle: 'Check the balance of your account',
                          onTap: () {
                          },
                        ),
                        _buildDivider(),
                        _buildSettingsItem(
                          icon: Icons.delete_outline,
                          title: 'Delete Account',
                          subtitle: 'Permanently remove your account',
                          textColor: Colors.red.shade600,
                          iconColor: Colors.red.shade600,
                          onTap: () {
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),

                  // Legal & About Section
                  _buildSectionHeader('Legal & About'),
                  _buildSettingsCard(
                    child: Column(
                      children: [
                        _buildSettingsItem(
                          icon: Icons.privacy_tip_outlined,
                          title: 'Privacy Policy',
                          subtitle: 'Learn how we protect your data',
                          onTap: () {
                          },
                        ),
                        _buildDivider(),
                        _buildSettingsItem(
                          icon: Icons.info_outline,
                          title: 'About CashLink',
                          subtitle: 'Get to know about us',
                          onTap: () {

                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),

                  _buildSectionHeader('Support'),
                  _buildSettingsCard(
                    child: Column(
                      children: [
                        _buildSettingsItem(
                          icon: Icons.help_outline,
                          title: 'Help & Support',
                          subtitle: 'Get help or contact support',
                          onTap: () {
                          },
                        ),
                        _buildDivider(),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),

                  _buildSectionHeader('Logout'),
                  _buildSettingsCard(
                    child: Column(
                      children: [
                        _buildSettingsItem(
                          icon: Icons.logout,
                          title: 'Logout',
                          subtitle: 'Sign out of CashLink',
                          textColor: Colors.red.shade600,
                          iconColor: Colors.red.shade600,
                          onTap: () {

                          },
                        ),
                        _buildDivider(),
                      ],
                    ),
                  ),

                  SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingsCard({required Widget child, VoidCallback? onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (iconColor ?? kPrimary).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor ?? kPrimary, size: 20),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textColor ?? Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(left: 56),
      height: 1,
      color: Colors.grey.shade100,
    );
  }
}