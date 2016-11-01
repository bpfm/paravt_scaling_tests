program random_points
  implicit none
  integer::i,seed
  integer,parameter::n_points=10000
  real::x,y,z
  real,dimension(n_points,3)::point

  seed = 1984756

  call random_seed(seed)

  print*, "generating random points"

  do i=1,n_points
     call random_number(x)
     call random_number(y)
     call random_number(z)
     point(i,:)=200.0*(/x,y,z/)-100.0
     !print*, point(i,:)
  enddo

  print*, "writing to file"

  open(101,file="random_points.txt")
     
  do i=1,n_points
     write(101,*) point(i,:)
  enddo

  close(101)

endprogram
