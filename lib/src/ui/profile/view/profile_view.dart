import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silancar_bloc/src/core/model/profile_model.dart';
import 'package:silancar_bloc/src/ui/profile/cubit/profile_cubit.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
            if (state is ProfileSuccess) {
              return Column(
                children: [
                  _buildHeader(state.dataProfile),
                  const SizedBox(height: 16),
                  _buildJobSeekerCard(state.dataProfile),
                  _buildCvCard(),
                  _buildAboutMeCard(state.dataProfile),
                  _buildJobInfoCard(state.dataProfile),
                  _buildPersonalDataCard(state.dataProfile),
                  _buildExperienceCard(state.dataProfile),
                  const SizedBox(height: 24),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  // =========================
  Widget _buildHeader(DataProfile dataProfile) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB91C1C), Color(0xFFD14343)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataProfile.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.verified, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Terverifikasi AK-1',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }

  // =========================
  Widget _buildJobSeekerCard(DataProfile dataProfile) {
    return _buildCard(
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.badge, color: Colors.red),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. Pencari Kerja',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  '0019294950039',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _arrowButton(),
        ],
      ),
      gradient: true,
    );
  }

  // =========================
  Widget _buildCvCard() {
    return _buildCard(
      child: Row(
        children: [
          const Icon(Icons.description, color: Colors.white),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'cv-septio-dwi.pdf',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Icon(Icons.edit, color: Colors.white),
        ],
      ),
      color: const Color(0xFFF4B740),
    );
  }

  // =========================
  Widget _buildAboutMeCard(DataProfile dataProfile) {
    return _buildSectionCard(
      title: 'Tentang Saya',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Saya adalah orang yang kreatif dan terbiasa membuat konten '
            'seperti artikel, video, atau gambar untuk media sosial...',
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 12),
          Center(
            child: Text('Lihat semua ⌄', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // =========================
  Widget _buildJobInfoCard(DataProfile dataProfile) {
    return _buildSectionCard(
      title: 'Keterangan Kerja',
      child: Column(
        children: const [
          _InfoRow(title: 'Posisi', value: 'Digital Marketing'),
          _InfoRow(title: 'Penempatan', value: 'Luar Negeri'),
          _InfoRow(title: 'Sistem Gaji', value: 'Bulanan'),
          _InfoRow(title: 'Ekspektasi Gaji', value: 'IDR 6.000.000'),
          SizedBox(height: 12),
          Text('Lihat semua ⌄', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  // =========================
  Widget _buildPersonalDataCard(DataProfile dataProfile) {
    return _buildSectionCard(
      title: 'Data Diri Anda',
      child: Column(
        children:  [
          _InfoRow(title: 'Nama Lengkap', value: dataProfile.client[0].userName),
          _InfoRow(title: 'Gender', value: dataProfile.client[0].gender),
          _InfoRow(title: 'Email', value: 'tio@mail.com'),
          _InfoRow(title: 'NIK', value: '0000000000'),
          SizedBox(height: 12),
          Text('Lihat semua ⌄', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  // =========================
  Widget _buildExperienceCard(DataProfile dataProfile) {
    return _buildSectionCard(
      title: 'Pengalaman Kerja',
      child: Column(
        children:  [
          for(var i=0; i< dataProfile.client[0].experience.length ;i++)
          _ExperienceItem(
            title: dataProfile.client[0].experience[i].position,
            company: dataProfile.client[0].experience[i].company,
            period: dataProfile.client[0].experience[i].duration,
          ),
          // _ExperienceItem(
          //   title: 'Fullstack Frontend',
          //   company: 'PT Home Developer Indonesia',
          //   period: 'Oct 2023 - Sep 2023 (5 Tahun)',
          // ),
          SizedBox(height: 12),
          Text('Lihat semua ⌄', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  // =========================
  Widget _buildCard({
    required Widget child,
    bool gradient = false,
    Color? color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: gradient ? null : color ?? Colors.red,
        gradient: gradient
            ? const LinearGradient(
                colors: [Color(0xFFB91C1C), Color(0xFFD14343)],
              )
            : null,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: child,
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB91C1C), Color(0xFFD14343)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.edit, color: Colors.white, size: 18),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(16), child: child),
        ],
      ),
    );
  }

  Widget _arrowButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.chevron_right),
    );
  }
}

// =========================
// SUB COMPONENTS
// =========================
class _InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const _InfoRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title, style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String period;

  const _ExperienceItem({
    required this.title,
    required this.company,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.apartment, color: Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(company, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 14),
                    const SizedBox(width: 4),
                    Text(period, style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
