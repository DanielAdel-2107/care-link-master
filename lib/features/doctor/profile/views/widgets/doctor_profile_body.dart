import 'package:care_link/core/locale/app_localizations_ext.dart';
import 'package:care_link/core/utilies/styles/app_text_styles.dart';
import 'package:care_link/core/utilies/sizes/sized_config.dart';
import 'package:care_link/features/auth/sign_up_as_doctor/models/doctor_model.dart';
import 'package:care_link/features/patient/home/views/widgets/gradient_header.dart';
import 'package:flutter/material.dart';

class DoctorProfileBody extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorProfileBody({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return GradientHeader(
      child: ListView(
        padding: EdgeInsets.all(SizeConfig.width * 0.04),
        children: [
          _Header(doctor: doctor),
          SizedBox(height: SizeConfig.height * 0.02),
          _InfoCard(doctor: doctor),
          SizedBox(height: SizeConfig.height * 0.02),
          _BioCard(doctor: doctor),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final DoctorModel doctor;

  const _Header({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: SizeConfig.width * 0.1,
            backgroundImage: NetworkImage(doctor.doctor?.image ?? ''),
            child: doctor.doctor?.image == null ? Icon(Icons.person, size: SizeConfig.width * 0.1, color: Colors.white) : null,
          ),
          SizedBox(width: SizeConfig.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.doctor?.name ?? '',
                  style: AppTextStyles.title18WhiteW500,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 4),
                Text(
                  doctor.doctor?.email ?? '',
                  style: AppTextStyles.title12White70,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final DoctorModel doctor;

  const _InfoCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return _WhiteCard(
      child: Column(
        children: [
          _InfoRow(context.tr.specialty, doctor.specialty.name),
          _Divider(),
          _InfoRow(context.tr.hospitalName, doctor.hospital),
        ],
      ),
    );
  }
}

class _BioCard extends StatelessWidget {
  final DoctorModel doctor;

  const _BioCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return _WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.tr.bio, style: AppTextStyles.title16BlackW500),
          SizedBox(height: SizeConfig.height * 0.01),
          Text(
            doctor.bio,
            style: AppTextStyles.title14Grey,
          ),
        ],
      ),
    );
  }
}

class _WhiteCard extends StatelessWidget {
  final Widget child;

  const _WhiteCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: AppTextStyles.title14Grey),
        ),
        Text(value, style: AppTextStyles.title14Black),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade300,
      height: SizeConfig.height * 0.02,
    );
  }
}
