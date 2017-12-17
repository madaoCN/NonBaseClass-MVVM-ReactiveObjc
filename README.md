# FxxkBaseClass-MVVM-ReactCocoa
遵循组合优于继承，采用 AOP方法和基类说Fxxk Off，采用 MVVM架构，ReactCocoa做动态绑定，JLRoutes 进行组件化

### 概览：主要内容如下：
> 1. 采用AOP思想，使用 __Aspects__  来完成替换 Controller ，View，ViewModel基类，和基类说拜拜
> 2. View层采用 __MVVM__ 设计模式，使用 __ReactiveObjC__ 进行数据绑定
> 3. 网络层使用 __YTKNetwork__ 配合 __ReactiveCocoa__  封装网络请求，解决如何交付数据，交付什么样的数据（去Model化)等问题
> 4. 采用 __JLRoutes__ 路由 对应用进行组件化解耦


### 简单实现登录，登录功能

![pic1](https://github.com/madaoCN/FxxkBaseClass-MVVM-ReactiveObjc/blob/master/image_1.jpeg)
![pic2](https://github.com/madaoCN/FxxkBaseClass-MVVM-ReactiveObjc/blob/master/image_2.jpeg)

### 后续待完成事项
- [ ] 本地化持久化层架构
- [ ] 待补充

### blog相关地址
简书传送门 [iOS架构实践干货：AOP替代基类 + MVVM + ReactiveObjC + JLRoutes组件化](http://www.jianshu.com/p/921dd65e79cb)

### 感谢

Casa大神一系列文章

[iOS应用架构谈 view层的组织和调用方案](https://casatwy.com/iosying-yong-jia-gou-tan-viewceng-de-zu-zhi-he-diao-yong-fang-an.html)

[iOS应用架构谈 网络层设计方案](https://casatwy.com/iosying-yong-jia-gou-tan-wang-luo-ceng-she-ji-fang-an.html)

[iOS应用架构谈 组件化方案](https://casatwy.com/iOS-Modulization.html)

以及
[MGJRouter](https://github.com/meili/MGJRouter)

还有
[YTKNetwork](https://github.com/yuantiku/YTKNetwork)



