
create table pricelist(
    item_id bigserial constraint item_id_key primary key,
    item varchar(20) constraint item_key unique,
    price integer constraint price_key unique
);
drop table pricelist;

insert into pricelist(item, price)
values('Fanta', 10),
	('Sprite', 12),
	('Heineken', 20),
	('Castle Lager', 25),
	('Smirnoff', 30);
create table user_(
    user_id bigserial constraint user_id_key primary key,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(50),CONSTRAINT email_unique UNIQUE (email)
);

create table cart(
    item_id integer references pricelist (item_id),
    user_id integer references user_ (user_id)
);

drop table cart;

select * from pricelist;



select * from user_;

--menu

select * from pricelist;


--add to cart

create table cart(
	user_id integer references user_ (user_id),
    item_id integer references pricelist (item_id)

);
drop table cart;
drop table user_cart
insert into cart(user_id, item_id)
values(1, 5),
		(1, 2),
		(2, 3),
		(3, 1),
		(3, 3),
		(3, 5);

select * from cart;

select

user_.user_id,
user_.name,
user_.email,
cart.item_id, 

pricelist.item, 
pricelist.price
from cart
left join user_
on cart.user_id=user_.user_id
left join pricelist
on cart.item_id=pricelist.item_id;

--Question 5

select 
user_.user_id,
user_.name,
user_.email,
cart.item_id, 

pricelist.item, 
pricelist.price
from cart
left join user_
on cart.user_id=user_.user_id
left join pricelist
on cart.item_id=pricelist.item_id

where user_.user_id = 1;



--Question 6

create table UserShoppingCart(
	user_id integer references user_ (user_id),
	email varchar references user_(email),
    item_id integer references pricelist (item_id),
	item varchar references pricelist (item),
	price integer references pricelist(price)
	
);


insert into UserShoppingCart(user_id, email, item_id, item, price)
select cart.user_id, user_.email, cart.item_id, pricelist.item, pricelist.price
from cart 
left join user_
on cart.user_id = user_.user_id
left join Pricelist
on cart.item_id = pricelist.item_id;


select user_id, email, count(item), sum(price)
from UserShoppingCart
where user_id = 1
group by user_id, email;



