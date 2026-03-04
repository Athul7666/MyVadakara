import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_tokens.dart';
import '../../../core/widgets/premium_components.dart';

class PremiumHomeScreen extends StatelessWidget {
  const PremiumHomeScreen({super.key});

  static const services = <({String title, IconData icon, String availability})>[
    (title: 'Auto Rickshaw', icon: Icons.electric_rickshaw_rounded, availability: '18 nearby'),
    (title: 'Cab', icon: Icons.local_taxi_rounded, availability: '34 nearby'),
    (title: 'Light Vehicle', icon: Icons.directions_car_rounded, availability: '12 nearby'),
    (title: 'Heavy Vehicle', icon: Icons.fire_truck_rounded, availability: '8 nearby'),
    (title: 'Household Services', icon: Icons.home_repair_service_rounded, availability: '52 nearby'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vadakara Connect', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: AppSpacing.xs),
                    Text('Premium hyperlocal services, on demand.', style: theme.textTheme.bodyLarge),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
              SliverGrid.builder(
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  childAspectRatio: 1.05,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    child: InkWell(
                      borderRadius: AppRadius.card,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(service.icon, size: 32),
                            const Spacer(),
                            Text(service.title, style: theme.textTheme.titleMedium),
                            const SizedBox(height: AppSpacing.xs),
                            StatusBadge(text: service.availability, color: Colors.green),
                          ],
                        ),
                      ),
                    ),
                  )
                      .animate(delay: (index * 70).ms)
                      .fadeIn(duration: 250.ms)
                      .moveY(begin: 12, end: 0, duration: 250.ms);
                },
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.lg),
                  child: PremiumButton(
                    label: 'Create Service Request',
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
