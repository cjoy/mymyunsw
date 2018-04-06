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

create or replace view nstudents(count)
as
    select count(*)
    from students
    left join staff on students.id = staff.id
    where staff.id is null;
;

create or replace view nstaff(count)
as
    select count(*)
    from staff
    left join students on students.id = staff.id
    where students.id is null;
;

create or replace view nboth(count)
as
    select count(*)
    from staff
    left join students on students.id = staff.id
    where students.id is not null
    and staff.id is not null;
;

create or replace view Q2(nstudents, nstaff, nboth)
as
    select nstudents.count as nstudents, nstaff.count as nstaff, nboth.count as nboth
    from nstudents, nstaff, nboth;
;

-- Q3: ...

-- TODO: doesn't match the case where there are multiple staff members

create or replace function get_roleid(text) returns integer
as $$
    select id from staff_roles where name=$1;
$$ language sql
;

create or replace view Q3(name, ncourses)
as
    select people.name as name, count(*) as ncourses
    from people, course_staff
    where people.id = course_staff.staff and course_staff.role = get_roleid('Course Convenor')
    group by people.id
    order by ncourses desc
    limit 1;
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

