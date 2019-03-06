//
//  AiHeader.h
//  AiBarBar
//
//  Created by Aiewing on 2019/3/4.
//  Copyright © 2019 Aiewing. All rights reserved.
//

#ifndef AiHeader_h
#define AiHeader_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
#define ColorHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]

#endif /* AiHeader_h */
