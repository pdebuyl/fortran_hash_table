!> \file read_write.f90
!! \brief Using dictionary_t to store a configuration file

!> Read a "equal sign" separated input file
!!
!! Usage:
!!    ./read_write name_of_input_file [dict_size]
!!
!! dict_size is an optional integer argument that sets the size of the hash table. The
!! default value is 1024.
!!
!! Output: the program returns one line per key, with the key and the value separated by an
!! equal sign.

program use_ssdm
  use dictionary_m
  implicit none

  type(dictionary_t) :: b
  character(len=128) :: line
  character(len=:), allocatable :: k, v, fname
  integer :: iostat, eq_location, funit, dict_size

  if (command_argument_count() < 1) then
     stop 'missing argument for parameter file'
  end if

  call get_command_argument(1, line)
  fname = trim(adjustl(line))

  if (command_argument_count() < 2) then
     dict_size = 1024
  else
     call get_command_argument(2, line)
     read(line, *) dict_size
  end if

  call b%init(dict_size)

  open(file=fname, newunit=funit)
  read_loop: do
     read(funit, '(a)', iostat=iostat) line
     if (iostat < 0) exit read_loop
     if (iostat > 0) cycle read_loop
     eq_location = index(line, '=')
     if (eq_location == 0) cycle read_loop

     k = trim(adjustl(line(1:eq_location-1)))
     v = trim(adjustl(line(eq_location+1:)))

     if (len(k) ==0) then
        write(*,*) 'empty key while reading data'
        stop
     end if
     if (len(v) ==0) then
        write(*,*) 'empty value while reading data'
        stop
     end if

     call b%set(k, v)

  end do read_loop

  close(funit)

  call fileshow(b)

contains

  subroutine fileshow(d)
    class(dictionary_t), intent(in) :: d

    integer :: i, j, s

    do i = 1, d%dict_size
       s = d%buckets(i)%current_idx
       if (s > 0) then
          do j = 1, s
             write(*,'(a)', advance='no') d%buckets(i)%entries(j)%key
             write(*,'(a)', advance='no') ' = '
             write(*,'(a)', advance='no') d%buckets(i)%entries(j)%value
             write(*,*)
          end do
       end if
    end do

  end subroutine fileshow

end program use_ssdm
