class DataModel {
  DataModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });
  late final int page;
  late final int perPage;
  late final int total;
  late final int totalPages;
  late final List<Data> data;
  late final Support support;
  
  DataModel.fromJson(Map<String, dynamic> json){
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    support = Support.fromJson(json['support']);
  }

  Map<String, dynamic> toJson() {
    final dataList = <String, dynamic>{};
    dataList['page'] = page;
    dataList['per_page'] = perPage;
    dataList['total'] = total;
    dataList['total_pages'] = totalPages;
    dataList['data'] = data.map((e)=>e.toJson()).toList();
    dataList['support'] = support.toJson();
    return dataList;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });
  late final int id;
  late final String name;
  late final int year;
  late final String color;
  late final String pantoneValue;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final dataList = <String, dynamic>{};
    dataList['id'] = id;
    dataList['name'] = name;
    dataList['year'] = year;
    dataList['color'] = color;
    dataList['pantone_value'] = pantoneValue;
    return dataList;
  }
}

class Support {
  Support({
    required this.url,
    required this.text,
  });
  late final String url;
  late final String text;
  
  Support.fromJson(Map<String, dynamic> json){
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final dataList = <String, dynamic>{};
    dataList['url'] = url;
    dataList['text'] = text;
    return dataList;
  }
}