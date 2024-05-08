class ResResult {
  ResResult({
    this.success,
  });

  bool? success;

  factory ResResult.fromJson(Map<String, dynamic> json) => ResResult(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
