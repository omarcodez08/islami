import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import '../../../../../model/hadeeth_model.dart';

class HadeethItem extends StatefulWidget {
  int index;
  HadeethItem(this.index);

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  @override
  void initState() {
    super.initState();
    readFile();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RoutesManager.hadethDetailRouteName,arguments: hadeethModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsManager.goldColor
        ),
        child: hadeethModel==null
            ?Center(child: CircularProgressIndicator(),)
            :Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8,
                  right: 12,
                  top: 12
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.blackLeftCorner),
                      Image.asset(AssetsManager.blackRightCorner),
                    ],
                  ),
                  Text(hadeethModel?.title??"",style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.blackColor
                  ),),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Stack(
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        Expanded(
                            flex: 4,
                            child: Image.asset(AssetsManager.hadeethCardBackground,
                              width: double.infinity,
                              fit: BoxFit.fill,)),
                        Expanded(
                          child: Image.asset(AssetsManager.mosque02,
                            width: double.infinity,
                            fit: BoxFit.cover,),
                        )
                      ],
                    ),
                    Text(
                      hadeethModel?.content??"",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 13,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.blackColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  HadeethModel? hadeethModel;

  readFile()async{
    String hadeethText = await rootBundle.loadString("assets/hadeeth/h${widget.index+1}.txt");
    List<String> hadeethLines = hadeethText.split("\n");
    String title = hadeethLines[0];
    hadeethLines.removeAt(0);
    String content = hadeethLines.join(" ");
    setState(() {
      hadeethModel = HadeethModel(
          title: title,
          content: content,
          number: widget.index+1);
    });
  }
}