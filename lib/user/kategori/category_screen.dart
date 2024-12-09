import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'widget/biografimemoar_screen.dart';
import 'widget/buddhismehinduisme_screen.dart';
import 'widget/bisnisinvestasi_screen.dart';
import 'widget/bukuanak_screen.dart';
import 'widget/kristen_screen.dart';
import 'widget/klasik_screen.dart';
import 'widget/komiknovelgrafis_screen.dart';
import 'widget/komputerteknologi_screen.dart';
import 'widget/fiksisastra_screen.dart';
import 'widget/fiksisejarah_screen.dart';
import 'widget/sejarah_screen.dart';
import 'widget/hororparanormal_screen.dart';
import 'widget/islam_screen.dart';
import 'widget/bukumotivasi_screen.dart';
import 'widget/misteri_screen.dart';
import 'widget/nonfiksi_screen.dart';
import 'widget/filsafat_screen.dart';
import 'widget/puisicerpen_screen.dart';
import 'widget/psikologi_screen.dart';
import 'widget/kamus_screen.dart';
import 'widget/agamaspiritual_screen.dart';
import 'widget/romansa_screen.dart';
import 'widget/fantasi_screen.dart';
import 'widget/travel_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            DashboardItem(
              icon: Icons.article,
              label: 'Biografi',
              onTap: () =>
                  navigateToScreen(context, const BiografimemoarScreen()),
            ),
            DashboardItem(
              icon: Icons.self_improvement,
              label: 'Buddha & Hindu',
              onTap: () =>
                  navigateToScreen(context, const BuddhismehinduismeScreen()),
            ),
            DashboardItem(
              icon: Icons.attach_money,
              label: 'Bisnis',
              onTap: () =>
                  navigateToScreen(context, const BisnisinvestasiScreen()),
            ),
            DashboardItem(
              icon: Icons.school,
              label: 'Anak',
              onTap: () => navigateToScreen(context, const BukuanakScreen()),
            ),
            DashboardItem(
              icon: Icons.church,
              label: 'Kristen',
              onTap: () => navigateToScreen(context, const KristenScreen()),
            ),
            DashboardItem(
              icon: Icons.menu_book,
              label: 'Klasik',
              onTap: () => navigateToScreen(context, const KlasikScreen()),
            ),
            DashboardItem(
              icon: Icons.book,
              label: 'Komik & Novel',
              onTap: () =>
                  navigateToScreen(context, const KomiknovelgrafisScreen()),
            ),
            DashboardItem(
              icon: Icons.computer,
              label: 'Komputer',
              onTap: () =>
                  navigateToScreen(context, const KomputerteknologiScreen()),
            ),
            DashboardItem(
              icon: Icons.library_books,
              label: 'Fiksi & Sastra',
              onTap: () => navigateToScreen(context, const FiksisastraScreen()),
            ),
            DashboardItem(
              icon: MdiIcons.crown,
              label: 'Fiksi Sejarah',
              onTap: () =>
                  navigateToScreen(context, const FiksisejarahScreen()),
            ),
            DashboardItem(
              icon: Icons.history,
              label: 'Sejarah',
              onTap: () => navigateToScreen(context, const SejarahScreen()),
            ),
            DashboardItem(
              icon: Icons.dark_mode,
              label: 'Horror',
              onTap: () =>
                  navigateToScreen(context, const HororparanormalScreen()),
            ),
            DashboardItem(
              icon: Icons.mosque,
              label: 'Islam',
              onTap: () => navigateToScreen(context, const IslamScreen()),
            ),
            DashboardItem(
              icon: Icons.lightbulb,
              label: 'Motivasi',
              onTap: () =>
                  navigateToScreen(context, const BukumotivasiScreen()),
            ),
            DashboardItem(
              icon: Icons.question_mark,
              label: 'Misteri & Thriller',
              onTap: () => navigateToScreen(context, const MisteriScreen()),
            ),
            DashboardItem(
              icon: Icons.book_outlined,
              label: 'Non-Fiksi',
              onTap: () => navigateToScreen(context, const NonfiksiScreen()),
            ),
            DashboardItem(
              icon: Icons.psychology_alt,
              label: 'Filsafat',
              onTap: () => navigateToScreen(context, const FilsafatScreen()),
            ),
            DashboardItem(
              icon: Icons.edit,
              label: 'Puisi & Cerpen',
              onTap: () => navigateToScreen(context, const PuisicerpenScreen()),
            ),
            DashboardItem(
              icon: Icons.psychology,
              label: 'Psikologi',
              onTap: () => navigateToScreen(context, const PsikologiScreen()),
            ),
            DashboardItem(
              icon: Icons.library_books,
              label: 'Kamus',
              onTap: () => navigateToScreen(context, const KamusScreen()),
            ),
            DashboardItem(
              icon: MdiIcons.handsPray,
              label: 'Agama',
              onTap: () =>
                  navigateToScreen(context, const AgamaspiritualScreen()),
            ),
            DashboardItem(
              icon: Icons.favorite,
              label: 'Romansa',
              onTap: () => navigateToScreen(context, const RomansaScreen()),
            ),
            DashboardItem(
              icon: Icons.science,
              label: 'Fantasi',
              onTap: () => navigateToScreen(context, const FantasiScreen()),
            ),
            DashboardItem(
              icon: Icons.flight,
              label: 'Travel',
              onTap: () => navigateToScreen(context, const TravelScreen()),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DashboardItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            elevation: 4,
            shape: const CircleBorder(),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Icon(icon, size: 30, color: Colors.blueAccent),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
