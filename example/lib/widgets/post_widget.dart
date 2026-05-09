import 'package:flutter/material.dart';

import '../enums/post_action.dart';
import '../models/post.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
    required this.onDelete,
    required this.onMarkRead,
  });

  final Post post;
  final VoidCallback onDelete;
  final VoidCallback onMarkRead;

  @override
  Widget build(BuildContext context) => ListTile(
        tileColor: post.isRead ? Colors.grey.shade100 : null,
        leading: CircleAvatar(child: Text(post.id.toString())),
        title: Text(
          post.title,
          style: TextStyle(
            fontWeight: post.isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(
          post.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: PopupMenuButton<PostAction>(
          onSelected: (action) {
            if (action == PostAction.delete) onDelete();
            if (action == PostAction.markRead) onMarkRead();
          },
          itemBuilder: (_) => [
            if (!post.isRead)
              PopupMenuItem(
                value: PostAction.markRead,
                child: Text('Mark as read'),
              ),
            PopupMenuItem(
              value: PostAction.delete,
              child: Text('Delete'),
            ),
          ],
        ),
      );
}
