
//
//  BaseModel.m
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/14.
//  Copyright © 2018年 Jacob. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"questionList":[QuestionModel class]};
}
@end

@implementation QuestionModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"faltList":[Question class] ,@"ridgeList":[Question class] };
}
@end

@implementation Question

@end
