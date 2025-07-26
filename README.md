# warm-up

## Data architecture: A site for pet-sitting (watching someone's pet while they're gone). People can babysit for multiple pets and pets can have multiple pet sitters.

(Table: **pet_sitters**)

id:integer
name:string
created_at:datetime
updated_at:datetime
**has_many** pet_sittings

(Table: **pets**)

id:integer
name:string
created_at:datetime
updated_at:datetime
**has_many** pet_sittings

(Table* **pet_sittings**)

id:integer
pet_sitter_id:integer [foreign key]
pet_id:integer [foreign key]
created_at:datetime
updated_at:datetime
**belongs_to** pet_sitter
**belongs_to** pet

<br>

## You like hosting people for dinner so you want to build a dinner party invitation site. A user can create parties, invite people to a party, and accept an invitation to someone else's party.

(Table: **users**)

id:integer
name:string
created_at:datetime
updated_at:datetime
**has_many:** invitations

(Table: **parties**)

id:integer
party_name:string
created_at:datetime
updated_at:datetime
**has_many** invitations

(Table: **invitations**)

id:integer
user_id:integer [foreign key]
party_id:integer [foreign key]
created_at:datetime
updated_at:datetime
**belongs_to** user
**belongs_to** party

<br>

## You and your friends just love posting things and following each other. How would you set up the models so a user can follow another user?

(Table: **users**)

id:integer
name:string
created_at:datetime
updated_at:datetime
**has_many** posts
**has_many** follows_as_follower, class_name: "Follow", foreign_key: :follower_id 
**has_many** follows_as_followed, class_name: "Follow", foreign_key: :followed_id
('users' table has an association with itself via the 'follows' table)



(Table: **posts**)

id:integer
name:string
user_id:integer [foreign key to 'users']
created_at:datetime
updated_at:datetime
**belongs_to** user

(Table: **follows**)

id:integer
follower_id:integer [foreign key to 'users']
followed_id:integer [foreign key to 'users']
created_at:datetime
updated_at:datetime
**belongs_to** follower, class_name: "User"
**belongs_to** followed, class_name: "User"
