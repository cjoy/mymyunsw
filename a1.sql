-- COMP3311 18s1 Assignment 1
-- Written by Chris Joy (z5113243), April 2018

-- Q1: ...

create or replace function countEnrolments(integer) returns bigint
as $$
    select count(*)
    from course_enrolments
    where course_enrolments.student = $1;
$$ language sql
;

create or replace view Q1(unswid, name)
as
    select people.unswid, people.name
    from people
    where countEnrolments(people.id) > 65
    order by people.unswid;
;

-- Q2: ...

create or replace view Q2(nstudents, nstaff, nboth)
as
... one SQL statement, possibly using other views defined by you ...

;

-- Q3: ...

create or replace view Q3(name, ncourses)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q4: ...

create or replace view Q4a(id)
as
... one SQL statement, possibly using other views defined by you ...
;

create or replace view Q4b(id)
as
... one SQL statement, possibly using other views defined by you ...
;

create or replace view Q4c(id)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q5: ...

create or replace view Q5(name)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q6: ...

create or replace function Q6(integer) returns text
as
$$
... one SQL statement, possibly using other views defined by you ...
$$ language sql
;

-- Q7: ...

create or replace function Q7(text)
	returns table (course text, year integer, term text, convenor text)
as $$
... one SQL statement, possibly using other views defined by you ...
$$ language sql
;

-- Q8: ...

create or replace function Q8(integer)
	returns setof NewTranscriptRecord
as $$
declare
	... PLpgSQL variable delcarations ...
begin
	... PLpgSQL code ...
end;
$$ language plpgsql
;


-- Q9: ...

create or replace function Q9(integer)
	returns setof AcObjRecord
as $$
declare
	... PLpgSQL variable delcarations ...
begin
	... PLpgSQL code ...
end;
$$ language plpgsql
;

