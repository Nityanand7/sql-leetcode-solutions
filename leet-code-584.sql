SELECT name 
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;

# We have to use IS NULL because NULL is considered an unknown value in SQL. It is also not comparable using normal comparison operators like = or !=.
