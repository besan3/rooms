import 'package:equatable/equatable.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';

class SearchEntity extends Equatable{
  final bool status;
  final String message;
  final SearchData data;




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;

      data['data'] = this.data.toJson();

    return data;
  }

  @override
  List<Object?> get props =>[status,message,data];

  const SearchEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class SearchData extends Equatable{
  final int? currentPage;
  final List<Data> data;
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
    data['data'] = this.data.map((v) => v.toJson()).toList();
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
  List<Object?> get props =>[to,prevPageUrl,perPage,path,nextPageUrl,firstPageUrl,data,currentPage,from];

  const SearchData({
    this.currentPage,
   required this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });
}

class Data extends Equatable {
  final int? id;
  final int? userId;
  final String? name;
  final String? image;
  final int? isPrivate;
  final  int? isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? postsCount;
  final Administrator? administrator;
  final List<Participants>? participants;

  Data(
      {this.id,
        this.userId,
        this.name,
        this.image,
        this.isPrivate,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.postsCount,
        this.administrator,
        this.participants});



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
    data['posts_count'] = this.postsCount;
    if (this.administrator != null) {
      data['administrator'] = this.administrator!.toJson();
    }
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [participants,administrator,postsCount,deletedAt,updatedAt,createdAt,isActive,isPrivate,image,name,userId,id];
}


