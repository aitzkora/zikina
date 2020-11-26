! common data block
block data mes_constantes
  use iso_c_binding
  integer :: speed_of_light
  common /csts/ speed_of_light
  data speed_of_light/299792458/
  bind(c, name="csts") :: /csts/ 
end


! a subroutine in a external subpogram
! it will be mangled by gfortran by just adding _ 
subroutine trucmuche()
   integer :: speed_of_light
   common /csts/ speed_of_light
   bind(c, name="csts") :: /csts/ 
   print *, speed_of_light + 1
end 
