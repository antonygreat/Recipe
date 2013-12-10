DROP TABLE ingredient_sets;
DROP TABLE Ingredients;
DROP TABLE Ingredient_Groups;
DROP TABLE Type_Sets;
DROP TABLE Types;
DROP TABLE Images;
DROP TABLE Comments;
DROP TABLE Favorites;
DROP TABLE Recipes;

CREATE TABLE recipes
(
  id serial NOT NULL,
  userid integer REFERENCES Users (id),
  title character varying(255),
  description character varying(5000),
  isban boolean,
  imageid integer,
  favnum integer,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT recipes_pkey PRIMARY KEY (id)
);

CREATE TABLE favorites
(
  id serial NOT NULL,
  recipeid integer references recipes(id),
  userid integer references users(id),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT favorites_pkey PRIMARY KEY (id)
);

CREATE TABLE comments
(
  id serial NOT NULL,
  recipeid integer references recipes(id),
  userid integer references users(id),
  isBan boolean,
  comment character varying(255),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT comments_pkey PRIMARY KEY (id)
);

CREATE TABLE types
(
  id serial NOT NULL,
  name character varying(255),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT types_pkey PRIMARY KEY (id)
);

CREATE TABLE type_sets
(
  id serial NOT NULL,
  recipeid integer references recipes(id),
  typeid integer references types(id),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT type_sets_pkey PRIMARY KEY (recipeid,typeid)
);

CREATE TABLE ingredient_groups
(
  id serial NOT NULL,
  name character varying(255),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT ingredient_groups_pkey PRIMARY KEY (id)
);

CREATE TABLE ingredients
(
  id serial NOT NULL,
  name character varying(255),
  groupid integer references ingredient_groups(id),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT ingredients_pkey PRIMARY KEY (id)
);

CREATE TABLE ingredient_sets
(
  id serial NOT NULL,
  recipeid integer references recipes(id),
  ingredientid integer references ingredients(id),
  amountnum numeric,
  unitofmeasure character varying(255),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT ingredient_sets_pkey PRIMARY KEY (recipeid,ingredientid)
);

CREATE TABLE images
(
  id serial NOT NULL,
  userid integer references users(id),
  recipeid integer references recipes(id),
  name character varying(255),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT images_pkey PRIMARY KEY (id)
);

INSERT INTO Ingredient_Groups(name) VALUES 
('Meat'),
('Sea Food'),
('Vegetable');

INSERT INTO Ingredients(name,groupid) VALUES 
('Beaf',1),
('Chicken',1),
('Chicken Leg',1),
('Chicken Wings',1),
('Cow Tail',1),
('Deer Meat',1),
('Duck',1),
('Egg',1),
('Heart',1),
('Lamb',1),
('Liver',1),
('Lung',1),
('Pegion',1),
('Pig Blood',1),
('Pig Ear',1),
('Pig Kidney',1),
('Pig Leg Bone',1),
('Rabbit',1),
('Ribs',1),
('Sausage',1),
('Soft Bone',1),
('Tongue',1),
('Turkey',1),
('Luncheon Meat',1),
('Smoked Meat',1),
('Shank',1),
('Pork Intestine',1),
('Pig Brain',1),
('Pork',1),
('Pig Feet',1),
('Preserved Ham',1),
('Short Loin',1),

('Crab',2),
('Salmon',2),
('Shrimp',2),
('Largehead Hairtail',2),
('Kelp',2),
('Oyster',2),
('Seaweed',2),

('Broccoli',3),
('Carrot',3),
('Chinese Cabbage',3),
('Cucumber',3),
('Eggplant',3),
('Lettuce',3),
('Mushroom',3),
('Potato',3),
('Radish',3),
('Tomato',3);

INSERT INTO Types(name) VALUES 
('Breakfast'),
('Lunch'),
('Dinner'),
('Starter'),
('Main Course'),
('Soup'),
('Snack'),
('Desert'),
('Warm Food'),
('Cold Food'),
('Spicy'),
('Sweet'),
('Sour'),
('Salty'),
('Vegetarian');
