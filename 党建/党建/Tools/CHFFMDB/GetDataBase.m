//
//  GetDataBase.m
//  数据库
//
//  Created by apple on 2018/9/15.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "GetDataBase.h"

@implementation GetDataBase

@synthesize fmdb;
@synthesize fmrs;

static GetDataBase *dataBase = nil;//静态全局变量

//得到数据库，单例的数据库
+ (GetDataBase *)shareDateBase
{
    if(!dataBase)
    {
        @synchronized(self)
        {
            if(!dataBase)
            {
                dataBase = [[GetDataBase alloc] init];
                NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/CHFProject.db"];
                NSLog(@"数据库地址---%@---",dbPath);
                dataBase.fmdb = [FMDatabase databaseWithPath:dbPath];
                if(![dataBase.fmdb open])
                {
                    dataBase = nil;
                }
            }
        }
    }
    return dataBase;
}

//判断表格是否存在
- (BOOL)isExisstTable:(NSString *)tableName
{
    BOOL value = NO;
    if([fmdb tableExists:tableName])
    {
        value = YES;
        NSLog(@"%@存在", tableName);
    }
    return value;
}

//创建表格（会自动加上id作为主键）
- (void)CHFCreateTableID:(NSString *)tableName
{
    NSMutableString *sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"create table %@",tableName]];
    [sqlString appendString:@"("];
    for(NSString * string in [AssignToObject propertyKeysWithString:tableName])
    {
        [sqlString appendString:string];
        [sqlString appendString:@", "];
    }
    [sqlString appendString:@"primaryId integer primary key autoincrement"];
    [sqlString appendString:@")"];
    NSLog(@"---%@---",sqlString);
    [fmdb executeUpdate:sqlString];
}

//执行插入操作时，把model中的属性和值放到一个字典中
- (BOOL)CHFInsertRecorderDataWithTableName:(NSString *)tableName andModel:(id)object
{
    BOOL value = NO;
    BOOL exist = [[GetDataBase shareDateBase] isExisstTable:tableName];
    if(!exist)
    {
        //如果数据库表不存在就先创建一个数据库表
        [[GetDataBase shareDateBase] CHFCreateTableID:tableName];
    }
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc] initWithCapacity:1];
    for (NSString *propertyStr in [AssignToObject propertyKeysWithString:tableName])
    {
        if ([object valueForKey:propertyStr])
        {
            [dicData setObject:[object valueForKey:propertyStr] forKey:propertyStr];
        }
    }
    //添加数据
    value = [[GetDataBase shareDateBase]CHFInsertRecorderDataWithTableName:tableName valuesDictionary:dicData];
    return value;
}

//dicArr传的是包含多个字典的数组
- (BOOL)CHFInsertRecordeDataWithTableName:(NSString *)tableName andDicArray:(NSArray *)dicArr
{
    BOOL value = NO;
    BOOL exist = [[GetDataBase shareDateBase] isExisstTable:tableName];
    if(!exist)
    {
        [[GetDataBase shareDateBase] CHFCreateTableID:tableName];
    }
    //开启事务避免批量数据插入时候卡顿的情况
    [[[GetDataBase shareDateBase]fmdb]beginTransaction];
    for (NSMutableDictionary *dic in dicArr)
    {
        value = [[GetDataBase shareDateBase] CHFInsertRecorderDataWithTableName:tableName valuesDictionary:dic];
    }
     //事务开启后要有提交操作才能完整执行整个事务。
    [[[GetDataBase shareDateBase]fmdb]commit];
    
    return value;
}

//objArr传的是包含多个对象的数组
- (BOOL)CHFInsertRecorderDataWithtableName:(NSString *)tableName andModelArray:(NSArray *)objArr
{
    BOOL value = NO;
    BOOL exist = [[GetDataBase shareDateBase] isExisstTable:tableName];
    if(!exist)
    {
        [[GetDataBase shareDateBase] CHFCreateTableID:tableName];
    }
    [[[GetDataBase shareDateBase]fmdb]beginTransaction];
    for (id object in objArr)
    {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] initWithCapacity:1];
        for (NSString * propertyStr in [AssignToObject propertyKeysWithString:tableName])
        {
            if([object valueForKey:propertyStr])
            {
                [dic setObject:[object valueForKey:propertyStr] forKey:propertyStr];
            }
        }
        value = [[GetDataBase shareDateBase] CHFInsertRecorderDataWithTableName:tableName valuesDictionary:dic];
    }
    [[[GetDataBase shareDateBase]fmdb]commit];
    
    return value;
}

//把上个方法中的字典插入数据库
- (BOOL)CHFInsertRecorderDataWithTableName:(NSString *)tableName valuesDictionary:(NSMutableDictionary *)dic
{
    NSMutableString * sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"insert into %@",tableName]];
    [sqlString appendString:@" ("];
    NSArray * array = [dic allKeys];
    for (NSString *string in array)
    {
        [sqlString appendString:string];
        [sqlString appendString:@","];
    }
    [sqlString deleteCharactersInRange:NSMakeRange([sqlString length]-1, 1)];
    [sqlString appendString:@") values ("];
    for (int i = 0; i < [array count]; i++)
    {
        [sqlString appendString:@"?,"];
    }
    [sqlString deleteCharactersInRange:NSMakeRange([sqlString length]-1, 1)];
    [sqlString appendString:@")"];
    if([fmdb executeUpdate:sqlString withArgumentsInArray:[dic allValues]])
    {
        return YES;
    }
    return NO;
}

//根据对象中的一个字段判断是否在数据库中存在
- (BOOL)CHFisExistTable:(NSString *)tableName andObject:(id)object andObjectAtIndex:(int)index
{
    BOOL value = NO;
    NSMutableString *sqlString = [NSMutableString string];
    NSString *propertyStr = [[AssignToObject propertyKeysWithString:tableName] objectAtIndex:index];
    [sqlString appendString:[NSString stringWithFormat:@"select * from %@ where %@ = ?",tableName, propertyStr]];
    NSString *valueStr = [object valueForKey:propertyStr];
    dataBase.fmrs = [fmdb executeQuery:sqlString, valueStr];
    while ([fmrs next])
    {
        value = YES;
    }
    return value;
}

//根据对象中的两个字段判断是否在数据库中存在
- (BOOL)CHFisExistTable:(NSString *)tableName andObject:(id)object andObjectAtFirstIndex:(int)index1 andObjectAtSecondIndex:(int)index2
{
    BOOL value = NO;
    NSMutableString *sqlString = [NSMutableString string];
    NSString *propertyStr1 = [[AssignToObject propertyKeysWithString:tableName] objectAtIndex:index1];
    NSString *propertyStr2 = [[AssignToObject propertyKeysWithString:tableName] objectAtIndex:index2];
    [sqlString appendString:[NSString stringWithFormat:@"select * from %@ where %@ = ? and %@ = ?",tableName,propertyStr1,propertyStr2]];
    NSString * str1 = [object valueForKey:propertyStr1];
    NSString * str2 = [object valueForKey:propertyStr2];
    dataBase.fmrs = [fmdb executeQuery:sqlString,str1,str2];
    while ([fmrs next])
    {
        value = YES;
    }
    return value;
}

//删除记录
- (void)CHFDeleteRecordDataWithTableName:(NSString *)tableName andDictionary:(NSDictionary *)keyDic
{
    NSMutableString *sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"delete from %@ where %@ like ?", tableName, [[keyDic allKeys]objectAtIndex:0]]];
    NSInteger j = [[keyDic allKeys] count];
    if(j > 1)
    {
        for (int i = 1; i < j; i++)
        {
            NSString *strKey = [[keyDic allKeys] objectAtIndex:i];
            [sqlString appendString:[NSString stringWithFormat:@" and %@ like ?",strKey]];
        }
    }
    [fmdb executeUpdate:sqlString withArgumentsInArray:[keyDic allValues]];
}

//删除记录
- (void)CHFDeleteRecordFromTableName:(NSString *)tableName
{
    NSString *sqlString = [NSString stringWithFormat:@"delete from %@",tableName];
    [fmdb executeUpdate:sqlString];
}

//删除数据库
- (void)CHFDeleteSQLite{
    NSFileManager *fieldManager=[NSFileManager defaultManager];
    NSString *path = [NSString stringWithFormat:@"/Documents/CHFProject.db"];
    NSString *fieldPath=[NSHomeDirectory() stringByAppendingString:path];
    
    if ([fieldManager fileExistsAtPath:fieldPath])
    {
        BOOL isDel = [fieldManager removeItemAtPath:fieldPath error:nil];
        if (isDel)
        {
            NSLog(@"删除数据库成功");
        }
    }
    else
    {
        NSLog(@"数据库不存在");
    }
}

//修改记录
- (void)CHFModifyRecorderData:(NSString *)tableName andNameDictionary:(NSMutableDictionary *)dic andoriginDictionary:(NSMutableDictionary *)keyDic;
{
    NSMutableString *sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"upDate %@ set ",tableName]];
    NSInteger m = [[dic allKeys] count];
    for (int i = 0; i < m ; i++)
    {
        [sqlString appendString:[[dic allKeys] objectAtIndex:i]];
        [sqlString appendString:@" = ?, "];
    }
    [sqlString deleteCharactersInRange:NSMakeRange([sqlString length] - 2, 2)];
    [sqlString appendString:@"where"];
    NSInteger j = [[keyDic allKeys] count];
    for (int i = 0; i < j; i++)
    {
        [sqlString appendString:[[keyDic allKeys] objectAtIndex:i]];
        [sqlString appendString:@" like ? "];
        [sqlString appendString:@"and "];
    }
    [sqlString deleteCharactersInRange:NSMakeRange([sqlString length] - 4, 4)];
    NSMutableArray *mutableArr = [[NSMutableArray alloc] initWithCapacity:1];
    for (NSString *str in [dic allValues])
    {
        [mutableArr addObject:str];
    }
    for (NSString *str in [keyDic allValues])
    {
        [mutableArr addObject:str];
    }
    
    [fmdb executeUpdate:sqlString withArgumentsInArray:mutableArr];
}

//获取记录
- (NSMutableArray *)CHFGetRecorderDataWithTableName:(NSString *)tableName from:(NSString *)fromTdStr to:(NSString *)toIdStr
{
    //from指从那个主键开始查询，to指查询到那个主键结束。
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:1];
    NSMutableString *sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"selete * from %@ where and id <= ?",tableName]];
    dataBase.fmrs = [fmdb executeQuery:sqlString,fromTdStr,toIdStr];
    while ([fmrs next])
    {
        id user = [AssignToObject reflectDataFromOtherObject:fmrs andObjectStr:tableName];
        [returnArray addObject:user];
    }
    return returnArray;
}

//获取记录
- (NSMutableArray *)CHFGetRecorderDataWithTableName:(NSString *)tableName andDicitonary:(id)keyDic
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:1];
    NSMutableString *sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"select * from %@ where ",tableName]];
    NSInteger j = [[keyDic allKeys] count];
    for (int i = 0; i < j; i++)
    {
        [sqlString appendString:[[keyDic allKeys] objectAtIndex:i]];
        [sqlString appendString:@" like ? "];
        [sqlString appendString:@"and "];
    }
    [sqlString deleteCharactersInRange:NSMakeRange([sqlString length] - 4, 4)];
    dataBase.fmrs = [fmdb executeQuery:sqlString withArgumentsInArray:[keyDic allValues]];
    while ([fmrs next])
    {
        id user = [AssignToObject reflectDataFromOtherObject:fmrs andObjectStr:tableName];
        [returnArray addObject:user];
    }
    return returnArray;
}

//根据数据库的表名查询数据库表中的数据对象
- (NSMutableArray *)CHFGainTableRecoderID:(NSString *)tableName
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:1];
    NSMutableString *sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"select * from %@",tableName]];
    dataBase.fmrs = [fmdb executeQuery:sqlString];
    while ([fmrs next])
    {
        id obj = [AssignToObject reflectDataFromOtherObject:fmrs andObjectStr:tableName];
        [returnArray addObject:obj];
    }
    return returnArray;
}

//根据数据库表名，数据名得到包含数据的数组
- (NSMutableArray *)CHFGainTableRecoderID:(NSString *)tableName andColumn:(NSString *)column
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:1];
    NSMutableString *sqlString = [NSMutableString string];
    [sqlString appendString:[NSString stringWithFormat:@"select * from %@",tableName]];
    dataBase.fmrs = [fmdb executeQuery:sqlString];
    while ([fmrs next])
    {
        NSString * str = [NSString stringWithFormat:@"%@", [fmrs stringForColumn:column]];
        [returnArray addObject:str];
    }
    return returnArray;
}






@end
