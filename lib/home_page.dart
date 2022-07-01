import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wamobile/create_contact_page.dart';
import 'package:wamobile/detail_contact_page.dart';
import 'package:wamobile/model/contact.dart';
import 'package:wamobile/presenter/contact_presenter.dart';
import 'package:wamobile/util/ColorUtil.dart';
import 'package:wamobile/util/hex_color.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
          padding: EdgeInsets.only(left: 16, top: 30, right: 16, bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),
              _searchBar(),
              isDataExist ? _contactList() : _noDataWidget()
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateContactPage();
          })).then((value) => getContacts());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Selamat Datang di",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
                fontSize: 30),
          ),
          Row(
            children: [
              Flexible(
                child: Text("WA.me Mobile",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: ColorUtil.mainColor,
                    ),
                    onPressed: null),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
        padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(30)),
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
                  hintText: "Cari nama atau nomor whatsup",
                  border: InputBorder.none),
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
                      padding: EdgeInsets.all(4),
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
    return InkWell(
      onTap: () {
        _goToDetailContact(contact);
      },
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.person,
                    color: ColorUtil.mainColor,
                    size: 50,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 4),
                      child: Text(
                        "${contact.name}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("${contact.phone}")
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(8),
                  child: IconButton(
                    icon: Icon(Icons.delete,
                      color: Colors.red,),
                    onPressed: () {
                      deleteContact(contact);
                    },
                  ),
                )
              ],
            ),
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
      return DetailContactPage(contact);
    })).then((value) => getContacts());
  }

  Widget _noDataWidget() {
    return Container(
      alignment: Alignment.center,
      height: height - 300,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Icon(Icons.do_not_disturb_alt,color: Colors.grey, size: 100,)),
          Flexible(
            child: Text("Tidak ada data ditemukan!",
            textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
