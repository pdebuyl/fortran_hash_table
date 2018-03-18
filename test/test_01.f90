program test_01
  use dictionary_m
  implicit none

  type(dictionary_t) :: d

  call d%init(10)

  call d%set('one', 'one')
  call d%set('pi', '3.14159')
  call d%set('abc', 'first three letters from the alphabet')
  call d%set('1', 'number one')
  call d%set('a', 'letter a')
  call d%set('fortran', 'programming language')

  write(*,*) 'one', ' = ', d%get('one')
  write(*,*) 'pi', ' = ', d%get('pi')
  write(*,*) 'XYZ', ' = ', d%get('XYZ')



  call d%set('pi', 'pi is the ratio of the perimeter of a circle to its radius')

  write(*,*) 'pi', ' = ', d%get('pi')

  write(*,*) 'output from the method show'

  call d%show()

end program test_01
