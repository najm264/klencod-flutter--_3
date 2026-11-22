import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SahabiApp());
}

class AppTheme {
  static const Color background = Color(0xFF0B1315);
  static const Color surface = Color(0xFF132024);
  static const Color surfaceAlt = Color(0xFF1C2D33);
  static const Color border = Color(0xFF283E45);
  static const Color primary = Color(0xFF10B981); // أخضر زمردي
  static const Color gold = Color(0xFFD4AF37); // ذهبي
  static const Color textPrimary = Color(0xFFF0F4F5);
  static const Color textMuted = Color(0xFF94A8AE);

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: gold,
          surface: surface,
          onPrimary: Colors.white,
          onSurface: textPrimary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surfaceAlt,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: primary, width: 1.5),
          ),
        ),
      );
}

class Sahabi {
  final String id;
  final String name;
  final String title;
  final String category;
  final String deathYear;
  final String brief;
  final String details;
  final List<String> highlights;

  const Sahabi({
    required this.id,
    required this.name,
    required this.title,
    required this.category,
    required this.deathYear,
    required this.brief,
    required this.details,
    required this.highlights,
  });
}

// قائمة بيانات الصحابة (يمكنك الإضافة هنا بنفس النمط حتى تصل إلى 100 صحابي)
const List<Sahabi> sahabaData = [
  Sahabi(
    id: '1',
    name: 'أبو بكر الصديق',
    title: 'الصديق - أول الخلفاء الراشدين',
    category: 'العشرة المبشرون',
    deathYear: '13 هـ',
    brief: 'أول من آمن من الرجال، ورفيق النبي ﷺ في الهجرة، وأول الخلفاء الراشدين.',
    details:
        'هو عبد الله بن عثمان التيمي القرشي، عُرف بالصدق والأمانة قبل الإسلام وبعده. ساند النبي ﷺ بماله ونفسه، وأعتق الكثير من المستضعفين كبلال بن رباح. تولى الخلافة بعد وفاة النبي ﷺ، فثبّت أركان الدولة الإسلامية في حروب الردة، وأمر بجمع القرآن الكريم في مصحف واحد.',
    highlights: [
      'أول من أسلم من الرجال',
      'صاحب الغار في الهجرة النبوية',
      'جمع القرآن الكريم في عهده',
    ],
  ),
  Sahabi(
    id: '2',
    name: 'عمر بن الخطاب',
    title: 'الفاروق - ثاني الخلفاء الراشدين',
    category: 'العشرة المبشرون',
    deathYear: '23 هـ',
    brief: 'ثاني الخلفاء الراشدين، عُرف بالعدل والحزم، وفتح في عهده الشام ومصر وفارس.',
    details:
        'هو عمر بن الخطاب العدوي القرشي، أعزّ الله به الإسلام عند إسلامه، ولقّبه النبي ﷺ بالفاروق لأنه فرّق بين الحق والباطل. شهد جميع الغزوات، وفي عهده اتسعت رقعة الدولة الإسلامية بشكل هائل، ووضع التاريخ الهجري، وأنشأ الدواوين وبيت المال.',
    highlights: [
      'أول من لُقب بأمير المؤمنين',
      'واضع التقويم الهجري',
      'فتح القدس واستلم مفاتيحها بنفسه',
    ],
  ),
  Sahabi(
    id: '3',
    name: 'عثمان بن عفان',
    title: 'ذو النورين - ثالث الخلفاء الراشدين',
    category: 'العشرة المبشرون',
    deathYear: '35 هـ',
    brief: 'ثالث الخلفاء الراشدين، اشتهر بالحياء والكرم، وجهّز جيش العسرة.',
    details:
        'هو عثمان بن عفان الأموي القرشي، لُقب بذي النورين لزواجه من ابنتي النبي ﷺ رقية ثم أم كلثوم. كان من السابقين للإسلام، اشترى بئر رومة للمسلمين، وفي خلافته جمع الناس على مصحف واحد (المصحف العثماني) وأنشأ أول أسطول بحري إسلامي.',
    highlights: [
      'استحت منه الملائكة لشدة حيائه',
      'تجهيز جيش العسرة في غزوة تبوك',
      'نسخ المصحف وتوزيعه على الأمصار',
    ],
  ),
  Sahabi(
    id: '4',
    name: 'علي بن أبي طالب',
    title: 'أبو الحسن - رابع الخلفاء الراشدين',
    category: 'العشرة المبشرون',
    deathYear: '40 هـ',
    brief: 'ابن عم النبي ﷺ وزوج ابنته فاطمة، وأول من أسلم من الصبيان.',
    details:
        'هو علي بن أبي طالب الهاشمي القرشي، تربّى في بيت النبوة. نام في فراش النبي ﷺ ليلة الهجرة ليرد الأمانات، واشتهر بشجاعته النادرة في بدر وأحد وخيبر، وبعلمه الغزير وبلاغته وقضائه العادل.',
    highlights: [
      'أول من أسلم من الصبيان',
      'فاتح حصن خيبر',
      'أحد أعلم الصحابة بالقضاء والفقه',
    ],
  ),
  Sahabi(
    id: '5',
    name: 'خالد بن الوليد',
    title: 'سيف الله المسلول',
    category: 'المهاجرون',
    deathYear: '21 هـ',
    brief: 'أعظم قادة الجيوش في التاريخ الإسلامي، لم يُهزم في معركة قط.',
    details:
        'هو خالد بن الوليد المخزومي القرشي، أسلم قبل فتح مكة، ولقّبه النبي ﷺ بسيف الله المسلول بعد أن أنقذ جيش المسلمين في غزوة مؤتة. قاد فتوحات العراق والشام، وكان قائد المسلمين في معركة اليرموك الحاسمة.',
    highlights: [
      'لم يُهزم في أي معركة خاضها',
      'قائد معركة اليرموك',
      'إنقاذ الجيش في غزوة مؤتة',
    ],
  ),
  Sahabi(
    id: '6',
    name: 'بلال بن رباح',
    title: 'مؤذن الرسول ﷺ',
    category: 'المهاجرون',
    deathYear: '20 هـ',
    brief: 'أول مؤذن في الإسلام، ضرب أروع الأمثلة في الصبر والثبات على التوحيد.',
    details:
        'كان من السابقين للإسلام، عذّبه أمية بن خلف في رمضاء مكة فكان يردد "أحدٌ أحد" حتى اشتراه أبو بكر الصديق وأعتقه. اختاره النبي ﷺ ليكون أول مؤذن في الإسلام لجمال صوته، وشهد بدراً والمشاهد كلها.',
    highlights: [
      'أول مؤذن في تاريخ الإسلام',
      'صعد فوق الكعبة وأذّن يوم الفتح',
      'سمع النبي ﷺ دفّ نعليه في الجنة',
    ],
  ),
  Sahabi(
    id: '7',
    name: 'سعد بن معاذ',
    title: 'سيد الأوس',
    category: 'الأنصار',
    deathYear: '5 هـ',
    brief: 'سيد الأوس في المدينة المنورة، اهتز لموته عرش الرحمن.',
    details:
        'أسلم على يد مصعب بن عمير، فأسلم بإسلامه بنو عبد الأشهل جميعاً. كان من أشد الأنصار نصرة للنبي ﷺ في بدر وأحد والخندق. أصيب بسهم في غزوة الخندق، وحكم في بني قريظة بحكم الله، ثم استشهد متأثراً بجراحه.',
    highlights: [
      'اهتز لموته عرش الرحمن',
      'شيع جنازته سبعون ألف ملك',
      'من كبار قادة الأنصار',
    ],
  ),
  Sahabi(
    id: '8',
    name: 'أنس بن مالك',
    title: 'خادم رسول الله ﷺ',
    category: 'الأنصار',
    deathYear: '93 هـ',
    brief: 'خدم النبي ﷺ عشر سنوات، وهو من أكثر الصحابة رواية للحديث.',
    details:
        'قدّمته أمه أم سليم للنبي ﷺ ليخدمه وعمره عشر سنوات، فدعا له النبي ﷺ بكثرة المال والولد وطول العمر. روى عن النبي ﷺ أكثر من 2286 حديثاً، وكان آخر الصحابة موتاً في البصرة.',
    highlights: [
      'لازم النبي ﷺ عشر سنوات كاملة',
      'من المكثرين لرواية الحديث',
      'عاش أكثر من مائة عام',
    ],
  ),
];

class SahabiApp extends StatelessWidget {
  const SahabiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'صحابي',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const SahabaHomePage(),
    );
  }
}

class SahabaHomePage extends StatefulWidget {
  const SahabaHomePage({super.key});

  @override
  State<SahabaHomePage> createState() => _SahabaHomePageState();
}

class _SahabaHomePageState extends State<SahabaHomePage> {
  static const String _favKey = 'sahabi_favorites_v1';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'الكل',
    'العشرة المبشرون',
    'المهاجرون',
    'الأنصار',
    'المفضلة',
  ];

  String _selectedCategory = 'الكل';
  String _searchQuery = '';
  Set<String> _favorites = {};

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList(_favKey) ?? [];
      setState(() => _favorites = list.toSet());
    } catch (_) {}
  }

  Future<void> _toggleFavorite(String id) async {
    setState(() {
      if (_favorites.contains(id)) {
        _favorites.remove(id);
      } else {
        _favorites.add(id);
      }
    });
    HapticFeedback.selectionClick();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_favKey, _favorites.toList());
    } catch (_) {}
  }

  List<Sahabi> get _filteredList {
    return sahabaData.where((s) {
      final matchesCategory = _selectedCategory == 'الكل' ||
          (_selectedCategory == 'المفضلة'
              ? _favorites.contains(s.id)
              : s.category == _selectedCategory);

      final q = _searchQuery.trim().toLowerCase();
      final matchesSearch = q.isEmpty ||
          s.name.toLowerCase().contains(q) ||
          s.title.toLowerCase().contains(q) ||
          s.brief.toLowerCase().contains(q);

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = _filteredList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('موسوعة صحابي'),
      ),
      body: Column(
        children: [
          _buildHeaderCard(),
          _buildSearchBar(),
          _buildCategoryChips(),
          Expanded(
            child: list.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    itemCount: list.length,
                    itemBuilder: (context, index) =>
                        _buildSahabiCard(list[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0F5132), Color(0xFF0A2E23)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.gold.withOpacity(0.35)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.gold.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.menu_book_rounded,
                  color: AppTheme.gold, size: 30),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'سير أعلام الصحابة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'المتاح حالياً: ${sahabaData.length} صحابي • المفضلة: ${_favorites.length}',
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        controller: _searchController,
        onChanged: (v) => setState(() => _searchQuery = v),
        style: const TextStyle(color: AppTheme.textPrimary),
        decoration: InputDecoration(
          hintText: 'ابحث باسم الصحابي أو لقبه...',
          hintStyle: const TextStyle(color: AppTheme.textMuted),
          prefixIcon:
              const Icon(Icons.search_rounded, color: AppTheme.textMuted),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded,
                      color: AppTheme.textMuted),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final selected = _selectedCategory == cat;
          return ChoiceChip(
            label: Text(cat),
            selected: selected,
            onSelected: (_) => setState(() => _selectedCategory = cat),
            selectedColor: AppTheme.primary,
            backgroundColor: AppTheme.surfaceAlt,
            labelStyle: TextStyle(
              color: selected ? Colors.white : AppTheme.textMuted,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
            side: BorderSide(
              color: selected ? AppTheme.primary : AppTheme.border,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSahabiCard(Sahabi sahabi) {
    final isFav = _favorites.contains(sahabi.id);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SahabiDetailPage(
                sahabi: sahabi,
                isFavorite: isFav,
                onToggleFavorite: () => _toggleFavorite(sahabi.id),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppTheme.primary.withOpacity(0.15),
                    child: Text(
                      sahabi.name.substring(0, 1),
                      style: const TextStyle(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sahabi.name,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          sahabi.title,
                          style: const TextStyle(
                            color: AppTheme.gold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFav ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: isFav ? AppTheme.gold : AppTheme.textMuted,
                    ),
                    onPressed: () => _toggleFavorite(sahabi.id),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                sahabi.brief,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 13.5,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.search_off_rounded, size: 56, color: AppTheme.textMuted),
          SizedBox(height: 12),
          Text(
            'لا توجد نتائج مطابقة',
            style: TextStyle(color: AppTheme.textMuted, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class SahabiDetailPage extends StatefulWidget {
  final Sahabi sahabi;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const SahabiDetailPage({
    super.key,
    required this.sahabi,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  State<SahabiDetailPage> createState() => _SahabiDetailPageState();
}

class _SahabiDetailPageState extends State<SahabiDetailPage> {
  late bool _isFav;

  @override
  void initState() {
    super.initState();
    _isFav = widget.isFavorite;
  }

  void _copyInfo() {
    final text =
        '${widget.sahabi.name} (${widget.sahabi.title})\n\n${widget.sahabi.details}';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم نسخ السيرة بنجاح'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.sahabi;
    return Scaffold(
      appBar: AppBar(
        title: Text(s.name),
        actions: [
          IconButton(
            tooltip: 'نسخ السيرة',
            icon: const Icon(Icons.copy_rounded),
            onPressed: _copyInfo,
          ),
          IconButton(
            tooltip: 'المفضلة',
            icon: Icon(
              _isFav ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
              color: _isFav ? AppTheme.gold : AppTheme.textPrimary,
            ),
            onPressed: () {
              setState(() => _isFav = !_isFav);
              widget.onToggleFavorite();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(18),
                Border