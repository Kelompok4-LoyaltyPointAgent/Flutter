class PostFeedbackModel {
  final bool? isInformationHelpful;
  final bool? isArticleHelpful;
  final bool? isArticleEasyToFind;
  final bool? isDesignGood;
  final String? review;

  PostFeedbackModel({
    this.isInformationHelpful,
    this.isArticleHelpful,
    this.isArticleEasyToFind,
    this.isDesignGood,
    this.review,
  });

  Map<String, dynamic> toJson() {
    return {
      'is_information_helpful': isInformationHelpful,
      'is_article_helpful': isArticleHelpful,
      'is_article_easy_to_find': isArticleEasyToFind,
      'is_design_good': isDesignGood,
      'review': review,
    };
  }
}
