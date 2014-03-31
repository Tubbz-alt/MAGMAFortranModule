Program LinearEquations
! This solves the matrix equation A*x=b using MAGMA
! Include both the custom magma module (magma.f90) and the ISO_C_BINDING module
! so that the variables that are passed to the magma function are of the right C
! type
  use magma
  use iso_c_binding
  Implicit none

! Declarations, notice single precision
  Real (KIND=C_DOUBLE) :: A(3,3)
  Character (KIND=C_CHAR), parameter :: uplo = "U"
  Integer (KIND=C_INT) :: n = 3, i,j, lda = 3, ok, status

! Define matrix A
  A(1,1)=3
  A(1,2)=1
  A(1,3)=5
  A(2,1)=1
  A(2,2)=6
  A(2,3)=5
  A(3,1)=3
  A(3,2)=7
  A(3,3)=8

  print*, "MAGMA"

! Find the solution using the MAGMA routine MAGMA_SGESV
  status = MAGMA_DPOTRF(uplo, n, a, lda, ok)

! Parameters in the order as they appear in the function call
!    order of matrix A, number of right hand sides (b), matrix A,
!    leading dimension of A, array that records pivoting, 
!    result vector b on entry, x on exit, leading dimension of b
!    return value   
  do i=1, 3
    do j = 1, 3
      write(*,*) A(i,j)
    end do
  end do

  A(1,1)=3
  A(1,2)=1
  A(1,3)=5
  A(2,1)=1
  A(2,2)=6
  A(2,3)=5
  A(3,1)=3
  A(3,2)=7
  A(3,3)=8
  print*, "LAPACK"
! print the vector x
  call DPOTRF(uplo, n, a, lda, ok)
  do i=1, 3
    do j = 1, 3
      write(*,*) A(i,j)
    end do
  end do
end