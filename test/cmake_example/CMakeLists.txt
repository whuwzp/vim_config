cmake_minimum_required(VERSION 2.6)
# 定义工程名称
project("main")
 
set(CMAKE_CXX_COMPILER "clang++") 
set(targets	main)

# main source files 
aux_source_directory(. main_src_files)
# add sub dirs
set(subdirs hello1 hello2)
FOREACH(subdir ${subdirs})
	add_subdirectory(${subdir})
ENDFOREACH(subdir)

# other header files
set(includes
	${PROJECT_SOURCE_DIR}/mbedtls/include/
) 
# other libs files
set(libs
	${PROJECT_SOURCE_DIR}/mbedtls/lib/libmbedtls.a 
	${PROJECT_SOURCE_DIR}/mbedtls/lib/libmbedcrypto.a
	${PROJECT_SOURCE_DIR}/mbedtls/lib/libmbedx509.a
)

set(CMAKE_CXX_FLAGS "-std=c++11 -stdlib=libc++ -pthread -Werror -Weverything -Wno-documentation-unknown-command -Wno-sign-conversion -Wno-switch-enum -Wno-unused-variable -Wno-unused-macros -Wno-zero-as-null-pointer-constant -Wno-reserved-id-macro -Wno-documentation-deprecated-sync -Wno-implicit-int-conversion -Wno-deprecated-declarations -Wno-disabled-macro-expansion -Wno-float-equal -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-global-constructors -Wno-exit-time-destructors -Wno-missing-prototypes -Wno-padded -Wno-old-style-cast")
set(CMAKE_BUILD_TYPE Debug) 
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(CMAKE_EXE_LINKER_FLAGS "-lc++ -lc++abi") 
include_directories(${includes})
add_executable(${targets} ${main_src_files})
target_link_libraries(${targets} ${libs} ${subdirs}) 
