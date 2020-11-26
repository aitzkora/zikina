block data mes_constantes
  use iso_c_binding
  integer :: speed_of_light
  common /csts/ speed_of_light
  data speed_of_light/299792458/
  bind(c, name="csts") :: /csts/ 
end
subroutine trucmuche()
   integer :: speed_of_light
   common /csts/ speed_of_light
   bind(c, name="csts") :: /csts/ 
   print *, "coucou", speed_of_light + 1
end 
