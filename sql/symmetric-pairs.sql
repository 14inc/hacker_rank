-- URL: https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true

-- Swap X, Y for every row where X>Y. Then sort.
with cte as 
    (select 
        case
            when x > y then y
            else x
        end as xx,
        case
            when x > y then x
            else y
        end as yy
     from Functions
     order by xx),
-- For each sorted and swapped row, use lag window function to generate the value of XX and YY in the previous row
cte2 as 
    (select xx, yy,
    lag(xx) over (partition by xx order by yy) as nx, 
    lag(yy) over (partition by xx order by yy) as ny
    from cte)
-- Then select only rows where the value of XX, YY is identical to next ROW
select xx, yy
from cte2
where xx = nx and yy = ny;


-- See 2 other approaches to solving this problem by other people.

-- SOLUTION 1:
-- WITH CTE AS ( SELECT * FROM FUNCTIONS WHERE X != Y ) 
-- SELECT * FROM CTE
--     WHERE X IN 
--         (SELECT Y FROM CTE) AND Y IN (SELECT X FROM CTE) AND 
--         X <= Y

-- UNION ALL

-- SELECT * FROM FUNCTIONS GROUP BY X,Y HAVING COUNT(X IN (SELECT Y FROM FUNCTIONS)) > 1

-- ORDER BY X


-- SOLUTION 2:
-- with cte as 
-- (select x, y, row_number() over(order by x, y) as id 
--  from Functions)

-- select c1.x, c1.y
-- from cte c1
-- join cte c2 
-- on c1.x  = c2.y and 
--    c2.x  = c1.y and 
--    c1.x <= c1.y and 
--    c1.id < c2.id;


