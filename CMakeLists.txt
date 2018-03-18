cmake_minimum_required(VERSION 2.6)

Project(fortran_project Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)

add_executable(read_write test/read_write.f90 src/dictionary_m.f90)

add_executable(example_from_readme test/example_from_readme.f90 src/dictionary_m.f90)

option(WITH_DOXYGEN OFF)

if(WITH_DOXYGEN)
find_package(Doxygen REQUIRED)
add_custom_target(doc
COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_CURRENT_BINARY_DIR}/doc"
COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/doc/doxy_conf
DEPENDS ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/doc/doxy_conf
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)
endif()
