# data model plan:

### The project:

- A site which allows users to create events and then manage user signups.
- A user can create events. 
- A user can attend many events. 
- An event can be attended by many users. 
- Events take place at a specific date and at a location (which you can just store as a string, like "Ohtani's House").


(Table: **users**)
- id:integer
- name:string
- created_at:datetime
- updated_at:datetime
- **associations (Model: User:**
- has_many :registrations
- has_many :attending_events, through: :registrations, source:event
- has_many :created_events, class_name: Event, foreign_key: creator_id


(Table: **events**)
- id:integer
- event_name:string
- event_date:datetime
- creator_id:integer [foreign key to users]
- created_at:datetime
- updated_at:datetime
- **associations: (Model: Event):**
- has_many :registrations
- has_many :users_attending, through: registrations, source:users
- belongs_to :event_creator, class_name: User, foreign_key: creator_id


(Table: **registrations**)
- id:integer
- user_id:integer [foreign key]
- event_id:integer [foreign key]
- created_at:datetime
- updated_at:datetime
- **associations: (Model: Registration):**
- belongs_to :users
- belongs_to :events

 
<hr>
(warm-up exercises:)

### A site for pet-sitting (watching someone's pet while they're gone). People can babysit for multiple pets and pets can have multiple pet sitters.

(Table: **pet_sitters**)

- id:integer
- name:string
- created_at:datetime
- updated_at:datetime
- **has_many** pet_sittings

(Table: **pets**)

- id:integer
- name:string
- created_at:datetime
- updated_at:datetime
- **has_many** pet_sittings

(Table* **pet_sittings**)

- id:integer
- pet_sitter_id:integer [foreign key]
- pet_id:integer [foreign key]
- created_at:datetime
- updated_at:datetime
- **belongs_to** pet_sitter
- **belongs_to** pet

<br>

### You like hosting people for dinner so you want to build a dinner party invitation site. A user can create parties, invite people to a party, and accept an invitation to someone else's party.

(Table: **users**)

- id:integer
- name:string
- created_at:datetime
- updated_at:datetime
- **has_many:** invitations

(Table: **parties**)

- id:integer
- party_name:string
- created_at:datetime
- updated_at:datetime
- **has_many** invitations

(Table: **invitations**)

- id:integer
- user_id:integer [foreign key]
- party_id:integer [foreign key]
- created_at:datetime
- updated_at:datetime
- **belongs_to** user
- **belongs_to** party

<br>

### You and your friends just love posting things and following each other. How would you set up the models so a user can follow another user?

(Table: **users**)

- id:integer
- name:string
- created_at:datetime
- updated_at:datetime
- **has_many** posts
- **has_many** follows_as_follower, class_name: "Follow", foreign_key: :follower_id 
- **has_many** follows_as_followed, class_name: "Follow", foreign_key: :followed_id
- ('users' table has an association with itself via the 'follows' table)



(Table: **posts**)

- id:integer
- name:string
- user_id:integer [foreign key to 'users']
- created_at:datetime
- updated_at:datetime
- **belongs_to** user

(Table: **follows**)

- id:integer
- follower_id:integer [foreign key to 'users']
- followed_id:integer [foreign key to 'users']
- created_at:datetime
- updated_at:datetime
- **belongs_to** follower, class_name: "User"
- **belongs_to** followed, class_name: "User"
