

# logitech-pubg
绝地求生罗技鼠标宏
PUBG recoil control script for Logitech gaming mouse 

#  风险自负。


- `logitech gaming software`过去没有触发过任何Ban wave，但过去没有，不代表将来也没有。

#  更新说明


2018-2-28

5, 7, 8键分别对应M16A4, M416, AKM

ScrollLock控制是否自动开关单倍瞄准镜

CapsLock控制四倍镜压枪开关

# 食用说明


- 下载并安装`logitech gaming software`。
  - LGS下载地址 : http://support.logitech.com/software/lgs
- 点击pubg，选择编写脚本。
  ![](https://github.com/liantian-cn/logitech-pubg/raw/master/img/20171014103015.png)

- 复制[adv_mode.lua](https://raw.githubusercontent.com/liantian-cn/logitech-pubg/master/adv_mode.lua)的代码到脚本框内。

- 按ctrl+s 保存。



# 编辑设置

![](https://github.com/liantian-cn/logitech-pubg/raw/master/img/20171014104238.png)
  
## 1.  为枪械分配按键编号
 
- 按键编号可以通过查看下方日志得到，当按下鼠标按键时，下方日志提示`event = MOUSE_BUTTON_RELEASED , arg = X`，这个X就是按键编号。
- 枪械拥有6种，而不同型号的罗技鼠标功能键数量可能小于6，为不需要使用的武器分配`nil`值。
- 按下武器设置的k键（默认5，7，8）可以切换、开关武器特定脚本。


## 2.  设置开火按键和模式切换按键

- 开火`fire key`按键需要和游戏内设置一致，并在游戏内取消鼠标左键的绑定。
- 模式切换键`mode switch key`按下时，后座力放大3~4倍，便于使用四倍镜。
- 默认情况，开火键是"Pause"，方向键上方最右一个。使用大小写锁定键切换4倍模式。
- 在使用M16A4模式的时候，此脚本可以自动点击`fire key`开火键。其他情况使用枪支自带的全自动模式。

![](https://github.com/liantian-cn/logitech-pubg/raw/master/img/20171014110324.png)


## 3. 灵敏度设置 

- 如果您修改游戏菜单中的鼠标灵敏度设置，则需要修改设置。
- 鼠标dpi不影响脚本运行，罗技已经做好了转换。

![](https://github.com/liantian-cn/logitech-pubg/raw/master/img/20171015014208.png)

## 4. 混淆设置

- 在默认模式下，射击间隔从30ms到39ms随机变化。 可以修改几个变量来更改此随机范围。

- 当 `weapon_speed_mode = ture`, 使用武器速度做基准，而不是默认的30ms.


## 5.编辑脚本后记得ctrl + s保存。

#  推荐设置

罗技的大多数游戏鼠标包含5个快捷键。默认1个前进、1个后退、1个放大dpi，一个缩小dpi，一个放大镜。

- 分配一个按键使用ump9，这样按键同时也适合全配件的m416和scar-l.
- 分配一个按键使用m16a1, m16a1搭配红点瞄准镜或全息瞄准镜，不需要其他配件，就可以发挥威力。
- 分配一个按键使用akm，akm的模式同样适用于sks和mini 14.
- 分配一个按键使用大跳。
- 分配一个给取消后座力补偿。


![](https://github.com/liantian-cn/logitech-pubg/raw/master/img/20171014153403.png)


# 常见问题 ? 

## Q1: 无法自动射击　？
一般是因为使用代理加速器，导致游戏是以管理员身份运行导致的。

### 以管理员身份运行LGS ###
文件坐标："C:\Program Files\Logitech Gaming Software\LCore.exe" ，可以在这个程序的属性>兼容性，勾选以“管理员身份运行此程序”

UAC会隔离user权限的user32.dll对管理员权限的进程访问.  [keybd_event](https://msdn.microsoft.com/en-us/library/windows/desktop/ms646304(v=vs.85).aspx) 和 [SendInput](https://msdn.microsoft.com/en-us/library/windows/desktop/ms646310(v=vs.85).aspx) 都属于 user32.dll.所以，如果pubg是管理员权限运行的，也需要以管理员权限运行LGS。

你可能没有注意到Pubg是以管理员身份运行的，也许是因为pubg是 steam.exe的子进程 , steam 又是steam update的子进程。 steam update 以管理员权限更新steam。 也或许，是因为网游加速器需要lsp劫持或者vpn拨号，是以管理员权限启动的，然后通过加速器启动的游戏。

### 设置 "当游戏正在运行时锁定配置" ###
默认的，LGS只对当前的活动窗口生效。[GetActiveWindow](https://msdn.microsoft.com/en-us/library/windows/desktop/ms646292(v=vs.85).aspx) ,在Win10中，活动窗口可能被输入法或者提醒功能抢占。



# 一些不无聊可以谈谈的问题

这些问题，国内玩家问的很多，很多论坛都在谈论，随便说说。

## Q1: 为什么我看隔壁的鼠标宏只能打在一个点上？这个项目却跟没用一样 ##

A: 请区分“鼠标宏”和“无后坐力挂”的区别。

在PUBG这个游戏内，后座力由几个向量构成:

* 垂直方向上： 
  * 一个非线性的固定后座力。
  * 一个最大值线性增加的随机后座力。
  * 一个抵抗后座力恢复效果，同样包含固定和随机的成分。

* 水平方向上：
  * 只有一个最大值线性增加的随机后座力。

* 一个线性增长的散射度。令你瞄准也可能会打歪。

后座力上的随机性，使的这个游戏没有完美的压枪，即便APLUSVABLE和SHROUD的爆头率，也是远低于他们csgo的。
更不存在完美的“鼠标宏”，宏只能对垂直方向的非线性后座力有效，所以在作者看来：`这个repository的效果，虽然不能说完美，但已经尽力了，鼠标宏能实现的不过如此。`

关于具体数值，可以解开`TslGame-WindowsNoEditor_objects.pak`后，使用UE编辑器打开`Content\Blueprints\Weapons\WeaponConfig`下的文件查询到。

再来说说“**无后坐力挂**”，目前无后坐力挂分为两种：

* 修改游戏pak文件实现的无后坐力，可以参见[UC论坛的帖子](https://www.unknowncheats.me/forum/playerunknown-s-battlegrounds/245772-recoil-gold-players-pak-mods.html)，完全利用蓝洞的设计漏洞实现。俗称的"无后"
* 写内存的方式实现的无后座力，就是俗称的"外挂"。
  * 喜欢研究代码，可以参见[G-E-N-E-S-I-S/TslGame_MULTI_HACK](https://github.com/G-E-N-E-S-I-S/TslGame_MULTI_HACK)和[TJ888/PUBG-SDK](https://github.com/TJ888/PUBG-SDK)，学习技术总是无罪的。

不管哪种，都可以实现枪的子弹打到一个点上。目前来说，这都是高风险的作弊行为。

## Q2: 怎么看待鼠标宏？ ##

A: 参考[wiki对于"作弊"的解释](https://en.wikipedia.org/wiki/Cheating)：
It is generally used for the breaking of rules to gain unfair advantage in a competitive situation. 
翻译过来就是：在竞争中获得不公平的优势。
那么什么是不公平的，什么又是公平，存在公平么？

* 144hz的显示器，相对60hz的显示器，是否是不公平的？
* 使用[ROG的声波雷达](https://rog.asus.com/technology/rog-sound-innovations/sonic-radar/)，相对普通声卡，是否是公平的？
* 使用8700k+1080ti流畅玩家，是否对于3570+760的玩家是不公平？

所以本来本来没有绝对的公平，只能define 公平=一个限度内的不公平。

所以，鼠标宏是否算作作弊，要看你心中的限度有多大。

## Q3: 作者现在什么枪用什么鼠标宏？ ##

如前所述，在pubg中，鼠标宏的作用极其有限。所以，当你游戏时间超过200小时的时候，鼠标宏可能除了用于M16A1的连射外就无他用了。
liantian就是这个状态，目前游戏时间305小时，这个宏基本用不到了...


## Q4：我的朋友用罗技鼠标宏被封号了 ##

A：不管你在哪个论坛看到这个言论，99%有以下几个真相：
 
* "我的朋友"="我自己"
* 如果不是吓唬人，那就是那个LZ买到了“无后pak”或者“无后挂”。

## Q5：罗技鼠标宏会被检测么？ ##

A：几乎可以100%确定，已经被检测到了。

被任何主流反作弊检测到并不难，毕竟....：

* 宏不是硬件宏，只是用LGS内置的LUA引擎运行的软件宏而已。
* LGS没有任何反注入、反检测什么的。
* 宏是明文保存在你的电脑里，并加载到内存里的。

## Q6：罗技鼠标宏会被封号么？ ##

A： 很难想象，这是一个商业性的问题，而不是技术问题。

罗技是世界最大的游戏外设制造商，自定义脚本这个功能，作为罗技高端G系列键鼠的卖点而存在。而不只罗技，其他游戏外设厂商雷蛇，也有同样的功能。
所以，如果任何游戏厂商想在自己的游戏中鼠标宏无法作用，与其去封号，不如去找外设厂商谈谈。

目前，即便竞技性最强的CS:GO，也没有发生应为几大外设厂商的宏功能导致封号的案例发生。

# 版权说明 

- 使用[The Unlicense](https://github.com/liantian-cn/logitech-pubg/blob/master/LICENSE "The Unlicense")授权，允许任意使用。（拿去卖也不介意，但麻烦自行售后）
- 不提供任何服务，功能性建议可以在[Issues](https://github.com/liantian-cn/logitech-pubg/issues?q= "Issues")提出。



