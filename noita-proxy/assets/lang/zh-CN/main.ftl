connect_steam = 使用steam联机
connect_steam_create = 创建联机大厅
connect_steam_connect = 连接到剪贴板中的大厅
connect_steam_workaround_label = 将大厅id粘贴到输入框进行连接：(如果你使用的是Wayland，则常规方式不起作用)
connect_steam_connect_2 = 在文本框中连接到大厅
connect_steam_connect_invalid_lobby_id = 剪切板内不包含大厅代码

connect_ip = 使用IP联机

lang_picker = 选择语言(language)

button_confirm = 确认
button_continue = 继续
button_retry = 重试
button_select_again = 再次选择
button_back = 返回

button_set_lang = 设置语言
button_open_discord = 打开Discord服务器

modman = Mod 管理
modman_found_automatically = 自动寻找路径：
modman_use_this = 使用这个路径
modman_select_manually = 手动选择路径
modman_path_to_exe = 选择noita.exe的路径
modman_invalid_path = 无效路径
modman_downloading = 正在下载Mod
modman_receiving_rel_info = 正在接收版本信息
modman_unpacking = 正在解压Mod
modman_installed = Mod已安装
modman_will_install_to = noita-proxy将会把Mod安装到:
modman_another_path = 选择其他路径

player_host = 房主
player_me = 我
player_player = 玩家

version_latest = (最新版)
version_check_failed = (无法检查更新)
version_checking = (检查更新中)
version_new_available = 有可用的更新，版本{ $new_version }

selfupdate = 软件更新
selfupdate_confirm = 确认更新
selfupdate_receiving_rel_info = 接收版本信息...
selfupdate_updated = noita-proxy已更新！重启软件以完成更新。
selfupdate_unpacking = 正在解压中...

noita_not_yet = 还没准备好，请等待Noita启动。
noita_can_connect = 正在等待Noita连接。是时候开一把新的Noita了！
noita_connected = 本地Noita实例已连接。

netman_save_lobby = 将大厅id保存到剪贴板
netman_show_settings = 显示设置窗口
netman_apply_settings = 应用设置并在下一次启动时生效
apply_default_settings = 重置设置为默认值

ip_note = 注意：使用steam联机更可靠，如果可以的话请使用steam联机
ip_connect = 连接至IP
ip_host = 创建一个服务器

error_occured = 发生错误：
error_missing_version_field = 大厅没有版本字段。大厅是由旧的noita-proxy版本创建的。
error_version_mismatch = 版本不匹配，大厅是由{$remote_version}版本的noita-proxy创建的，当前已安装的版本是{$current_version}。
error_lobby_does_not_exist = 大厅不存在

launcher_already_started = Noita已启动。
launcher_no_command = 无法启动Noita：没有启动命令。
launcher_no_command_2 = 你可以使用 --launch-cmd <command> 选项指定启动命令。
launcher_no_command_3 = 你可以在steam的启动项中放入`noita-proxy --launch-cmd "%command%" 用于启动游戏时执行其他命令。
launcher_start_game = 启动Noita
launcher_end_run = 结束游戏
launcher_end_run_confirm = 确认
launcher_only_when_awaiting = 只能在“等待Noita连接”状态下启动游戏。

connect_settings = 游戏设置
connect_settings_debug = 调试设置
connect_settings_debug_en = 调试/作弊模式
connect_settings_debug_fixed_seed = 使用固定种子
connect_settings_seed = 种子：
connect_settings_max_players = 最大联机玩家数
connect_settings_wsv = 要使用的世界同步版本：
connect_settings_player_tether = 启用玩家系绳
connect_settings_player_tether_desc = 玩家系绳：如果其他玩家距离主机太远，则将其传送到主机。
connect_settings_player_tether_length = 系绳长度
connect_settings_item_dedup = 消除由世界生成的重复(同步)项
connect_settings_enemy_hp_scale = 敌人生命值比例
connect_settings_local = 本地设置
connect_settings_autostart = 自动启动游戏

## Game settings

Player-have-same-starting-loadout = 玩家拥有相同的初始装备
connect_settings_spacewars = 允许使用Steam网络联机，即使你没有在Steam上购买游戏，如果你有GOG版本的游戏。所有玩家都需要勾选此选项才能生效，重启noita-proxy以生效
Health-per-player = 每个玩家的生命值
Enable-friendly-fire = 启用队友伤害
Have-perk-pools-be-independent-of-each-other = 启用神山独立天赋池
Amount-of-chunks-host-has-loaded-at-once-synced-enemies-and-physics-objects-need-to-be-loaded-in-by-host-to-be-rendered-by-clients = 主机一次加载的区块数量，同步的敌人和物理对象需要由主机加载才能由客户端渲染
local_health_desc_1 = 每个玩家有自己的独立生命值，所有玩家死亡时游戏结束。
local_health_desc_2 = 有一个复活机制：玩家死亡时变为不受控的敌对阵营，击杀后可以复活死亡的玩家。
Health-percent-lost-on-reviving = 复活时按比例损失最大生命值
global_hp_loss = 全局生命值损失
no_material_damage = notplayer不受到材料伤害
perma_death = 玩家永久死亡
physics_damage = notplayer受到物理伤害
Have-homing-home-on-players = 使制导追踪玩家
shared_health_desc_1 = 生命值共享，值会随着玩家数量变化
shared_health_desc_2 = 调整基于百分比的伤害和完全恢复。
shared_health_desc_3 = 原始模式。
Local-health = 独立生命值模式
Local-health-alt = 独立生命值+代替模式
Local-health-perma = 独立生命值+永久死亡模式
Shared-health = 共享生命值模式
Game-mode = 游戏模式
world-sync-is-pixel-sync-note = 注意：世界同步是指同步世界像素(材质)的部分。敌人和其他实体不受此影响。
Higher-values-result-in-less-performance-impact = 该值越大，对性能影响越小。
World-will-be-synced-every-this-many-frames = 该值将作为世界同步的间隔(帧)。

## Savestate

New-game = 新的游戏
Continue = 继续游戏
savestate_desc = 检测到上一次的存档。你想要继续启动该存档还是开启一局新游戏(并重置存档)？
An-in-progress-run-has-been-detected = 检查到正在运行的存档。

## Player appearance

Gem = 宝石
Amulet = 项链
Crown = 皇冠
Cape-edge-color = 斗篷边缘颜色
Cape-color = 斗篷颜色
Forearm-color = 前臂颜色
Arm-color = 手臂颜色
Alt-color = 次色调
Main-color = 主色调
Reset-colors-to-default = 将颜色重置为默认值
Invert-border = 反转边框
Shift-hue = 调整色相

## Connected

Show-debug-info = 显示debug信息
hint_spectate = 使用[','或d-pad-left]和['.'或d-pad-right]键观看其他玩家视角。
hint_ping = [鼠标中键或右摇杆] 会产生一个信号
Show-debug-plot = 显示调试图
Record-everything-sent-to-noita = 记录发送给noita的所有内容

## IP Connect

ip_could_not_connect = 无法连接
ip_wait_for_connection = 连接至IP...
## Info

info_stress_tests = 我们将在每周六 18:00 UTC 进行公共大厅(也称为压力测试)。加入我们的discord以获取更多信息。
Info = 资讯
## Local settings

connect_settings_random_ports = 不要使用预定的端口。这使系统更稳定，并允许在同一台计算机上启动多个proxy，但Noita必须通过proxy启动。

## UX settings

ping-note = Ping箭头参数
ping-lifetime = Ping箭头的持续时间（秒）。
ping-scale = Ping箭头大小。
ping-lifetime-tooltip = 此参数改变Ping箭头的存活帧数（秒数*60，因为游戏应该以60fps运行）。范围：0-60秒。
ping-scale-tooltip = 此参数改变Ping箭头的大小。(我不知道使用的是哪个单位，但范围在0-1.5之间。)

hide-cursors-checkbox = 禁用其他人的光标
hide-cursors-checkbox-tooltip = 有时候你可能会把朋友的光标和自己的混淆。在这种情况下，你可以通过这个复选框完全禁用它们。
## Steam connect

Switch-mode-and-restart = 切换模式并重启
Make-lobby-public = 公开大厅
## Lobby list

Open-lobby-list = 打开大厅列表
Only-EW-lobbies = 仅限 EW 大厅
Join = 加入
Not-Entangled-Worlds-lobby = 非 Entangled Worlds 大厅
No-public-lobbies-at-the-moment = 当前没有公开大厅 :(
Lobby-list-pending = 正在获取大厅列表…
Refresh = 刷新
Lobby-list = 大厅列表

## Gamemode names

game_mode_Shared = 共享生命值
game_mode_LocalNormal = 独立生命值
game_mode_LocalPermadeath = 独立生命值（永久死亡）
game_mode_LocalAlternate = 独立生命值（替代）
game_mode_PvP = PvP
Local-health-pvp = 独立生命值 PvP
round-based-pvp-mode = 回合制 PvP 模式
pvp-money-steal-percent = 击杀时偷取金钱的百分比
pvp-dont-steal = 不偷取金钱，仅获得击杀奖励
pvp-spawn-chest-on-win = 胜利时生成宝箱
pvp-timed-rounds-hm = 计时回合/HM
pvp-wait-on-time = 按时间结束回合
pvp-time-in-hm = HM 阶段时间
pvp-time-in-round = 回合时间
pvp-wait-on-players = 等待所有玩家完成回合后再开始下一回合
world-generation = 世界生成
duplicate-synced-entities = 复制同步的实体
fix-unseen-chunks = 修复不可见区块内的黑洞/爆炸
disable-kummitus-non-hosts = 在非房主禁用上次死亡的幽灵
give-host-sampo-on-collection = 收集时给予房主三宝磨
spell-ban-list-desc = 法术禁用列表（使用内部名称，逗号分隔）
player-settings = 玩家设置
Share-Gold = 共享金币
Perks = 天赋
perk-ban-list-desc = 天赋禁用列表（使用内部名称，逗号分隔）
global-perks-ignore-desc = 要忽略的全局天赋（内部名称，逗号分隔）。可能导致未定义行为，请勿反馈相关问题。列表见 perk_fns.lua
audio-dropoff-rate = 他人语音的衰减速率
audio-max-range = 语音最大范围
audio-global-input-volume = 全局输入音量
audio-global-output-volume = 全局输出音量
audio-loopback = 环回音频
audio-global-playback = 始终全局播放语音
audio-push-to-talk = 按键说话（键位在 Noita 内设置，默认 T）
audio-use-player-position = 使用玩家位置而非镜头位置
audio-mute-input = 静音输入
audio-mute-input-polied = 被石化时静音输入
audio-mute-input-dead = 死亡时静音输入
audio-mute-output = 静音输出
audio-disabled = 禁用
audio-input-device-label = 输入设备
audio-output-device-label = 输出设备
Show-host-settings = 显示主机设置
Show-audio-settings = 显示音频设置
Close-Proxy = 关闭 Proxy
Failed-to-request-lobby-list = 获取大厅列表失败
reset-all-data = 重置所有数据
Allow-friends = 允许好友加入
nickname = 昵称
Lobby = 大厅
Game-Settings = 游戏设置
VoIP-Settings = 语音设置
Chunk-Map = 区块地图
Noita-Log = Noita 日志
Proxy-Log = Proxy 日志
Connection-Info = 连接信息
Ban-List = 封禁列表
Mod-List = Mod 列表
Back-out = 返回
Netmanager-stopped = 网络管理线程已停止
With-error = 错误信息如下：
No-lobby-created-yet = 尚未创建大厅
save-colors = 保存颜色
requires-noita-restart = 需要重启 Noita
dont-let-more-players-join = 不允许更多玩家加入
dont-send-chunk-map-to-players = 不向玩家发送区块地图
dont-save-chunk-map-desc = 不保存区块地图；由于当前实现，在长时间游玩中会导致 RAM/VRAM 泄漏，因此默认禁用
no-conn-info-tangled = 在 Tangled 模式下无连接信息
save-to-clipboard = 保存到剪贴板
Pending-settings-note = 等待中的设置将在本次游玩结束后生效
