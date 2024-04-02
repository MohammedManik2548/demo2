class PullRequest {
  PullRequest({
      this.url, 
      this.htmlUrl, 
      this.diffUrl, 
      this.patchUrl, 
      this.mergedAt,});

  PullRequest.fromJson(dynamic json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    diffUrl = json['diff_url'];
    patchUrl = json['patch_url'];
    mergedAt = json['merged_at'];
  }
  String? url;
  String? htmlUrl;
  String? diffUrl;
  String? patchUrl;
  dynamic mergedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['diff_url'] = diffUrl;
    map['patch_url'] = patchUrl;
    map['merged_at'] = mergedAt;
    return map;
  }

}