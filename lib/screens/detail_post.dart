import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/providers/post_cmt_provider.dart';
import 'package:meister2/providers/post_provider.dart';
import 'package:meister2/providers/report_provider.dart';

import '../dialogs/dialog_delete.dart';
import '../dialogs/dialog_report.dart';
import '../globals/custom_functions.dart';
import '../globals/custom_size.dart';
import '../globals/custom_widgets.dart';
import '../globals/globals.dart';
import '../models/like.dart';
import '../models/paginate.dart';
import '../models/post.dart';
import '../models/post_cmt.dart';
import '../models/report.dart';
import '../providers/like_provider.dart';

class DetailPost extends StatefulWidget {
  const DetailPost({Key? key}) : super(key: key);

  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  Post post = Post();
  int postId = 0;
  List<String> file_list = [];

  final CarouselController _controller = CarouselController();
  int _current = 0;
  int currentPage = 1;
  Like like = Like();
  Like cmtLike = Like();

  final PagingController<int, PostCmt> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);

  TextEditingController cmt_ct = TextEditingController();
  String cmtType = "reg"; // reg , edit , reply, reply_edit

  PostCmt postCmt = PostCmt(content: "");
  PostCmt selectedCmt = PostCmt();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.arguments != null) {
      postId = Get.arguments;
      _getPost();
    }

    currentPage = 1;
    _pagingController.addPageRequestListener((pageKey) {
      _getPostCmt(pageKey);
    });

    postCmt.post_id = postId;
    postCmt.user_id = userController.user.value.user_id!;

    // 댓글 좋아요 용
    cmtLike.user_id = userController.user.value.user_id;
    cmtLike.top_category = "post_cmts";

    // 포스트 좋아요 용
    like.user_id = userController.user.value.user_id;
    like.top_category = "posts";
    like.category_id = postId.toString();
  }


  Future<void> _getPostCmt(int pageKey) async {
    final response =
    await PostCmtProvider().getLists(postId, "Pv33SNy9QG", currentPage);

    print("getpostcmt ${response.statusCode}");
    if (response.statusCode == 200) {
      List<PostCmt>? postCmtList = [];
      Paginate paginate = Paginate.fromJson(response.body);
      if (paginate.to != null) {
        List<dynamic>? dataList = paginate.data;
        for (dynamic item in dataList!) {
          if (item is Map<String, dynamic>) {
            PostCmt postCmtModel = PostCmt.fromJson(item);
            postCmtList!.add(postCmtModel);
          }
        }

        setState(() {
          postCmtList = postCmtList;
        });

        final isLastPage = paginate.to == paginate.total;
        print("isLastPage = $isLastPage");
        if (isLastPage) {
          _pagingController.appendLastPage(postCmtList!);
          print("postCmtList = ${_pagingController.itemList!.length}");
        } else {
          final nextPageKey = pageKey + postCmtList!.length;
          _pagingController.appendPage(postCmtList!, nextPageKey as int?);
          currentPage = currentPage + 1;
        }
      } else {
        _pagingController.appendLastPage(postCmtList!);
      }
      print("cmt info");
    }
  }
  Future<void> _getPost() async {
      final response = await PostProvider().getDetail(postId, "Pv33SNy9QG");

      if (response.statusCode == 200) {
        if (response.body != null) {
          setState(() {
            post = Post.fromJson(response.body);
            if (post.filepath != null) {
              file_list = post.filepath!.split(",");
            }
            print("post ${post.toJson()}");
          });
        } else {
          showSnackBar("no_data".tr, "no_data_content".tr);
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: file_list.length > 0 ? true : false,
        appBar: AppBar(
          backgroundColor:
              file_list.length > 0 ? Colors.transparent : Colors.white,
          titleSpacing: 0,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, size: 36,color: Colors.white,),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (post.like_it != null && post.like_it == 1) {
                  final response =
                      await LikeProvider().deleteContent(post.like_id!);
                  print("response statusCode = ${response.statusCode}");
                  if (response.statusCode == 204) {
                    setState(() {
                      post.like_it = 1;
                      post.like_id = 0;
                    });
                  }
                } else {
                  like.user_id = "Pv33SNy9QG";
                  final response =
                      await LikeProvider().insertContent(like.toJson());
                  if (response.statusCode == 201) {
                    like = Like.fromJson(response.body);
                    setState(() {
                      post.like_it = 1;
                      post.like_id = like.id;
                    });
                  }
                }
              },
              icon: Icon(
                Icons.favorite,
                color: post.like_it == 1 ? mainColor : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                btmSheet(postSheet(), context, 16.0);
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: file_list.length > 0 ? Colors.white : Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          height: Get.height,
          color: Colors.white,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    file_list.length > 0 ? imageWidget() : Container(),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: lineColor))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: loadUserProfile(post.user_filepath, 60),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: textM(post.user_nickname, text3Color,
                                  FontWeight.normal),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 16),
                            child: textS(
                                post.content!, text3Color, FontWeight.normal),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 16,
                            ),
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Icon(Icons.visibility),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 8),
                                  child: textXS(post.view_cnt.toString(),
                                      text4Color, FontWeight.normal),
                                ),
                                Icon(Icons.favorite_border),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 8),
                                  child: textXS(post.like_cnt.toString(),
                                      text4Color, FontWeight.normal),
                                ),
                                Icon(Icons.chat),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  child: textXS(post.cmt_cnt.toString(),
                                      text4Color, FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: PagedListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate<PostCmt>(
                          newPageProgressIndicatorBuilder: (context) =>
                              Container(),
                          firstPageProgressIndicatorBuilder: (context) =>
                              Container(
                                  height: 200,
                                  child: Center(
                                      child: textS("댓글이 없습니다.", text4Color,
                                          FontWeight.normal))),
                          noItemsFoundIndicatorBuilder: (context) => Container(
                              height: 200,
                              child: Center(
                                  child: textS("댓글이 없습니다.", text4Color,
                                      FontWeight.normal))),
                          itemBuilder: (context, item, index) => Container(
                            child: commentItem(
                              item,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: cmtWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              height: 320,
              aspectRatio: 1 / 1,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            carouselController: _controller,
            items: file_list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        i!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: sliderIndicator())
        ],
      ),
    );
  }

  Widget commentItem(PostCmt postCmt) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(bottom: 0),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadUserProfile(postCmt.user_filepath, 50),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textS(postCmt.user_nickname, text1Color,
                            FontWeight.normal),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (postCmt.like_it != null &&
                                postCmt.like_it == 1) {
                              final response = await LikeProvider()
                                  .deleteContent(postCmt.like_id!);
                              print(response.statusCode);
                              if (response.statusCode == 204) {
                                setState(() {
                                  postCmt.like_it = 0;
                                });
                              }
                            } else {
                              cmtLike.user_id = "Pv33SNy9QG";
                              cmtLike.top_category = "post_cmts";
                              cmtLike.category_id = postCmt.id.toString();
                              final response = await LikeProvider()
                                  .insertContent(cmtLike.toJson());
                              if (response.statusCode == 201) {
                                setState(() {
                                  cmtLike = Like.fromJson(response.body);
                                  postCmt.like_it = 1;
                                  postCmt.like_id = cmtLike.id;
                                });
                              }
                            }
                          },
                          padding: EdgeInsets.only(right: 8),
                          constraints: BoxConstraints(),
                          icon: Icon(
                            Icons.favorite_border,
                            color:
                                postCmt.like_it == 1 ? mainColor : Colors.grey,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              btmSheet(cmtSheet(postCmt), context, 16.0);
                            },
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(Icons.more_vert_rounded)),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: textXS(postCmt.content, text4Color, FontWeight.normal),
                ),
                Row(
                  children: [
                    textXS(calDate(postCmt.created_at!), text4Color,
                        FontWeight.normal),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: file_list.asMap().entries.map((i) {
        return GestureDetector(
          onTap: () {
            _controller.animateToPage(i.key);
          },
          child: Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == i.key
                    ? Colors.white
                    : Colors.grey.withOpacity(0.5)),
          ),
        );
      }).toList(),
    );
  }

  Widget cmtWidget() {
    return Container(
      color: Colors.white,
      child: ListTile(
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.only(left: 16, right: 8),
        leading: loadUserProfile(userController.user.value.filepath, 50),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            color: mainGray,
          ),
          padding: EdgeInsets.only(left: 16, right: 16),
          margin: EdgeInsets.only(top: 8, bottom: 8, left: 8),
          child: TextField(
            maxLines: null,
            controller: cmt_ct,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "댓글을 남겨보세요",
              hintStyle: TextStyle(color: text5Color, fontSize: fontSizeS),
            ),
            onChanged: (value) {
              setState(() {
                postCmt.content = cmt_ct.text!;
              });
            },
          ),
        ),
        trailing: IconButton(
          onPressed: () async {
            if (checkValid()) {
              if (cmtType == 'reg') {
                postCmt.user_id = "Pv33SNy9QG";
                final response =
                    await PostCmtProvider().insertContent(postCmt.toReg());
                if (response.statusCode == 201) {
                  _pagingController.refresh();
                  setState(() {
                    cmtType = "reg";
                    cmt_ct.text = "";
                  });
                }
                FocusScope.of(context).unfocus();
              } else if (cmtType == 'edit') {
                final response = await PostCmtProvider()
                    .updateContent(postCmt.id!, postCmt.toJson());
                if (response.statusCode == 200) {
                  _pagingController.refresh();
                  cmt_ct.clear();
                  setState(() {
                    cmtType = "reg";
                  });
                }
                FocusScope.of(context).unfocus();
              }
            }
          },
          icon: Icon(Icons.send,
              color: postCmt.content != null && postCmt.content!.length > 5 ? mainColor : Colors.grey),
        ),
      ),
    );
  }

  bool checkValid() {
    if (cmt_ct.text.trim().length < 2) {
      showSnackBar("입력 확인", "내용을 2글자 이상 적어주세요.");
      return false;
    }
    return true;
  }

  Widget postSheet() {
    return Container(
      child: post.user_id == userController.user.value.user_id
          ? Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Icon(Icons.edit)
                  ),
                  title: textM("수정", text3Color, FontWeight.normal),
                  onTap: () async {
                    Get.back();
                    print(post.toJson());
                    final response = await Get.toNamed("/reg_post", arguments: {
                      "type": "edit",
                      "post": post
                    });
                    if (response == 'reload') {
                      _getPost();
                    }
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Icon(Icons.delete_outline_outlined)
                  ),
                  title: textM("삭제", text3Color, FontWeight.normal),
                  onTap: () async {
                    Get.back();
                    final response = await showDialog(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return DialogDelete();
                      },
                    );
                    if (response == 'delete') {
                      final response2 =
                          await PostProvider().deleteContent(postId);
                      if (response2.statusCode == 204) {
                        Get.back();
                      }
                    }
                  },
                ),
              ],
            )
          : Column(
              children: [
                ListTile(
                  onTap: () async {
                    Get.back();
                    final response = await showDialog(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return DialogReport();
                      },
                    );
                    if (response != null) {
                      Report report = Report();
                      report.user_id = userController.user.value.user_id!;
                      report.status = "registered";
                      report.top_category = 'posts';
                      report.category_id = post.id.toString();

                      final Response response2 = await ReportProvider()
                          .insertContent(report.toJson());
                      if (response2.statusCode == 201) {
                        Get.back();
                      }
                    }
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Icon(Icons.block)
                  ),
                  title: textM("신고", text3Color, FontWeight.normal),
                ),
              ],
            ),
    );
  }

  Widget cmtSheet(PostCmt postCmt) {
    return Container(
      child: postCmt.user_id == userController.user.value.user_id
          ? Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Icon(Icons.edit)
                  ),
                  title: textM("수정", text3Color, FontWeight.normal),
                  onTap: () async {
                    Get.back();
                    cmtType = "edit";
                    this.postCmt = postCmt;
                    cmt_ct.text = postCmt.content!;
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Icon(Icons.delete_outline)
                  ),
                  title: textM("삭제", text3Color, FontWeight.normal),
                  onTap: () async {
                    Get.back();
                    final response = await showDialog(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return DialogDelete();
                      },
                    );
                    if (response == 'delete') {
                      final response2 = await PostCmtProvider().deleteContent(
                          postCmt.id!);
                      if (response2.statusCode == 204) {
                        reloadPage();
                      }
                    }
                  },
                ),
              ],
            )
          : Column(
              children: [
                ListTile(
                  onTap: () async {
                    Get.back();
                    final response = await showDialog(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return DialogReport();
                      },
                    );
                    if (response != null) {
                      Report report = Report();
                      report.user_id = userController.user.value.user_id!;
                      report.status = "registered";
                      report.top_category = 'post_cmts';
                      report.category_id = postCmt.id.toString();

                      final Response response2 = await ReportProvider()
                          .insertContent(report.toJson());
                      if (response2.statusCode == 201) {
                        Get.back();
                        reloadPage();
                      }
                    }
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Icon(Icons.block)
                  ),
                  title: textM("신고", text3Color, FontWeight.normal),
                ),
              ],
            ),
    );
  }

  void reloadPage() {
    print("reloadPage");
    currentPage = 1;
    _pagingController.refresh();
  }
}
