cmake_minimum_required (VERSION 3.13)

# Suppresses a warning in cmake 3.x concerning a currently unused feature (setting VERSION in project() command)
if (POLICY CMP0048)
  cmake_policy(SET CMP0048 NEW)
endif (POLICY CMP0048)

project(testcpack VERSION 0.0.1)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 REQUIRED COMPONENTS Widgets Svg LinguistTools)
find_package(PkgConfig)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/" ${CMAKE_MODULE_PATH})

include(GetGitRevisionDescription)
git_describe(GIT_DESCRIBE "--tags")

macro(set_warning_level target)
  if(MSVC)
    target_compile_options(${target} PRIVATE /W4 /WX)
  else()
    target_compile_options(${target} PRIVATE -Wall -Wextra -pedantic -Werror)
  endif()
endmacro()

add_executable(testcpack src/main.cpp)

set_warning_level(testcpack)

target_include_directories(testcpack PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/src"
    "${PROJECT_BINARY_DIR}"
)
target_compile_features(testcpack PUBLIC cxx_std_17)
target_link_libraries(testcpack Qt5::Widgets Qt5::Svg)

if (WIN32)
  target_link_libraries(testcpack -lopengl32)
else()
  target_link_libraries(testcpack -ldl -lutil)
  target_link_libraries(testcpack -lGL)
endif()

install(TARGETS testcpack)
# include(InstallRequiredSystemLibraries)
include(Packaging)

if (WIN32)
  install(CODE "
    include(\"BundleUtilities\")
    fixup_bundle(
      \"\${CMAKE_INSTALL_PREFIX}/bin/testcpack.exe\"
      \"\"
      \"\"
    )"
    COMPONENT Runtime
  )
endif()
