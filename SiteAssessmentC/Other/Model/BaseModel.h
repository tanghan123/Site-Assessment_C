//
//  BaseModel.h
//  Site_Assessment_C
//
//  Created by Jacob on 2018/9/14.
//  Copyright © 2018年 Jacob. All rights reserved.
//

#import <Foundation/Foundation.h>


@class QuestionModel , Question;
@interface BaseModel : NSObject
@property (nonatomic ,copy) NSString *heading;
@property (nonatomic ,strong) NSArray <QuestionModel *> *questionList;
@end

@interface QuestionModel :NSObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *defaultValue;
@property (nonatomic ,copy) NSArray *option;
@property (nonatomic ,copy) NSArray <Question *>*faltList;
@property (nonatomic ,copy) NSArray <Question *>*ridgeList;
@end

@interface Question : NSObject 
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *defaultValue;
@end
