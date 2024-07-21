import 'package:flutter/material.dart';

class ProfileModels {
  final IconData icon;
  final String title;
  final IconData icon2 = Icons.arrow_forward_ios;
  ProfileModels({
    required this.icon,
    required this.title,
  });
}

List<ProfileModels> dummygeneral = [
  ProfileModels(icon: Icons.person_outlined, title: 'Edit Profile'),
  ProfileModels(icon: Icons.lock_outline, title: 'Change Password'),
  ProfileModels(icon: Icons.notifications_outlined, title: 'Notifications'),
  ProfileModels(icon: Icons.security_outlined, title: 'Security'),
  ProfileModels(icon: Icons.language_outlined, title: 'Lnguage'),
  ProfileModels(icon: Icons.policy_outlined, title: 'Legal and Policy'),
  ProfileModels(icon: Icons.help_center_outlined, title: 'Help and Support'),
  ProfileModels(icon: Icons.logout_outlined, title: 'Logout'),
];
List<ProfileModels> dummyprefer = [
  ProfileModels(icon: Icons.policy_outlined, title: 'Legal and Policy'),
  ProfileModels(icon: Icons.help_center_outlined, title: 'Help and Support'),
  ProfileModels(icon: Icons.logout_outlined, title: 'Logout'),
];
