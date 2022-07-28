import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List _widgetOptions = <Widget>[PageOne(), PageTwo()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            _selectedIndex == 0 ? const Color(0xff050A30) : Colors.white,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.navigation),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              onTap: _onItemTapped,
            ),
          ),
        ),
        body: SafeArea(child: _widgetOptions[_selectedIndex]));
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                const Text(
                  'Overview',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                activeNotificationIcon(),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            subHeading(),
            const SizedBox(
              height: 60,
            ),
            cardList()
          ],
        ));
  }

  SizedBox cardList() {
    return SizedBox(
      height: 500,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        card(),
        card(),
        card(),
      ]),
    );
  }

  Padding card() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(children: [
        Container(
          height: 450,
          width: 300,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            children: [
              Image.asset('assets/violin.png'),
              const Text(
                'Strumming Pattern',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text(
                'Keep Your Strumping ',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w300),
                softWrap: true,
                //new
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Hand moving all the times, even ...',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w300),
                softWrap: true,
                //new
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 50,
          left: 50,
          child: Container(
            height: 80,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.purple.shade500,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: const Center(
              child: Text(
                'Trial Lesson',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Column subHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'You will get Accostic',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 26),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Guitar lessons',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 26),
        )
      ],
    );
  }

  Stack activeNotificationIcon() {
    return Stack(
      children: const [
        Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        Positioned(
          left: 12,
          child: Icon(
            Icons.circle,
            color: Colors.red,
            size: 10,
          ),
        ),
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: ListView(
        children: [
          subHeading(),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Popular ',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Courses',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              cardList()
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Professional ',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Trainer',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              listTitle(),
              listTitle(),
              listTitle(),
            ],
          )
        ],
      ),
    );
  }

  Card listTitle() {
    return Card(
      elevation: 0,
      color: const Color(0xffECDDFD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1644982652061-df82282e178d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
        ),
        title: Text(
          "Martin Kenter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "10 lessons",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(
              0xff808080,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black,
        ),
      ),
    );
  }

  SizedBox cardList() {
    return SizedBox(
      height: 220,
      child: ListView(
        primary: false,
        // 3
        // 4
        scrollDirection: Axis.horizontal,
        children: [
          card(),
          card(),
          card(),
          card(),
        ],
      ),
    );
  }

  Padding card() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1595411425732-e69c1abe2763?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Accostic Guitar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "10 lessons",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(
                0xff808080,
              ),
            ),
          )
        ],
      ),
    );
  }

  Column subHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingOne(),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Find Your favorite',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        ),
        const Text(
          'course here',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            searchBox(),
            Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: const Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                )),
          ],
        )
      ],
    );
  }

  SizedBox searchBox() {
    return const SizedBox(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
            fillColor: Color(
              0xffe1f5fe,
            ),
            filled: true,
            hintStyle: TextStyle(
              fontSize: 20.0,
              color: Color(
                0xff01579b,
              ),
            ),
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            )),
      ),
    );
  }

  Row headingOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: RichText(
                text: const TextSpan(
                  text: 'Hi, ',
                  style: TextStyle(fontSize: 26, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Laura!',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ],
        ),
        activeNotificationIcon()
      ],
    );
  }

  Stack activeNotificationIcon() {
    return Stack(
      children: const [
        Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        Positioned(
          left: 12,
          child: Icon(
            Icons.circle,
            color: Colors.red,
            size: 10,
          ),
        ),
      ],
    );
  }
}
