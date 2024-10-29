import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard.expanded({
    super.key,
    required this.headline,
    required this.publication,
    required this.publishedAt,
    required this.imageUrl,
  }) : isExpanded = true;

  const NewsCard.collapsed({
    super.key,
    required this.headline,
    required this.publication,
    required this.publishedAt,
    required this.imageUrl,
  }) : isExpanded = false;

  final String headline;
  final String publication;
  final DateTime publishedAt;
  final String imageUrl;

  final bool isExpanded;

  String _timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 7) {
      return '${difference.inDays % 7}w';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headline,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.bodySmall!,
          child: Text(
            '$publication • ${_timeAgo(publishedAt)}',
          ),
        )
      ],
    );
    return InkWell(
      child: () {
        if (isExpanded) {
          return InkWell(
            child: SizedBox(
              height: 268,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 166,
                    width: double.infinity,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 8),
                  content,
                ],
              ),
            ),
          );
        }
        return InkWell(
          child: SizedBox(
            height: 97,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 55,
                  height: 73,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: content,
                )
              ],
            ),
          ),
        );
      }(),
    );
  }
}
