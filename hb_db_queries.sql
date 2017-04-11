-- USERS
select * from users;

-- create user
insert into users (first_name, last_name, email, phone) values ('Valentyna', 'Gorbachenko', 'gorbachenko.valentyna@gamil.com', 6503027126);

select * from users where id=1;

alter table users modify column phone VARCHAR(255);
-- alter table users modify column phone double;
-- update user
update users set password = "password", updated_at = NOW()  where id = 1;
update users set phone = '6503027126', updated_at = NOW()  where id = 1;

-- HABITS
select * from habits;

-- update colomn type
alter table habits modify column amount float UNSIGNED;

-- delete habit by id
delete from habits where id = 1;

-- create habit 
insert into habits (users_holder_id, habit_name, amount, created_at, updated_at) values (1, 'nails biting', 10.50, NOW(), NOW());
insert into habits (users_holder_id, habit_name, amount, created_at, updated_at) values (1, 'swearing', 2, NOW(), NOW());

-- update a habit
update habits set amount = 5, updated_at = NOW() where id = 2;
update habits set amount = 2.50, updated_at = NOW() where id = 3;
-- create another user
insert into users (first_name, last_name, email, phone, password) values ('Svetlana', 'Sokolovskaia', 'sokolovskaia.svetlana@gamil.com', '6503027127', 'password');

-- HELPERS
select * from helpers;

insert into helpers (users_helper_id, habits_id, habits_users_holder_id, created_at, updated_at)
values (3, 2, 1, NOW(), NOW());
-- should not be able to write the same helper to the same habit
delete from helpers where id = 2;
insert into helpers (users_helper_id, habits_id, habits_users_holder_id, created_at, updated_at)
values (3, 3, 1, NOW(), NOW());

-- VIOLATIONS

select * from violations;

-- create violation for habit id = 2 and id = 3

insert into violations (users_helper_id, habits_id, habits_users_holder_id) values (3, 2, 1);
update violations set paid = True, updated_at = NOW() where id =1;
-- update violations set paid = False, updated_at = NOW() where id =1;

insert into violations (users_helper_id, habits_id, habits_users_holder_id) values (3, 3, 1);

-- if I delete habit with id = 3 it should delete violation with id =2 and helpers with id = 3

-- delet habit with id = 3

delete from habits where id = 3; -- it did it correctly 

-- if I delete user with id = 1 it should delete in helper id = 1, violations id =1 and all habits for now it is id = 2

delete from users where id = 1;

