/*
URL: https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true
*/
select 
    case
        when ((A + B) <= C) or ((A+C) <= B) or ((B+C) <= A) then 'Not A Triangle'
        when (A = B) and (B = C) then 'Equilateral'
        when (A = B) OR (A = C) OR (B = C) then 'Isosceles'
        else 'Scalene' 
    end as Triangle_Type
from Triangles
