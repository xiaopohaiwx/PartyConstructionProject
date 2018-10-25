//
//  GetDataBase.h
//  数据库
//
//  Created by apple on 2018/9/15.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "AssignToObject.h"

@interface GetDataBase : NSObject

@property(nonatomic , strong) FMDatabase * fmdb;
@property(nonatomic , strong) FMResultSet * fmrs;

//得到数据库，单例的数据库
+ (GetDataBase * )shareDateBase;

//判断表格是否存在
- (BOOL)isExisstTable:(NSString *)tableName;

//创建表格（会自动加上id作为主键）
- (void)CHFCreateTableID:(NSString *)tableName;

//执行插入操作时，把model中的属性和值放到一个字典中
- (BOOL)CHFInsertRecorderDataWithTableName:(NSString *)tableName andModel:(id)object;

//dicArr传的是包含多个字典的数组
- (BOOL)CHFInsertRecordeDataWithTableName:(NSString *)tableName andDicArray:(NSArray *)dicArr;

//objArr传的是包含多个对象的数组
- (BOOL)CHFInsertRecorderDataWithtableName:(NSString *)tableName andModelArray:(NSArray *)objArr;

//把上个方法中的字典插入数据库
- (BOOL)CHFInsertRecorderDataWithTableName:(NSString *)tableName valuesDictionary:(NSMutableDictionary *)dic;

//根据对象中的一个字段判断是否在数据库中存在
- (BOOL)CHFisExistTable:(NSString *)tableName andObject:(id)object andObjectAtIndex:(int)index;

//删除记录
- (void)CHFDeleteRecordDataWithTableName:(NSString *)tableName andDictionary:(NSDictionary *)keyDic;

//删除记录
- (void)CHFDeleteRecordFromTableName:(NSString *)tableName;

//删除数据库
- (void)CHFDeleteSQLite;

//修改记录
- (void)CHFModifyRecorderData:(NSString *)tableName andNameDictionary:(NSMutableDictionary *)dic andoriginDictionary:(NSMutableDictionary *)keyDic;

//获取记录
- (NSMutableArray *)CHFGetRecorderDataWithTableName:(NSString *)tableName from:(NSString *)fromTdStr to:(NSString *)toIdStr;

//获取记录
- (NSMutableArray *)CHFGetRecorderDataWithTableName:(NSString *)tableName andDicitonary:(id)keyDic;

//根据数据库的表名查询数据库表中的数据对象
- (NSMutableArray *)CHFGainTableRecoderID:(NSString *)tableName;

//根据数据库表名，数据名得到包含数据的数组
- (NSMutableArray *)CHFGainTableRecoderID:(NSString *)tableName andColumn:(NSString *)column;

@end
