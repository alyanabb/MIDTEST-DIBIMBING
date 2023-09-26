CREATE TABLE input_table (
    id INT,
    num INT
);

INSERT INTO input_table (id, num)
VALUES
    (1, 1),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1);
    
SELECT DISTINCT num 
FROM (
    SELECT num,
           LAG(num) OVER (ORDER BY id) AS prev_num,
           LEAD(num) OVER (ORDER BY id) AS next_num
    FROM input_table
) AS subquery
WHERE num = prev_num AND num = next_num
ORDER BY num ASC;