import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resource_state_builder/resource_state_builder.dart';

import '../cubits/post_cubit.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../service_locator.dart';
import '../widgets/profile_header.dart';
import '../widgets/post_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<PostCubit>(
        create: (context) => locator<PostCubit>(),
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            title: const Text('Resource State Example'),
          ),
          body: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              final cubit = context.read<PostCubit>();
              return Column(
                children: [
                  Expanded(
                    child: MultiResourceBuilder<String>(
                      globalError: 'Failed to load page content',
                      onRefresh: () => cubit.refreshAll(),
                      onRetry: () => cubit.refreshAll(true),
                      standards: [
                        ResourceDef<User, String>(
                          resource: state.userResource,
                          initialData: User.mock,
                          builder: (context, user) => SliverToBoxAdapter(
                            child: ProfileHeader(
                              user: user,
                            ),
                          ),
                        ),
                      ],
                      paginated:
                          PaginatedResourceDef<Post, PostsResponse, String>(
                        resource: state.postResource,
                        onLoadMore: () => cubit.loadMore(),
                        onRetry: () => cubit.refreshPosts(true),
                        itemBuilder: (context, index, post) => PostWidget(
                          post: post,
                          onDelete: () => cubit.deletePost(post.id),
                          onMarkRead: () => cubit.markPostRead(post.id),
                        ),
                        skeletonBuilder: (items) => PostsResponse(
                          posts: items,
                        ),
                        initialData: Post.mock,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
