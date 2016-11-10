program random_points
  implicit none
  integer::i,seed
  integer,parameter::n_points=100000000
  real,parameter::l_box=100.0
  real::x,y,z,m
  real,dimension(n_points,4)::point

  seed = 1984756

  call random_seed(seed)

  print*, "generating random points"

  do i=1,n_points
     call random_number(x)
     call random_number(y)
     call random_number(z)
     m = 1.0
     point(i,:)=l_box*(2.0*(/x,y,z,m/)-1.0)
     !print*, point(i,:)
  enddo

  print*, "writing to file"

  open(101,file="random_points.txt")
  
  write(101,*) n_points,l_box

  do i=1,n_points
     write(101,*) point(i,:)
  enddo

  close(101)

endprogram
