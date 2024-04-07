import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final bool statusCode;

final List<dynamic>? errors;
final String? message;


   ErrorMessageModel(


      {required this.statusCode,
        this.message,
         this.errors,


      });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json)=>
      ErrorMessageModel(message: json['message'],statusCode: json['status'],
        errors: json['error']==null? [json['message']] : List<dynamic>.from(json['error'].map((e) => e)) ,
     );
  @override
  List<Object?> get props =>
      [statusCode,errors ,message];
}