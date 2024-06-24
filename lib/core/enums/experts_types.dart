enum ExpertsTypes {
  allExperts('all_experts', 'All Experts'),
  topExperts('top_experts', 'Top Experts'),
  recommendedExperts('recommended_experts', 'Recommended Experts');

  const ExpertsTypes(this.value, this.label);

  final String value;
  final String label;
}
