Sarafu xDAI data – 25 January 2020 to 15 June 2021

======================================================
Brief summary: README.txt
------------------------------------------------------
We describe a dataset of account information and transaction records for a digital community currency in Kenya. One unit of "Sarafu" is roughly equivalent in value to a Kenyan shilling. The Sarafu system has existed since 2013 and began operating digitally via USSD feature-code cellular technology in 2017. This dataset includes pseudonymized account information for around 55,000 users and records of all Sarafu transactions conducted from 25/01/2020 to 15/06/2021. User transactions capture various economic and financial activities such as purchases, transfers, and participation in savings and lending groups. So-called "chamas" are key to the operation of the Sarafu system and clearly labeled in the data. This dataset will contribute to research on the operation of community currencies, monetary systems, and economic networks in underdeveloped areas. The observation period includes the first year of the coronavirus pandemic and several documented pilot projects and development interventions. 

======================================================
Transaction dataset: sarafu_txns_20200125-20210615.csv
------------------------------------------------------
id - Assigned by the system. PostgresSQL transaction index.
timeset - Assigned by the system.  Date and time of transaction. Format: YYYY-MM-DD HH:MM:ss.ms
transfer_subtype - Assigned by the system. The "standard" transactions are those made via the USSD system. A "disbursement" transaction creates Sarafu and adds them to an account. Analogously, "reclamation" transactions remove Sarafu from an account. The "agent_out" transactions identify specific operations where donors were buying Sarafu from Chamas using Kenyan Shillings; these are few. 
	DISBURSMENT - currency creation
	RECLAMATION - currency dissolution
	STANDARD - regular transaction
	AGENT_OUT - cash-out operation
source - Assigned by the system. Unique identifier (xDAI_blockchain_address) of sender.
target - Assigned by the system. Unique identifier (xDAI_blockchain_address) of recipient.
weight - Assigned by the system. Amount of tokens transferred from source’s wallet to target’s wallet.
token_name - Assigned by the system. In this period, this was fixed as ‘Sarafu’.
token_address - Assigned by the system. Blockchain code of Sarafu.

======================================================
User dataset: sarafu_users_20210615.csv
------------------------------------------------------
id - Assigned by the system. PostgresSQL user index.
start - Assigned by the system. Date of account registration.
xDAI_blockchain_address - Assigned by the system. Wallet ID on xDAI Blockchain. Unique identifier.
old_POA__blockchain_address - Assigned by the system.  Wallet ID on the now-defunct POA Blockchain. Indicates that the user had an account prior to 25 January 2020; otherwise empty.
final_bal - Assigned by the system. Final balance (in Sarafu) when the dataset was generated on 15 June 2021. 
area_name - Assigned by GE staff. Standardized name of a geographic area derived from user-provided settlement name. Data codes:
	Kinango Kwale
 	Mukuru Nairobi
	Misc Nairobi 
	Kisauni Mombasa 
 	Misc Mombasa
	Kilifi
 	Nyanza
 	Turkana
 	Misc Rural Counties
 	other
area_type - Assigned by GE staff. Designation of settlement type based on user-provided settlement name. Data codes:
	Rural
	Urban
	Periurban
	Other
held_roles - Assigned by the system. Normal users are identified as a "beneficiary". Chamas officially recognized by Grassroots Economics can become a "group account". The "admin" accounts are used by staff for algorithmic currency management and administrative operations. The "token agent" accounts were used for specific cash-out operations for a brief period. Data codes:
	BENEFICIARY, standard user / standard transactions
	GROUP_ACCOUNT, local savings and loans groups (Chamas)
	ADMIN, account of Grassroots Economics staff
	TOKEN_AGENT, account used to cash out Sarafu
	VENDOR, account used for in-kind donations
	None, account created in error (no user)
gender - Declared by the user. The user may select among "male", "female" and "other". Data codes:
	Male
	Female
	Other
	Unknown
business_type - Assigned by GE staff. Standardized category of economic activity derived from user-provided product category. Data codes:
	Labour - Non-farm workers of any kind. Carpenters, bakers, electricians, tailors, chefs, housekeeping, shepherds, beauticians, barbers, artists, engineers, managers, programmers, mechanics, security guards, insurance agents, waiter/waitress, artisans, employees, bricklayers, masons, etc.
	Food - Sellers of any kind of local food.
	Farming - Users registered as farmers or working in farms - e.g. labourers specialised in plowing fields.
	Shop - Kiosks, boutiques, phone shops, cafes, pubs, clubs, clothing shops, home furniture shops, jewelry shops,   detergent sellers, electric utensils sellers, perfumery, flower shops, etc.
	Fuel/Energy - Sellers of firewood, kerosene, petrol, biogas, charcoal, paraffin, and diesel.
	Transport - Drivers, bicycle rental, bike, motorbike, and car services. The boda boda riders are "taxi" drivers who carry clients on a motorbike.
	Other - Unknown
	Water - People in charge of managing the water tanks (including ones donated by Grassroots Economics to Chamas) and other water re-sellers.
	Education - Teachers in schools (from Early Childhood Education to secondary school or college), coaches, book sellers, tutors, facilitators, Red Cross volunteers, consulting, baby sitters.
	Health - Traditional and official doctors, nurses, pharmacies, laboratories, first aid operators, and veterinarians.
	Environment - Waste collection, gardening, seeding, tree planting, cleaning, recycling.
	Savings - May indicate a member of a Chama, or a Chama not yet officially recognized by Grassroots Economics. 
	Government - Community authorities (e.g. elders), governmental employees, governmental and military officials, soldiers.
	Faith - Religious chiefs or religious groups.
	System - Account managed by Grassroots Economics staff.
------------------------------------------------------
Additional User Statistics:
------------------------------------------------------
ovol_in - total number of tokens that came into this account from non-STANDARD transactions
ovol_out - total number of tokens that left this account from non-STANDARD transactions
otxns_in - number of transactions incoming from non-STANDARD transactions
otxns_out
ounique_in - number of unique transactions incoming from non-STANDARD transactions
ounique_out
svol_in - total number of tokens that came into this account from STANDARD transactions
svol_out
stxns_in - number of transactions incoming from STANDARD transactions
stxns_out
sunique_in - number of unique transactions incoming from STANDARD transactions
sunique_out