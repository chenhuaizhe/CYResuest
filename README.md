# CYResuest
基于AFN的一个低耦合的iOS端网络框架

# iOS低耦合网络框架解析


> 这些天开始涉及一些后台开发，处理修改完java后台的代码后要在客户端这边验证接口，于是重新重新修改一下客户端的后台代码，参照一个网络框架，重写了一下app的网络框架。  
> 这个框架给我的感觉是代码量有点多，但是结构清晰，耦合度很低。  
> 我打算以后就用这个网络框架了。  
> 这个网络框架的思想其实也很简单：就是把request和responce都封装成对象，所有的网络请求的参数和设置都在request对象内部设置，使用者所有的请求都只需要走 + (void)fetchDataWithRequest:request completion 这一个方法就可以了。 得到的responce也转换成了responce对象，并且根据返回的responce不同，自定义responce对象的属性。  


## 使用示例

>  所有的网络请求都走同一个方法，不同点只是需要构造不同的request对象。  

### 登录

```objective-c
- (void)sendLoginRequest {
NSDictionary *dic = @{
@"account": @"ccyy@qq.com",
@"type": @2,
@"password": @"654321"
};
CYLoginRequest *req = [CYLoginRequest requestWithPostDictionary:dic];
[CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
CYLoginResponce *res = (CYLoginResponce *)responseObject;
}];
}
```

### 上传数据

```objective-c
- (void)sendSportsUploadRequest {
NSArray *sports = @[
@{
@"sport_name": @"登山",
@"uid": @144644799476738229,
@"count": @0,
@"start_time": @1480301050,
@"type": @5,
@"calorie": @195.000005,
@"sportCode": @"000505",
@"data_from": @"录入",
@"end_time": @1480301050,
@"activity": @30,
@"distance": @0,
@"steps": @0
},
@{
@"sport_name": @"快走",
@"uid": @144644799476738229,
@"count": @0,
@"start_time": @1480301311,
@"type": @181,
@"calorie": @125,
@"sportCode": @"018102",
@"data_from": @"录入",
@"end_time": @1480301311,
@"activity": @30,
@"distance": @0,
@"steps": @0
}
];
CYSportsUploadRequest *req = [CYSportsUploadRequest requestWithPostArray:sports];
[CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
N_NSLOG
CYSportsUploadResponce *res = (CYSportsUploadResponce *)responseObject;
}];
}
```

### 下载数据

```objective-c
- (void)sendSportsDownloadRequest {

CYSportsDownloadRequest *req = [CYSportsDownloadRequest requestWithDayStart:@"20161127" days:20];
[CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
N_NSLOG
CYSportsDownloadResponce *res = (CYSportsDownloadResponce *)responseObject;
NSArray *sportsArray = res.content;
NSLog(@"sportsArray=%@",sportsArray);

}];


}
```

### 上传头像

```objective-c
- (void)sendIconUploadRequest {
UIImage *icon = [UIImage imageNamed:@"ccyy.jpg"];
CYBasicRequest *r = [[CYBasicRequest alloc]init];
NSString * fileName = [NSString stringWithFormat:@"%lu.jpg",r.uid];
CYIconUploadRequest *req = [CYIconUploadRequest requestWithFileName:fileName Icon:icon];
[CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
N_NSLOG
CYIconUploadResponce *res = (CYIconUploadResponce *)responseObject;
}];


}
```

### 上传文件

```objective-c
- (void)sendLogFileUploadRequest {
CYBasicRequest *r = [[CYBasicRequest alloc]init];
NSString *path = [[NSBundle mainBundle]pathForResource:@"log.txt" ofType:nil];
NSString *fileName = @"log.txt";
NSDictionary *dic = @{@"uid":@(r.uid),@"type":@1};
CYLogUploadRequest *req = [CYLogUploadRequest requestWithFileName:fileName Path:path PostDictionary:dic];
[CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
N_NSLOG
CYLogUploadResponce *res =  (CYLogUploadResponce *)responseObject;
}];
}

```
## Demo地址

[GitHub - chenhuaizhe/CYResuest: 基于AFN的一个低耦合的iOS端网络框架](https://github.com/chenhuaizhe/CYResuest)

## 问题解析

### 需要添加哪些依赖？

放上我的podFile，需要* AFNetworking* 和* MJExtension*

```
project 'CYRequestDemo.xcodeproj'
inhibit_all_warnings!
platform :ios,’8.0’

target 'CYRequestDemo' do
pod 'AFNetworking'
pod 'MJExtension'

end

```
### Demo工程跑起来之后为什么请求返回相应错误？

我用的是我的本地服务器，所以url我设置的是127.0.0.1.你当然用不了。
看了代码后，需要你修改url、module、function name为自己的，并构建相应的request和responce，思路都是万变不离其宗，但是请求和响应要和后台给的对应上。

### 为什么请求都没有加密？

如果你需要加签名和加密，只需要在request对象基类中添加相应的属性就可以了，到时候作为参数传给后台做对比就可以。
