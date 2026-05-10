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
          body: Builder(
            builder: (context) {
              final cubit = context.read<PostCubit>();
              return MultiResourceBuilder<String>(
                resourcesSelector: (childBuilder) => BlocSelector<PostCubit,
                    PostState, List<Resource<dynamic, String>>>(
                  selector: (state) => [state.userResource, state.postResource],
                  builder: childBuilder,
                ),
                globalError: 'Failed to load page content',
                onRefresh: () => cubit.refreshAll(),
                onRetry: () => cubit.refreshAll(true),
                standards: [
                  ResourceDef<User, String>(
                    selectorBuilder: (childBuilder) => BlocSelector<PostCubit,
                        PostState, Resource<User, String>>(
                      selector: (s) => s.userResource,
                      builder: childBuilder,
                    ),
                    initialData: User.mock,
                    onRetry: () => cubit.refreshProfile(true),
                    builder: (context, user) => SliverToBoxAdapter(
                      child: ProfileHeader(
                        user: user,
                      ),
                    ),
                  ),
                ],
                paginated: PaginatedResourceDef<Post, PostsResponse, String>(
                  selectorBuilder: (childBuilder) => BlocSelector<PostCubit,
                      PostState, Resource<PostsResponse, String>>(
                    selector: (s) => s.postResource,
                    builder: childBuilder,
                  ),
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
              );
            },
          ),
        ),
      );
}
