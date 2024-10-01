! RUN: flang-new -fopenmp -E %s 2>&1 | FileCheck %s
! CHECK:  i = 1+10 +100+ 1000+ 10000 +100000 +1000000
! CHECK: OK

! RUN: flang-new -E %s 2>&1 | FileCheck %s
! CHECK: i = 1+ 10000 +1000000
! CHECK: NG

! Test in mixed way, i.e., combination of Fortran free source form 
! and free source form with conditional compilation sentinel.

program main

! CHECK:  i = 1+10 +100+ 1000+ 10000 +100000 +1000000
 i = 1&
   !$ +10 &
!$+100&
!$&+ 1000&
 &+ 10000&
!$& +100000&
 & +1000000

! CHECK: i = 1111111
if(i .eq. 1111111) then
  print *, 'OK'
else
  print *, 'NG'
endif

end program main

