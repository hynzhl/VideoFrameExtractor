# 视频帧提取工具 (Video Frame Extractor)

一个基于Qt/QML的视频帧提取工具,可以按照设定的时间间隔从视频中提取图片帧。

## 功能特性

- 支持选择本地视频文件(mp4, avi, mkv, mov, wmv, flv等格式)
- 自定义抽帧时间间隔(1-300秒)
- 设置帧图片导出目录
- 实时显示处理进度和状态
- 支持取消操作
- 使用FFmpeg进行高效视频处理

## 系统要求

- Windows 10/11
- Qt 5.15.2 (msvc2019_64) - 仅编译时需要
- CMake 3.14 或更高版本 - 仅编译时需要
- Visual Studio 2019 或更高版本 - 仅编译时需要
- **FFmpeg** - 运行时必须 (用于视频帧提取)

## 重要: 安装FFmpeg

本程序依赖FFmpeg进行视频处理,使用前请确保已安装FFmpeg:

### 方法1: 添加到系统PATH (推荐)

1. 下载FFmpeg: https://ffmpeg.org/download.html
2. 解压到某个目录 (例如: `C:\ffmpeg`)
3. 将 `bin` 文件夹路径添加到系统PATH环境变量
4. 重启应用程序

### 方法2: 本地放置

将 `ffmpeg.exe` 复制到与 `VideoFrameExtractor.exe` 相同的目录

### 验证安装

```bash
ffmpeg -version
```

## 编译步骤

### 1. 使用CMake命令行编译

```bash
# 进入项目目录
cd VideoFrameExtractor

# 创建构建目录
mkdir build
cd build

# 配置项目
cmake .. -G "Visual Studio 16 2019" -A x64

# 编译
cmake --build . --config Release
```

### 2. 使用Qt Creator编译

1. 打开Qt Creator
2. 文件 -> 打开文件或项目
3. 选择 `CMakeLists.txt`
4. 配置Kit为 Desktop Qt 5.15.2 MSVC2019 64bit
5. 点击构建按钮

## 运行程序

### 方法1: 使用运行脚本
```bash
run.bat
```

### 方法2: 直接运行
```bash
build\Release\VideoFrameExtractor.exe
```

注意: 首次运行前请确保已安装FFmpeg

## 使用说明

1. **选择视频文件:**
   - 点击"浏览..."按钮选择视频文件
   - 支持常见视频格式(mp4, avi, mkv, mov, wmv, flv等)

2. **设置抽帧间隔:**
   - 输入时间间隔(单位:秒,默认1秒)
   - 例如:设置为2表示每2秒提取一帧

3. **选择输出目录:**
   - 点击"浏览..."按钮选择保存图片的目录
   - 如果目录不存在会自动创建

4. **开始提取:**
   - 点击"开始提取"按钮
   - 在状态区域查看处理进度
   - 可随时点击"取消"停止提取

5. **查看结果:**
   - 提取的帧以PNG格式保存
   - 文件命名: `frame_000001.png`, `frame_000002.png`, ...

## 项目结构

```
VideoFrameExtractor/
├── CMakeLists.txt              # CMake配置文件
├── README.md                   # 项目说明文档
├── INSTALL.md                  # 详细安装指南
├── run.bat                     # 运行脚本
├── deploy.bat                  # 部署脚本
├── src/
│   ├── main.cpp                # 主程序入口
│   ├── videoframeextractor.h   # 视频帧提取器头文件
│   └── videoframeextractor.cpp # 视频帧提取器实现
└── qml/
    ├── Main.qml                # 主界面
    └── qml.qrc                 # QML资源文件
```

## 技术栈

- **前端**: QML (Qt Quick Controls 2)
- **后端**: C++ (Qt 5.15.2)
- **视频处理**: FFmpeg (外部工具)
- **构建系统**: CMake

## 常见问题

### "FFmpeg not found" 错误
- 确保FFmpeg已安装并添加到PATH
- 或将ffmpeg.exe放在程序同一目录
- 安装后重启应用程序

### "Invalid video file" 错误
- 检查视频文件是否损坏
- 确认文件格式被FFmpeg支持

### 没有提取到帧
- 检查输出目录是否有写入权限
- 确保磁盘空间充足
- 尝试使用其他视频文件

### 程序无法启动
- 确保Qt 5.15.2运行时库可用
- 检查所有必需的DLL文件是否在可执行文件目录

## 部署

要创建可分发的版本:

```bash
# 运行部署脚本
deploy.bat
```

这会将所有必需的Qt DLL文件复制到 `deploy` 目录。

## 许可证

MIT License - 可自由使用和修改

## 示例

假设有一个60秒的视频,设置间隔为5秒:
- 将提取第0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55秒的帧
- 共提取12张图片
