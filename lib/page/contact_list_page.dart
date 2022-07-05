import 'package:flutter/material.dart';
import 'package:wamobile/model/contact.dart';
import 'package:wamobile/page/about_app_page.dart';
import 'package:wamobile/page/contact_detail_page.dart';
import 'package:wamobile/page/insert_contact_page.dart';
import 'package:wamobile/presenter/contact_presenter.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactListPage();
  }
}

class _ContactListPage extends State<ContactListPage> {
  var presenter = ContactPresenter();
  List<Contact> contactList = [];
  var isDataExist = true;
  double height = 0;

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 16, top: 30, right: 16, bottom: 20),
            child: Column(
              children: [
                _aboutAppButton(),
                _header(),
                _searchBar(),
                isDataExist ? _contactList() : _noDataWidget()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InsertContactPage();
          })).then((value) => getContacts());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _aboutAppButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
      alignment: Alignment.centerRight,
      child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutAppPage();
            }));
          },
          icon: Icon(
            Icons.info_outline,
            color: Colors.black,
            size: 30,
          )),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      alignment: Alignment.center,
      child: Text(
        "wa.me Mobile",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
            fontSize: 30),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
        padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xFFF2F4F6)),
            color: Color(0xFFF2F4F6),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.search),
              ),
            ),
            Expanded(
                child: TextField(
              onChanged: _doSearch,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "Cari nama atau nomor", border: InputBorder.none),
            ))
          ],
        ));
  }

  Widget _contactGrid() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 320,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: contactList.length,
          itemBuilder: (BuildContext ctx, index) {
            return _contactItemSquare(contactList[index]);
          }),
    );
  }

  Widget _contactList() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _contactItem(contactList[index]);
                },
                itemCount: contactList.length,
              );
            } else {
              return _contactGrid();
            }
          },
        ));
  }

  Widget _contactItemSquare(Contact contact) {
    return InkWell(
      onTap: () {
        _goToDetailContact(contact);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(8),
                child: IconButton(
                  color: Colors.red,
                  icon: Icon(
                    Icons.close_outlined,
                  ),
                  onPressed: () {
                    deleteContact(contact);
                  },
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 1,
                      child: Image.asset('images/person.png'),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                      alignment: Alignment.center,
                      child: Text(
                        "${contact.name}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "${contact.phone}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactItem(Contact contact) {
    return Container(
      child: InkWell(
        onTap: () {
          _goToDetailContact(contact);
        },
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'images/person.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          "${contact.name}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "${contact.phone}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: () {
                      deleteContact(contact);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteContact(Contact contact) async {
    await presenter.deleteContact(contact);
    getContacts();
  }

  void getContacts() async {
    var contacts = await presenter.getContactList();
    setState(() {
      contactList = contacts;
      isDataExist = contactList.isNotEmpty;
      print(contactList);
    });
  }

  void _doSearch(String value) async {
    if (value.length > 2) {
      List<Contact> list = await presenter.getContactList();
      var result = list.where((element) =>
          element.phone!.contains(value) || element.name!.contains(value));
      setState(() {
        contactList = result.toList();
        isDataExist = contactList.isNotEmpty;
      });
    } else {
      getContacts();
    }
  }

  _goToDetailContact(Contact contact) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContactDetailPage(contact);
    })).then((value) => getContacts());
  }

  Widget _noDataWidget() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 16, bottom: 4, right: 16),
              child: Icon(
                Icons.not_interested,
                size: 100,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Tidak ada data ditemukan!",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
