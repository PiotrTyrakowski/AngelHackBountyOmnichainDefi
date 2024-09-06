import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final bool isVerified; // Add a field for verification status

  // Constructor to accept title, subtitle, description, and verification status
  HeaderWidget({
    required this.title,
    required this.subtitle,
    required this.description,
    this.isVerified = true, // Default is false
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Placeholder for the image
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
          ),
          child: const Icon(Icons.image, size: 120),
        ),
        const SizedBox(width: 16),
        // Headline and text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isVerified)
                    const Tooltip(
                      message: 'Verified contract',
                      child: Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
