program use_ssdm
  use dictionary_m
  implicit none

  type(dictionary_t) :: d, b
  character(len=128) :: ss, sss
  integer :: i

  call b%init(4*512)

  do i = 1, 100000
     read(*, '(a)') ss
     read(*, '(a)') sss
     call b%set(trim(ss), trim(sss))
  end do

  call fileshow(b)

contains

  subroutine fileshow(d)
    class(dictionary_t), intent(in) :: d

    integer :: i, j, s

    do i = 1, d%dict_size
       s = d%buckets(i)%current_idx
       if (s > 0) then
          do j = 1, s
             !write(*,*) 'key len', len(d%buckets(i)%entries(j)%key)
             write(*,'(a)', advance='no') d%buckets(i)%entries(j)%key
             write(*,'(a)', advance='no') ' = '
             write(*,'(a)', advance='no') d%buckets(i)%entries(j)%value
             write(*,*)
          end do
       end if
    end do

  end subroutine fileshow

end program use_ssdm
