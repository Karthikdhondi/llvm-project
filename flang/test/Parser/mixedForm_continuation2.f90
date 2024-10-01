! RUN: flang-new -fopenmp -E %s 2>&1 | FileCheck %s
! CHECK: i = 0
! CHECK: i = 1+10 +100+ 1000+ 10000 +100000 +1000000

! RUN: flang-new -fopenmp %s 2>&1 | FileCheck %s
! CHECK: OK

! RUN: flang-new -E %s 2>&1 | FileCheck %s
! CHECK: i = 1+ 10000 +1000000

! RUN: flang-new %s 2>&1 | FileCheck %s
! CHECK: NG

program main
!$ i = 0
 i = 1&
   !$ +10 &
!$+100&
!$&+ 1000&
 &+ 10000&
!$& +100000&
 & +1000000

if(i .eq. 1111111) then
  print *, 'OK'
else
  print *, 'NG'
endif
end program main

