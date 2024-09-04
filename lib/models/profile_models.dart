import 'package:flutter/material.dart';

class ProfileModels {
  final IconButton icon;
  final String title;
  final IconData icon2 = Icons.arrow_forward_ios;
  ProfileModels({
    required this.icon,
    required this.title,
  });
}

List<ProfileModels> dummygeneral = [
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.person_outlined),
      onPressed: () {},
    ),
    title: 'Edit Profile',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.lock_outline),
      onPressed: () {},
    ),
    title: 'Change Password',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.notifications_outlined),
      onPressed: () {},
    ),
    title: 'Notifications',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.security_outlined),
      onPressed: () {},
    ),
    title: 'Security',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.language_outlined),
      onPressed: () {},
    ),
    title: 'Language',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.policy_outlined),
      onPressed: () {},
    ),
    title: 'Legal and Policy',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.help_center_outlined),
      onPressed: () {},
    ),
    title: 'Help and Support',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.logout_outlined),
      onPressed: () {},
    ),
    title: 'Logout',
  ),
];

List<ProfileModels> dummyprefer = [
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.policy_outlined),
      onPressed: () {},
    ),
    title: 'Legal and Policy',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.help_center_outlined),
      onPressed: () {},
    ),
    title: 'Help and Support',
  ),
  ProfileModels(
    icon: IconButton(
      icon: const Icon(Icons.logout_outlined),
      onPressed: () {},
    ),
    title: 'Logout',
  ),
];
