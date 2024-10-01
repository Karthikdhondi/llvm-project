
! RUN: flang-new -fopenmp -E %s 2>&1 | FileCheck %s
! CHECK:  i=0
! CHECK   i = 1 +10 +100+1000
! RUN: flang-new -fopenmp %s 2>&1 | FileCheck %s
! CHECK: i = 1111
! CHECK: OK


! RUN: flang-new -E %s 2>&1 | FileCheck %s
! CHECK: directive statements should not be dispyed,
! RUN: flang-new %s 2>&1 | FileCheck %s
! CHECK: OK

! Testing continuation line in only free source form conditional compilation sentinel.
program main
   !$ i=0
   !$ i = 1 &
   !$ & +10 &
   !$&+100&
   !$ +1000 
      
      
      
   print *, i 
   if(i .eq. 1111) then
   print *, 'OK'
   else
   print *, 'NG'
   endif
end program main


