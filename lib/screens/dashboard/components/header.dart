import 'package:admin/models/RecentFile.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  final addNewItem;
  RecentFile? data;

  Header(
    this.addNewItem, {
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // if (!Responsive.isDesktop(context))
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: context
        //         .read<MenuController>()
        //         .controlMenu,
        //   ),
        if (!Responsive.isMobile(context))
          InkWell(
            onTap: () async {
              await _showPopup(context, setData);
              addNewItem(data);
            },
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.45),
              margin: EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.add),
            ),
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        //ProfileCard()
      ],
    );
  }

  setData(RecentFile data) {
    this.data = data;
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}

Future _showPopup(context, Function(RecentFile data) setData) {
  final _formKey = GlobalKey<FormState>();
  final oncTextController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              backgroundColor: secondaryColor,
              title: Text("New Item"),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Positioned(
                      right: -35.0,
                      top: -85.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          backgroundColor: primaryColor,
                          radius: 15,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.upload),
                                      onPressed: () {},
                                      label: Text("Upload"),
                                    ), // button 1
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.upload),
                                      onPressed: () {},
                                      label: Text("Upload"),
                                    ), // button 2
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  //icon: Icon(Icons.date_range_outlined),
                                  labelText: 'Date',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  //icon: Icon(Icons.account_circle),
                                  labelText: 'ADELI',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter ADELI';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  //icon: Icon(Icons.account_circle),
                                  labelText: 'NSS',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter NSS';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  //icon: Icon(Icons.account_circle),
                                  labelText: 'ONC',
                                ),
                                controller: oncTextController,autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter ONC';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                child: Text("OK"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    setData(RecentFile(
                                      title: oncTextController.text,
                                      icon: "assets/icons/xd_file.svg",
                                      date: "01-03-2021",
                                      size: "3.5mb",
                                    ));
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}
