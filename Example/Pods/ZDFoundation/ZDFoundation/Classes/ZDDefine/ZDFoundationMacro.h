//
//  ZDFoundationMacro.h
//  ZD
//
//  Created by huhuabin on 2019/6/11.
//  Copyright © 2019 ZD. All rights reserved.
//

#ifndef ZDFoundationMacro_h
#define ZDFoundationMacro_h

//给所有扩展加上这个，就不用添加-all_load 或者 -force_load。
#ifndef ZDSYNTH_DUMMY_CLASS
#define ZDSYNTH_DUMMY_CLASS(_name_) \
@interface ZDSYNTH_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation ZDSYNTH_DUMMY_CLASS_ ## _name_ @end
#endif


#endif /* ZDFoundationMacro_h */
