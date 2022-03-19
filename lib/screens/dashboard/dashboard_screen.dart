import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  final recentFiles = RecentFiles();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SizedBox(height: defaultPadding * 5),
            Header(recentFiles.addNewItem),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 5,
                  child: Column(
                    children: [
                      // MyFiles(),
                      SizedBox(height: defaultPadding),
                      recentFiles,
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                // if (!Responsive.isMobile(context))
                //   SizedBox(width: defaultPadding),
                // // On Mobile means if the screen is less than 850 we dont want to show it
                // if (!Responsive.isMobile(context))
                //   Expanded(
                //     flex: 2,
                //     child: StarageDetails(),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
