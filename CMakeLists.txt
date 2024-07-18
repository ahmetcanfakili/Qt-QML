cmake_minimum_required(VERSION 3.5)

project(HelloWorldQt LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Qt5 kurulum yolunu belirleyin
set(CMAKE_PREFIX_PATH "/usr/lib/x86_64-linux-gnu/cmake/Qt5")

find_package(Qt5 COMPONENTS Core Gui Qml Quick REQUIRED)

qt5_add_resources(QT_RESOURCES resources.qrc)

add_executable(HelloWorldQt main.cpp ${QT_RESOURCES})

target_link_libraries(HelloWorldQt Qt5::Core Qt5::Gui Qt5::Qml Qt5::Quick)
