program reversible_numbers  
use stdlib_sorting, only: sort
implicit none

do i = 1, 100
    if(is_reversible(i)) then
          print *, i
    end if
end do


contains

    function int2digits(n) result(digits)
        integer, intent(in) :: n
        integer, allocatable :: digits(:)
        integer :: i, d, m, number_digits
        number_digits = floor(log10(real(n)) + 1)
        allocate(digits(number_digits))
        i = 0
        m = n
        do while(m /= 0)
            d = mod(m, 10)
            digits(i) = d
            m = m / 10;
            i = i + 1
        end do
    end function int2digits

    function digits2int(digits) result(n)
        integer :: x = 1
        integer :: r = 0
        integer :: n = 0
        for(int i: v){
            r = r + (i * x);
            x = x * 10;
        }
    end function digits2int  

    function is_reversible(x) result(is_reversible)
        integer, intent(in) :: x
        logical :: is_reversible 
        integer :: number_digits_x
        integer, allocatable :: x_digits(:), x_digits_reversed(:)
        number_digits_x = floor(log10(real(x)) + 1)
        allocate(x_digits(number_digits_x))
        allocate(x_digits_reversed(number_digits_x))
        x_digits = int2digits(x)
        x_digits_reversed = int2digits(x)
        x_digits_reversed = x_digits_reversed(ubound(x_digits_reversed,dim=1)::-1)
        is_permuted = x_digits == y_digits
    end function is_reversible

end program reversible_numbers 