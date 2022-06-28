SELECT * FROM student ;

-- Update Data  
UPDATE student 
SET major = 'Mathematics'
WHERE major = 'Maths';

UPDATE student 
SET major = 'French'    -- Action 
WHERE student_id = 2 ;  -- Logic

UPDATE student 
SET major = 'Language'
WHERE major = 'English' OR major = 'French';

UPDATE student 
SET st_name = 'Selena', major = 'Arts'
WHERE student_id = 1 ;

-- Applied to each row
UPDATE student 
SET major = 'undecided';

-- Deleting from table
DELETE FROM student 
WHERE student_id = 5; -- Deletes the entire row 

