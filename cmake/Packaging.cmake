set(CPACK_PACKAGE_NAME "${CMAKE_PROJECT_NAME}")
set(CPACK_PACKAGE_VERSION "${GIT_DESCRIBE}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "test cpack")
set(CPACK_PACKAGE_CONTACT "https://github.com/pasbi/testcpack/")
set(CPACK_PACKAGE_VENDOR "The Ommpfritt Team")

set(CPACK_SOURCE_IGNORE_FILES
   "/.gitignore"
   "${CMAKE_BINARY_DIR}/"
   "/.git/"
   "/.deps/"
   "/.build/"
   "/.clangd"
)

set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")

# Set package peoperties for Windows
if(WIN32)
  set(CPACK_GENERATOR "NSIS")
  set(CPACK_PACKAGE_EXECUTABLES "testcpack;${CMAKE_PROJECT_NAME}")
  set(CPACK_PACKAGE_INSTALL_DIRECTORY "${CMAKE_PROJECT_NAME}")
  # SET(CPACK_NSIS_MUI_ICON "${CMAKE_SOURCE_DIR}/data/icons/${CMAKE_PROJECT_NAME}.ico")
  # SET(CPACK_NSIS_MUI_UNIICON "${CMAKE_SOURCE_DIR}/data/icons/${CMAKE_PROJECT_NAME}.ico")
  set(CPACK_NSIS_INSTALLED_ICON_NAME "${CMAKE_INSTALL_BINDIR}\\\\testcpack.exe")
  set(CPACK_NSIS_DISPLAY_NAME "${CMAKE_PROJECT_NAME}")
  set(CPACK_NSIS_HELP_LINK "https://github.com/pasbi/testcpack")
  set(CPACK_NSIS_URL_INFO_ABOUT "https://github.com/pasbi/testcpack")
  set(CPACK_NSIS_MODIFY_PATH OFF)
  set(CPACK_NSIS_ENABLE_UNINSTALL_BEFORE_INSTALL ON)

  # set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
endif()

include(CPack)
