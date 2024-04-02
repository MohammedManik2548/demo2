import 'User.dart';
import 'PullRequest.dart';
import 'Reactions.dart';

class Items {
  Items({
      this.url, 
      this.repositoryUrl, 
      this.labelsUrl, 
      this.commentsUrl, 
      this.eventsUrl, 
      this.htmlUrl, 
      this.id, 
      this.nodeId, 
      this.number, 
      this.title, 
      this.user, 
      // this.labels,
      this.state,
      this.locked, 
      this.assignee, 
      // this.assignees,
      this.milestone, 
      this.comments, 
      this.createdAt, 
      this.updatedAt, 
      this.closedAt, 
      this.authorAssociation, 
      this.activeLockReason, 
      this.draft, 
      this.pullRequest, 
      this.body, 
      // this.reactions,
      this.timelineUrl, 
      this.performedViaGithubApp, 
      this.stateReason, 
      this.score,});

  Items.fromJson(dynamic json) {
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    eventsUrl = json['events_url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    // if (json['labels'] != null) {
    //   labels = [];
    //   json['labels'].forEach((v) {
    //     labels?.add(Dynamic.fromJson(v));
    //   });
    // }
    state = json['state'];
    locked = json['locked'];
    assignee = json['assignee'];
    // if (json['assignees'] != null) {
    //   assignees = [];
    //   json['assignees'].forEach((v) {
    //     assignees?.add(Dynamic.fromJson(v));
    //   });
    // }
    milestone = json['milestone'];
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'];
    authorAssociation = json['author_association'];
    activeLockReason = json['active_lock_reason'];
    draft = json['draft'];
    pullRequest = json['pull_request'] != null ? PullRequest.fromJson(json['pull_request']) : null;
    body = json['body'];
    // reactions = json['reactions'] != null ? Reactions.fromJson(json['reactions']) : null;
    timelineUrl = json['timeline_url'];
    performedViaGithubApp = json['performed_via_github_app'];
    stateReason = json['state_reason'];
    score = json['score'];
  }
  String? url;
  String? repositoryUrl;
  String? labelsUrl;
  String? commentsUrl;
  String? eventsUrl;
  String? htmlUrl;
  int? id;
  String? nodeId;
  int? number;
  String? title;
  User? user;
  // List<dynamic>? labels;
  String? state;
  bool? locked;
  dynamic assignee;
  // List<dynamic>? assignees;
  dynamic milestone;
  int? comments;
  String? createdAt;
  String? updatedAt;
  dynamic closedAt;
  String? authorAssociation;
  dynamic activeLockReason;
  bool? draft;
  PullRequest? pullRequest;
  String? body;
  // Reactions? reactions;
  String? timelineUrl;
  dynamic performedViaGithubApp;
  dynamic stateReason;
  double? score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['repository_url'] = repositoryUrl;
    map['labels_url'] = labelsUrl;
    map['comments_url'] = commentsUrl;
    map['events_url'] = eventsUrl;
    map['html_url'] = htmlUrl;
    map['id'] = id;
    map['node_id'] = nodeId;
    map['number'] = number;
    map['title'] = title;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    // if (labels != null) {
    //   map['labels'] = labels?.map((v) => v.toJson()).toList();
    // }
    map['state'] = state;
    map['locked'] = locked;
    map['assignee'] = assignee;
    // if (assignees != null) {
    //   map['assignees'] = assignees?.map((v) => v.toJson()).toList();
    // }
    map['milestone'] = milestone;
    map['comments'] = comments;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['closed_at'] = closedAt;
    map['author_association'] = authorAssociation;
    map['active_lock_reason'] = activeLockReason;
    map['draft'] = draft;
    if (pullRequest != null) {
      map['pull_request'] = pullRequest?.toJson();
    }
    map['body'] = body;
    // if (reactions != null) {
    //   map['reactions'] = reactions?.toJson();
    // }
    map['timeline_url'] = timelineUrl;
    map['performed_via_github_app'] = performedViaGithubApp;
    map['state_reason'] = stateReason;
    map['score'] = score;
    return map;
  }

}