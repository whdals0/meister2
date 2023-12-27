import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meister2/globals/globals.dart';
import 'package:meister2/providers/post_provider.dart';
import 'package:meister2/screens/detail_post.dart';

import '../globals/custom_colors.dart';
import '../globals/custom_functions.dart';
import '../globals/custom_widgets.dart';
import '../models/paginate.dart';
import '../models/post.dart';

class TabPost extends StatefulWidget {
  const TabPost({Key? key}) : super(key: key);

  @override
  State<TabPost> createState() => TabPostState();
}

class TabPostState extends State<TabPost> {
  late int currentPage;

  final PagingController<int, Post> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);

  @override
  void initState() {
    super.initState();

    print("initState");
    currentPage = 1;
    _pagingController.addPageRequestListener((pageKey) {
      _getCommunity(pageKey);
    });
  }

  Future<void> _getCommunity(int pageKey) async {
    print("getCommunity pageKey = ${pageKey}");
    final response =
        // await PostProvider().getPosts(userController.user.value.user_id);
    await PostProvider().getPosts("userid");
    if (currentPage == 1) {
      _pagingController.itemList?.clear();
    }

    if (response.statusCode == 200) {
      print("get Post success");
      List<Post>? dataList = [];
      Paginate paginate = Paginate.fromJson(response.body);
      if (paginate.to != null) {
        List<dynamic>? tempList = paginate.data;

        for (dynamic item in tempList!) {
          if (item is Map<String, dynamic>) {
            Post postModel = Post.fromJson(item);
            dataList!.add(postModel);
          }
        }
        setState(() {
        });

        final isLastPage = paginate.to == paginate.total;
        print("isLastPage = $isLastPage");
        if (isLastPage) {
          _pagingController.appendLastPage(dataList!);
        } else {
          final nextPageKey = pageKey + dataList!.length;
          _pagingController.appendPage(dataList!, nextPageKey as int?);
          currentPage = currentPage + 1;
        }
      } else {
        _pagingController.appendLastPage(dataList!);
      }
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void reloadPage() {
    print("reloadPage");
    currentPage = 1;
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            Image.asset("assets/icons/logo_horizontal.png", width: 200,),
            Divider(height: 1, color: lineColor,),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  reloadPage();
                  return Future<void>.delayed(const Duration(milliseconds: 500));
                },
                child: PagedListView(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Post>(
                    newPageProgressIndicatorBuilder: (context) => Container(),
                    firstPageProgressIndicatorBuilder: (context) => Center(
                        child: textM("게시글이 없습니다.", text4Color, FontWeight.normal)),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                        child: textM("게시글이 없습니다.", text4Color, FontWeight.normal)),
                    itemBuilder: (context, item, index) => buildCommunity(item),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCommunity(Post post) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailPost(), arguments: post.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: mainGray))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
                contentPadding: EdgeInsets.zero,
                leading: loadUserProfile(post.user_filepath, 40),
                title: textS(post.user_nickname, text3Color, FontWeight.normal),
                trailing: textXS(
                    calDate(post.created_at!), text5Color, FontWeight.normal)),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: contentLabelMax2Line(post.content!),
            ),
            post.filetype != null && post.filetype != ""
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.network(
                              post.filepath!.split(',')[0],
                              width: Get.height,
                              height: 180,
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: post.filepath!.split(',').length > 1
                                ? Container(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 16, right: 16),
                                    decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Text(
                                      "+${post.filepath!.split(',')!.length - 1}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : Container())
                      ],
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Icon(Icons.favorite_border, color: text5Color,),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 16),
                    child: textS(post.like_cnt.toString(), text5Color,
                        FontWeight.normal),
                  ),
                  Icon(Icons.chat_outlined, color: text5Color,),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                    ),
                    child: textXS(
                        post.cmt_cnt.toString(), text5Color, FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
