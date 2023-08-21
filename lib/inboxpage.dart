import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortune/theme/inboxemptytheme.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
      length: 3, // Sekme sayısı
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Gelen Kutusu'),
              pinned: true,
              floating: false,
              snap: false,
              backgroundColor: Colors.black,

              bottom: TabBar(
                indicatorColor: Colors.yellow,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,

                tabs: [
                  Tab(text: 'Fallarım '),
                  Tab(text: 'Favoriler '),
                  Tab(text: 'Bildirimler'),
                ],
              ),
            ),
            //

            SliverFillRemaining(
              child: TabBarView(
                children: [
                  InboxEmptyTheme(title:"Gelen Kutusu Boş" ,
                      icon: FontAwesomeIcons.envelope,
                      description: "Henüz fal baktırmamışsın! senin hakkında söyleceklerimi merak ediyorsan ilk falını bekliyorum",
                      buttonTitle: "Hemen Fal Baktır"),
                  InboxEmptyTheme(title:"Favori Yok" ,
                    icon: FontAwesomeIcons.heart,
                      description: "Favorilerinize fal eklemek için Premium üye olmalısınız",
                      ),
                  InboxEmptyTheme(title:"Henüz Bildirim Yok " ,
                      icon: FontAwesomeIcons.bell,
                      description: "Bildirimlere izin verdiğinde sana özel mesajlarımı burda görebilirsin.Süprizlere hazır ol"
                      ,buttonTitle: "Bildirimlere İzin Ver"),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}
