
! RUN: flang-new -fopenmp -E %s 2>&1 | FileCheck %s
! CHECK:  i = 1 +10 +100 + 1000 + 10000
! RUN: flang-new -fopenmp %s 2>&1 | FileCheck %s
! CHECK: OK


! RUN: flang-new -E %s 2>&1 | FileCheck %s
! CHECK: i = 1 +10 +100 + 1000 + 10000
! RUN: flang-new %s 2>&1 | FileCheck %s
! CHECK: OK

! Testing continuation lines in only Fortran Free form Source
program main
   i = 1 &
   +10 &
   &+100
   & + 1000 &
   + 10000 
! CHECK: i = 11111
   print *, i 
if(i .eq. 11111) then
  print *, 'OK'
else
  print *, 'NG'
endif
 
end program main

