# IOS_dev_learning
record the self study path for IOS develop


最近在自学开发IOS，记录一下学习路径

首先是OC语言学习，参考尼古拉斯赵四的博客，其目录结构已经很清晰。
https://blog.csdn.net/jiangwei0910410003/article/details/41928347

里面有代码示例说明，当然有一小点内容可能是有误的，这个读者可以自行在学习过程中解决修正，这也许是作者留下来的彩蛋，需要自己的寻找解决方法。

有C语言基础的话，学习起来更快，OC就是在C语言的基础上增加了面向对象的思想，例如封装，继承，多态。

对协议的理解为：定义接口，由实现类去实现接口；

对于代理的理解为： 多态实现，在运行时可以用不同的子类去运行；

重要的基础类： 基类NSObject, 字符串， 数组，字典

存储方面的文件操作；

内存管理，这部分调试需要关闭ARC，当时在虚拟机中调试没有找到此功能，后来在Mac真机上完成；


其次是IOS组件学习，参考了《iOS开发指南  从Hello World到App Store上架  第4版 》这本书的目录，不过其中的一些示例有点描述不太适合操作，
所以会在网上临时搜索相关知识点来进行调试学习，下面罗列一下上传demo中的操作内容：

1、hello world，程序员都懂，显示字符串；

2、界面根视图组件UIView;

3、文本显示组件UITextView 和 UITextField；

4、开关组件；

5、HTML显示组件webview;

6、弹框组件；

7、进度显示组件；

8、导航组件；

9、选择器组件；

10、集合视图；

11、表视图；

12、自动布局；

13、三方库引用CocoaPod;

14、界面跳转之模态视图；
https://www.cnblogs.com/XYQ-208910/p/4798875.html

15、数据持久化

https://www.cnblogs.com/XYQ-208910/p/7687512.html

https://www.jianshu.com/p/5b13960eefa2

16、iOS 开发调试方法

https://www.cnblogs.com/Leo_wl/p/4423922.html

17、IOS网络访问框架AFNetworking

https://www.jianshu.com/p/d94cb6b58573

18、wkwebview中 OC和 JS 互相调用

https://www.jianshu.com/p/0a06a90082d0

19、相机调用
https://blog.csdn.net/sifenkesi1/article/details/52621771

注意需要在info.plist中配置声明：

    <key>NSCameraUsageDescription</key>
    <string>cameraDesciption</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>photoLibraryDesciption</string>
    <key>NSPhotoLibraryAddUsageDescription</key>
    <string>photoLibraryAddUsageDescription</string>
    <key>NSMicrophoneUsageDescription</key>
    <string>microphoneUsageDescription</string>

20、定位功能

https://www.jianshu.com/p/a8717e8bd397

注意需要在info.plist中配置声明：

    <key>NSLocationWhenInUseUsageDescription</key>
    <string>LocationWhenInUseUsageDescription</string>
    <key>NSLocationAlwaysUsageDescription</key>
    <string>LocationAlwaysUsageDescription</string>
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
    <string>LocationAlwaysAndWhenInUseUsageDescription</string>

21、获取手机唯一标识

https://www.jianshu.com/p/faa4854ce180

苹果已经将获取真正的IMEI接口屏蔽，这里采用的方案为应用自己生成uuid,然后存入系统keychain中，每次读取都能返回相同结果来标识手机，但是据说系统升级会改变，没有测试过。demo中将原作者的逻辑进行了部分修改，即只需要提供读取接口，在读取接口中做第一次存储的逻辑。

22. 扫码功能

https://blog.csdn.net/yx1166/article/details/83117240

主要了解对于输入输出设备的调用流程，在cocoachina上直接找了份别人写好的demo, 很好用.
