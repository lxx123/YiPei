//
//  model.m
//  YiPei
//
//  Created by lee on 13-11-22.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "model.h"

@implementation todayNewQuery
@synthesize index;
@synthesize cid;
@synthesize sortp;
@synthesize sorts;
@end

@implementation todayNew

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize goods_sn;
@synthesize barcode;
@synthesize goods_format;
@synthesize goods_name;
@synthesize goods_sale_amount;
@synthesize goodsAttrs;
@end

@implementation goodsAttr

@synthesize attr_name;
@synthesize attr_value;
@end

@implementation todayDiscountQuery

@synthesize index;
@synthesize sortPrice;
@synthesize sortSale;
@end

@implementation todayDiscountGoods

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize goods_sn;
@synthesize goods_name;
@synthesize goods_sale_amount;
@synthesize goodsAttrs;
@synthesize goods_format;
@end

@implementation CityGoodsInfoQuery

@synthesize goodsId;
@end

@implementation GoodsInfo

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize goods_sn;
@synthesize goods_barcode;
@synthesize goods_format;
@synthesize goods_name;
@synthesize goods_brief;
@synthesize goods_desc;
@synthesize goods_sale_amount;
@synthesize goods_attrs;
@synthesize package_format;
@synthesize brand_name;
@synthesize measure_unit;
@synthesize product_company;
@synthesize original_img;
@synthesize goods_car;
@synthesize service_after_content;
@synthesize service_after_title;
@synthesize slogan_title;
@synthesize slogan_content;
@synthesize goods_gallery;
@synthesize volume_price;
@end

@implementation volumePrice

@synthesize volume_price;
@synthesize volume_number;

@end

@implementation goodsCar

@synthesize car_id;
@synthesize name;
@synthesize power;
@synthesize series;
@synthesize brand;
@synthesize company;
@synthesize import_info;
@end

@implementation goodsGallery

@synthesize thumb_url;
@synthesize img_url;
@synthesize img_desc;
@synthesize img_original;
@end

@implementation uploadImageQuery

@synthesize goodsSn;
@end

@implementation uploadImageInfo

@synthesize ImageInfo;
@end

@implementation uploadImagePath

@synthesize filePath;
@end

@implementation lowPriceNotifyQuery

@synthesize goodsId;
@synthesize sysPrice;
@synthesize price;
@synthesize number;
@synthesize rebates;
@synthesize imgUrl;

@end

@implementation loadCarInfoByPidQuery

@synthesize pid;
@end

@implementation loadCarInfoByLevelQuery

@synthesize level;
@end

@implementation loadCarInfo

@synthesize car_id;
@synthesize name;
@synthesize power;
@synthesize level;
@synthesize series;
@synthesize brand;
@synthesize company;
@synthesize import_info;

@end

@implementation goodsCategory

@synthesize car_id;
@synthesize cat_name;
@synthesize sort_order;
@synthesize cat_desc;
@synthesize category_thumb;
@synthesize ategory_img;
@synthesize original_img;

@end

@implementation goodsCategoryByPidQuery

@synthesize pid;
@end

@implementation goodsCategoryByPid

@synthesize category;
@end

@implementation goodsAllBrandQuery

@synthesize firstLetter;
@synthesize sortByLetter;
@end


@implementation goodsAllBrand

@synthesize category;

@end

@implementation goodsListQuery

@synthesize categoryId;
@synthesize carModel;
@synthesize carGeneral;
@synthesize brandId;
@synthesize filterAttr;
@synthesize sortPrice;
@synthesize sortSale;
@synthesize index;

@end

@implementation filterAttrByCategoryQuery

@synthesize categoryId;

@end

@implementation goodsCarModelByCategoryQuery

@synthesize categoryId;

@end

@implementation goodsCategoryByBrandQuery

@synthesize brandId;

@end

@implementation filterAttrByBrandQuery

@synthesize brandId;

@end

@implementation goodsBrandByCarModelQuery

@synthesize carModel;

@end

@implementation goodsCategoryByCarModelQuery

@synthesize carModel;

@end

@implementation addGoods2Cart

@synthesize goodsId;
@synthesize goodsNumber;

@end

@implementation searchGoodsQuery

@synthesize keywords;

@end

@implementation searchGoods

@synthesize goods;

@end

@implementation searchGoodInfo

@synthesize goods_id;
@synthesize goods_name;

@end

@implementation searchGoodsByBarCodeQuery

@synthesize barCode;

@end

@implementation searchGoodsByBarCode

@synthesize searchGoodsByBarCode;

@end

@implementation searchGoodsByBarCodeInfo

@synthesize min_price;
@synthesize market_price;
@synthesize goods_id;
@synthesize goods_sn;
@synthesize goods_name;
@synthesize goods_brief;
@synthesize goods_desc;
@synthesize original_img;
@synthesize goods_sale_amount;
@synthesize goods_attr;
@synthesize goods_car;
@synthesize seller_note;
@synthesize slogan;
@synthesize goods_gallery;
@end

@implementation searchGoodsByVinCodeQuery

@synthesize searchGoodsByVinCode;

@end

@implementation myOrderListsQuery

@synthesize index;
@synthesize uid;
@synthesize clientsId;
@synthesize t;
@synthesize p;

@end

@implementation myOrderLists

@synthesize index;
@synthesize page;
@synthesize order_lists;
@end

@implementation orderLists

@synthesize order_id;
@synthesize id_code;
@synthesize instime;
@synthesize price;
@synthesize pay_id;
@synthesize goods_list;

@end

@implementation orderGoods

@synthesize good_id;
@synthesize order_id;
@synthesize name;
@synthesize buy_count;
@synthesize price;
@synthesize img;

@end

@implementation profileQuery

@synthesize clientsId;
@synthesize uid;

@end

@implementation myProfile

@synthesize clients_info;
@synthesize user_list;

@end

@implementation profileIndexQuery

@synthesize clientsId;
@synthesize uid;

@end

@implementation myProfileIndex

@synthesize name;
@synthesize logo;
@synthesize country;
@synthesize province;
@synthesize city;
@synthesize district;
@synthesize addr;
@end







