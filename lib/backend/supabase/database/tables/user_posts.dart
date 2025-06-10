import '../database.dart';

class UserPostsTable extends SupabaseTable<UserPostsRow> {
  @override
  String get tableName => 'user_posts';

  @override
  UserPostsRow createRow(Map<String, dynamic> data) => UserPostsRow(data);
}

class UserPostsRow extends SupabaseDataRow {
  UserPostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPostsTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get postPic => getField<String>('post_pic');
  set postPic(String? value) => setField<String>('post_pic', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
