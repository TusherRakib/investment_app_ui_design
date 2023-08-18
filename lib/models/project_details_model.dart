class ProjectInfo {
  String projectTitle;
  String projectType;
  String projectDescriptions;
  String daysLeft;
  String logo;
  String estimatedProfit;
  String riskGrade;
  String repaymentDuration;

  ProjectInfo({
    required this.projectTitle,
    required this.projectType,
    required this.projectDescriptions,
    required this.daysLeft,
    required this.logo,
    required this.estimatedProfit,
    required this.riskGrade,
    required this.repaymentDuration,
  });

  factory ProjectInfo.fromJson(Map<String, dynamic> json) {
    return ProjectInfo(
      projectTitle: json['projectTitle'],
      projectType: json['projectType'],
      projectDescriptions: json['projectDescriptions'],
      daysLeft: json['daysLeft'],
      logo: json['logo'],
      estimatedProfit: json['estimatedProfit'],
      riskGrade: json['riskGrade'],
      repaymentDuration: json['repaymentDuration'],
    );
  }

  Map<String, dynamic> toJson() => {
    'projectTitle': projectTitle,
    'projectType': projectType,
    'projectDescriptions': projectDescriptions,
    'daysLeft': daysLeft,
    'logo': logo,
    'estimatedProfit': estimatedProfit,
    'riskGrade': riskGrade,
    'repaymentDuration': repaymentDuration,
  };
}
