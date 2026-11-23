import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/models/animal.dart';

class AnimalDetailPage extends StatefulWidget {
  final Animal animal;

  const AnimalDetailPage({super.key, required this.animal});

  static const Color accentOrange = Color(0xFFE85D04);
  static const Color backgroundColor = Color(0xFF0B0908);

  static const TextStyle sectionHeadingStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.5,
    color: Color(0xFFFF8904),
  );

  static const TextStyle sectionSubHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: Color.fromARGB(255, 240, 240, 240),
  );

  static const TextStyle sectionContentStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
    color: Color.fromARGB(255, 143, 143, 143),
  );

  @override
  State<AnimalDetailPage> createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0908),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildHeroSection(),
          ),

          SliverToBoxAdapter(
            child: _buildTabBar(),
          ),

          SliverToBoxAdapter(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        final heroHeight = isMobile ? 500.0 : 620.0;
        final horizontalPadding = isMobile ? 20.0 : 68.0;

        return SizedBox(
          height: heroHeight,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(widget.animal.imageUrl, fit: BoxFit.cover),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black38,
                      Colors.transparent,
                      Colors.black87,
                    ],
                    stops: [0.0, 0.4, 1.0],
                  ),
                ),
              ),

              _buildHeroNavigation(),

              Positioned(
                left: horizontalPadding,
                right: horizontalPadding,
                bottom: isMobile ? 90 : 155,
                child: _buildSpeciesTitle(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroNavigation() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            _buildBackButton(),

            // Brand
            _buildBrandLogo(),

            // Bookmark
            // _buildBookmarkButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Icon(Icons.arrow_back, color: Colors.white, size: 17),
            const SizedBox(width: 10),
            Text(
              'Back to sanctuary',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandLogo() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PROJECT: SANCTUARY',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 4,
              ),
            )
          ],
        ),
      ],
    );
  }

  // Widget _buildBookmarkButton() {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       color: Colors.white24,
  //       shape: BoxShape.circle,
  //     ),
  //     child: IconButton(
  //       onPressed: () {
  //         // Add bookmark functionality later.
  //       },
  //       icon: const Icon(Icons.bookmark_border, color: Colors.white),
  //     ),
  //   );
  // }

  Widget _buildSpeciesTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.animal.classification.toUpperCase(),
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 255, 126, 45),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          widget.animal.commonName,
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 88,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          widget.animal.scientificName,
          style: GoogleFonts.inter(
            color: Colors.white70,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 68),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF302C29), width: 1),
          ),
        ),
        child: TabBar(
          controller: _tabController,

          isScrollable: true,

          dividerColor: Colors.transparent,
          dividerHeight: 0,

          indicatorColor: AnimalDetailPage.accentOrange,
          indicatorWeight: 2,

          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,

          labelStyle: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),

          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),

          tabAlignment: TabAlignment.start,

          tabs: const [
            Tab(text: 'Description'),
            Tab(text: 'Classification'),
            Tab(text: 'Habitat'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_tabController.index) {
      case 0:
        return _buildDescriptionTab();

      case 1:
        return _buildClassificationTab();

      case 2:
        return _buildHabitatTab();

      default:
        return _buildDescriptionTab();
    }
  }

  Widget _buildDescriptionTab() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1410),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 64),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: _buildSpeciesDescription()),

                        const SizedBox(width: 80),

                        Expanded(flex: 1, child: _buildConservationCard()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSpeciesDescription(),

                        const SizedBox(height: 32),

                        _buildConservationCard(),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpeciesDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT THIS SPECIES',
          style: GoogleFonts.inter(
            color: AnimalDetailPage.accentOrange,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Description.',
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          widget.animal.description,
          style: GoogleFonts.inter(
            color: const Color(0xFFB0AAA5),
            fontSize: 15,
            height: 1.9,
          ),
        ),
      ],
    );
  }

  Widget _buildConservationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF151311),
        border: Border.all(color: const Color(0xFF302C29)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RED LIST STATUS',
            style: GoogleFonts.inter(
              color: Colors.white60,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF064E3B).withValues(alpha: 0.35),
              border: Border.all(color: const Color(0xFF047857)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              widget.animal.iucnStatus,
              style: GoogleFonts.inter(
                color: const Color(0xFF34D399),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassificationTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CLASSIFICATION',
            style: GoogleFonts.inter(
              color: AnimalDetailPage.accentOrange,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Scientific Classification',
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 42,
            ),
          ),

          const SizedBox(height: 24),

          _buildClassificationRow('Kingdom', widget.animal.kingdom),
          _buildClassificationRow('Phylum', widget.animal.phylum),
          _buildClassificationRow('Class', widget.animal.classification),
          _buildClassificationRow('Order', widget.animal.order),
          _buildClassificationRow('Family', widget.animal.family),
          _buildClassificationRow('Genus', widget.animal.genus),
          _buildClassificationRow('Species', widget.animal.scientificName),
        ],
      ),
    );
  }

  Widget _buildClassificationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(color: Colors.white54, fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitatTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NATURAL ENVIRONMENT',
            style: GoogleFonts.inter(
              color: AnimalDetailPage.accentOrange,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Where they live.',
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 42,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            widget.animal.location,
            style: GoogleFonts.inter(
              color: const Color(0xFFB0AAA5),
              fontSize: 15,
              height: 1.9,
            ),
          ),
        ],
      ),
    );
  }
}
