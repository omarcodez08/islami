import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/ui/home/tabs/hadeeth/widgets/hadeeth_item.dart';

class HadeethTab extends StatelessWidget {
PageController pageController=PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(AssetsManager.hadeeth_bg),
          opacity: 0.2,
        ),
      ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              spacing: 30,
              children: [
                Image.asset(AssetsManager.header,width: screenWidth*0.75,fit: BoxFit.fitWidth,),
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 50,
                    itemBuilder: (context, index) =>HadeethItem(index),
                 ),
                )
              ],
            ),
          ),
        ),
    );
  }
}