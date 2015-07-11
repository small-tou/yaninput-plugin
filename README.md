# yaninput-plugin
可以任意嵌入App的颜文字输入法插件，一句话即可集成颜文字输入功能到自己的App中。


使用方式：

1.copy plugin文件夹中的三个文件到你自己的项目中。同时link系统库：libsqlite3.0.dylib

2.在需要用到的controller中引入 YanInputStatic.h

3.在调用的地方设置键盘：

```
//假设textView是你界面中的一个输入框，可以是UITextField也可以是一个UITextView；
UIView *keyboard = [YanInputStatic  getYanInputViewwithParentController:self andTextView:textView];
[textView setInputView:keyboard];
//这时候，点击textView开始编辑的时候默认会弹出颜文字键盘。
//如果要切换回系统键盘，把InputView设置成nil即可。
//在example文件夹中有例子
```

如果有不懂之处欢迎加我微信：mier963。或者邮箱：xinyu198736@gmail.com

我的app《颜文字输入法》目前有60W用户（2015年7月），欢迎加入此插件的第三方app联系互推，或者定制自己的输入法。

界面截图：（切换按钮不是输入法自带的部分）

<img src="http://htmljs.b0.upaiyun.com/uploads/1436602169109-a0c04b4349025f89c850bff4ad2c6b02.png" width=400 style="width:300px;"/>
