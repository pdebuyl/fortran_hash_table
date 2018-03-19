!> \file example_from_readme.f90
!! \brief Very short example to demonstrate the syntax of the dictionary_t object

!> Define a dictionary_t object, use the set and get methods.
program example_from_readme
  use dictionary_m
  implicit none

  type(dictionary_t) :: d

  call d%init(1024)

  call d%set('one', 'one')
  call d%set('pi', '3.14159')

  write(*,*) 'one', ' = ', d%get('one')
  write(*,*) 'pi', ' = ', d%get('pi')

end program example_from_readme
