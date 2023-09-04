import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final bool status;
  final String message;
  final PostEntity? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  const HomeEntity({
    required this.status,
    required this.message,
    this.data,
  });

  @override

  List<Object?> get props => [status,message,data];
}

class PostEntity extends Equatable {
  final PostsDataEntity? posts;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [posts];

  const PostEntity({
    this.posts,
  });
}

class PostsDataEntity extends Equatable {
  final int currentPage;
  final List<PostDetailEntity>? data;
  final String? firstPageUrl;
  final int? from;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    return data;
  }

  @override
  List<Object?> get props => [currentPage,data,firstPageUrl,from,to,nextPageUrl,prevPageUrl,path,perPage];

  const PostsDataEntity({
    required this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });
}

class PostDetailEntity extends Equatable{
  final int id;
  final int userId;
  final int roomId;
  final String title;
  final String body;
  final String image;
  final String createdAt;
  final int commentsCount;
  final PostUser? user;
  final PostRoom? room;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['room_id'] = this.roomId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['comments_count'] = this.commentsCount;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props =>[id,userId,roomId,title,body,image,createdAt,commentsCount,user,room];

  const PostDetailEntity({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.title,
    required this.body,
    required this.image,
    required this.createdAt,
    required this.commentsCount,
    this.user,
    this.room,
  });
}

class PostUser extends Equatable{
  final int id;
  final String name;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  const PostUser({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props =>[id,name];
}

class PostRoom extends Equatable{
  final int id;
  final int userId;
  final String name;
  final String image;
  final int isPrivate;
  final int isActive;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['is_private'] = this.isPrivate;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }

  const PostRoom({
    required this.id,
    required this.userId,
    required this.name,
    required this.image,
    required this.isPrivate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,userId,name,image,isPrivate,isActive,createdAt,updatedAt,deletedAt
  ];
}
