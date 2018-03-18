program read_write
  use dictionary_m
  implicit none

  type(dictionary_t) :: d

  call d%init(1024)

  call d%set('one', 'one')
  call d%set('pi', '3.14159')

  call d%show()

end program read_write
