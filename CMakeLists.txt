cmake_minimum_required(VERSION 2.6)

Project(fortran_project Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)
enable_testing()

add_library(dictionary_m src/dictionary_m.f90)

foreach(test_name read_write)
add_executable(${test_name} test/${test_name}.f90)
target_link_libraries(${test_name} dictionary_m)
endforeach(test_name)

foreach(test_name example_from_readme test_01)
add_executable(${test_name} test/${test_name}.f90)
target_link_libraries(${test_name} dictionary_m)
add_test(NAME ${test_name} COMMAND ${test_name})
endforeach(test_name)

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
