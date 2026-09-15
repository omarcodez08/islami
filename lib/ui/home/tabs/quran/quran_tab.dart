import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/app_constants.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/ui/home/tabs/quran/widgets/most_recent_item.dart';
import 'package:islami/ui/home/tabs/quran/widgets/sura_item.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AssetsManager.quranBack, fit: BoxFit.cover),
          Image.asset(AssetsManager.quranGradientBg, fit: BoxFit.cover),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManager.header,
                    width: screenWidth * 0.7,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 21),
                TextField(
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: ColorsManager.goldColor,
                  ),
                  cursorColor: ColorsManager.goldColor,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        AssetsManager.quranTab,
                        colorFilter: const ColorFilter.mode(
                          ColorsManager.goldColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: ColorsManager.goldColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: ColorsManager.goldColor,
                      ),
                    ),
                    hintText: StringsManager.suraName,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorsManager.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(StringsManager.mostRecent, style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.whiteColor,
                  ),),
                SizedBox(height: 10),
                SizedBox(
                  height: screenHeight * 0.16,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MostRecentItem();
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: 10,
                  ),
                ),
                SizedBox(height: 10),
                Text(StringsManager.surasList, style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.whiteColor,
                  ),),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => SuraItem(AppConstants.suraList[index]),
                      separatorBuilder: (context, index) =>
                          Divider(
                        thickness: 1,color: ColorsManager.whiteColor,
                            indent: 40,
                            endIndent: 40,

                      ),
                      itemCount:AppConstants.suraList.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
