import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resource_state_builder/resource_state_builder.dart';
import '../cubits/post_cubit.dart';
import '../models/post.dart';
import '../service_locator.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => locator<PostCubit>()..fetchPosts(),
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            title: const Text('Resource State Example'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                final cubit = context.read<PostCubit>();
                return PaginatedResourceBuilder<Post, PostsResponse, String>(
                  resource: state.postResource,
                  onRefresh: () => cubit.refreshPosts(),
                  onRetry: () => cubit.refreshPosts(true),
                  onLoadMore: () => cubit.loadMore(),
                  useSkeleton: true,
                  initialData: Post.mock,
                  skeletonBuilder: (items) => PostsResponse(posts: items),
                  itemBuilder: (context, index, item) => ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        item.id.toString(),
                      ),
                    ),
                    title: Text(item.title),
                    subtitle: Text(
                      item.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
}
