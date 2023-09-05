import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/globals/custom_widgets.dart';
import 'package:meister2/providers/alert_provider.dart';

import '../globals/custom_functions.dart';
import '../globals/custom_size.dart';
import '../models/alert.dart';
import '../models/paginate.dart';

class TabAlert extends StatefulWidget {
  const TabAlert({Key? key}) : super(key: key);

  @override
  State<TabAlert> createState() => _TabAlertState();
}

class _TabAlertState extends State<TabAlert> {
  late int currentPage;

  final PagingController<int, Alert> _pagingController =
  PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 1;
    _pagingController.addPageRequestListener((pageKey) {
      _getAlert(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _getAlert(int pageKey) async {
    final response = await AlertProvider().getLists("Pv33SNy9QG",currentPage);

    if (response.statusCode == 200) {
      print("response success");
      List<Alert>? alertList = [];
      Paginate paginate = Paginate.fromJson(response.body);
      if (paginate.to != null) {
        List<dynamic>? dataList = paginate.data;
        for (dynamic item in dataList!) {
          if (item is Map<String, dynamic>) {
            Alert alertModel = Alert.fromJson(item);
            alertList!.add(alertModel);
          }
        }
        setState(() {
          alertList = alertList;
        });

        final isLastPage = paginate.to == paginate.total;
        print("isLastPage = $isLastPage");
        if (isLastPage) {
          _pagingController.appendLastPage(alertList!);
        } else {
          final nextPageKey = pageKey + alertList!.length;
          _pagingController.appendPage(
              alertList!, nextPageKey as int?);
          currentPage = currentPage + 1;
        }
      } else {
        _pagingController.appendLastPage(alertList!);
      }
    }
  }

  void reloadPage(){
    print("reloadPage");
    currentPage = 1;
    _pagingController.refresh();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: textM("알림", text2Color, FontWeight.normal),
      ),
      body: Container(
        height: Get.height,
        color: Colors.white,
        child: RefreshIndicator( onRefresh: () {
          reloadPage();
          return Future<void>.delayed(const Duration(milliseconds: 500));
        },
          child: PagedListView(pagingController: _pagingController,  builderDelegate: PagedChildBuilderDelegate<Alert>(
            newPageProgressIndicatorBuilder: (context) => Container(),
            firstPageProgressIndicatorBuilder: (context) => Center(child: textM("알림이 없습니다.", text4Color, FontWeight.normal)),
            noItemsFoundIndicatorBuilder: (context) => Center(child: textM("알림이 없습니다.", text4Color, FontWeight.normal)),
            itemBuilder: (context, item, index) => Column(
              children: [
                alertItem(item)
              ],
            ),
          ),),),
      ),
    );
  }

  Widget alertItem(Alert alert){

    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: mainGray)),
          color: alert.view_at == null ? mainColor.withOpacity(0.5) : Colors.white
      ),
      child: ListTile(
        title: Text("${alert.title!}",maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: fontSizeS, fontWeight: FontWeight.normal, color: text3Color),),
        trailing: Text(daySplitShort(alert.created_at!), style: TextStyle(fontSize: fontSizeXXS, color: text4Color),),
        onTap: () async {
          if(alert.view_at == null){
            alert.view_at = DateTime.now().toString();
            print(alert.toReg());
            final response = await AlertProvider().updateContent(alert.id!, alert.toReg());
            // print(response.body);
            if(response.statusCode == 200){
              setState(() {});
              reloadPage();
            }
          }
        },
      ),
    );
  }

}
