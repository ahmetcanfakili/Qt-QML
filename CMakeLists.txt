cmake_minimum_required(VERSION 3.5)

project(QtTest LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_PREFIX_PATH "/usr/lib/x86_64-linux-gnu/cmake/Qt5")

find_package(Qt5 COMPONENTS Core Gui Qml Quick REQUIRED)

qt5_add_resources(QT_RESOURCES resources.qrc)

add_executable(QtTest main.cpp ${QT_RESOURCES})

target_link_libraries(QtTest Qt5::Core Qt5::Gui Qt5::Qml Qt5::Quick)
