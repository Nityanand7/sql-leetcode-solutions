SELECT name, population, area
FROM world
WHERE population >= 25000000 OR area >= 3000000;

# alternate way. UNION might not always give an optimized result
SELECT name, population, area
FROM world
WHERE population >= 25000000 
UNION
SELECT name, population, area
FROM world
WHERE area >= 3000000;
