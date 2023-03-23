use credit_card;

select * from credit_card;
select * from credit_card_label;

-- 1. Group the customers based on their income type and find the average of annual income

select count(Ind_ID) as No_Of_Customers,round(avg(Annual_income)) as Average,type_Income from credit_card
group by type_Income;

-- 2. Find the female owners of Cars and Property
select count(Ind_ID) as no_of_female_owners  from credit_card
where GENDER = 'F' and Propert_Owner = 'Y';

-- 3. Find the male customers who are staying with their families
select count(Ind_ID) from credit_card
where GENDER = 'M' and Housing_type = 'With parents';

-- 4. Please list the top 5 people having the highest income
select Ind_ID from credit_card
where Annual_income = (select max(Annual_income) from credit_card)
order by Ind_ID 
limit 5;

-- 5. How many Married people are having Bad Credit
select count(credit_card.Ind_ID) as people_with_badcredit from credit_card 
inner join credit_card_label on credit_card.Ind_ID=credit_card_label.Ind_ID
where Marital_status = 'Married' and label = 1;

-- 6. What is the highest education level and what is the total count

select count(Ind_ID), Education from credit_card
group by Education;

-- 7. Between Married Males and Females who is having more bad credit
select count(credit_card.Ind_ID) as people_with_badcredit , GENDER from credit_card 
inner join credit_card_label on credit_card.Ind_ID=credit_card_label.Ind_ID
where Marital_status = 'Married' and label = 1
group by GENDER
order by count(credit_card.Ind_ID) desc
;





