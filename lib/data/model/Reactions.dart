// class Reactions {
//   Reactions({
//       this.url,
//       this.totalCount,
//       this.1,
//       this.1,
//       this.laugh,
//       this.hooray,
//       this.confused,
//       this.heart,
//       this.rocket,
//       this.eyes,});
//
//   Reactions.fromJson(dynamic json) {
//     url = json['url'];
//     totalCount = json['total_count'];
//     1 = json['+1'];
//     1 = json['-1'];
//     laugh = json['laugh'];
//     hooray = json['hooray'];
//     confused = json['confused'];
//     heart = json['heart'];
//     rocket = json['rocket'];
//     eyes = json['eyes'];
//   }
//   String? url;
//   int? totalCount;
//   int? 1;
//   int? 1;
//   int? laugh;
//   int? hooray;
//   int? confused;
//   int? heart;
//   int? rocket;
//   int? eyes;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['url'] = url;
//     map['total_count'] = totalCount;
//     map['+1'] = 1;
//     map['-1'] = 1;
//     map['laugh'] = laugh;
//     map['hooray'] = hooray;
//     map['confused'] = confused;
//     map['heart'] = heart;
//     map['rocket'] = rocket;
//     map['eyes'] = eyes;
//     return map;
//   }
//
// }