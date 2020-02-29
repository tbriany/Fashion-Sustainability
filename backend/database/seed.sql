
DROP DATABASE IF EXISTS fashion_footprint_db;

CREATE DATABASE fashion_footprint_db;

\c fashion_footprint_db;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    firstname VARCHAR NOT NULL, 
    lastname VARCHAR NOT NULL,
    agreed_on_terms BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    business_id INT UNIQUE NOT NULL
);

CREATE TABLE textiles (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  pic VARCHAR,
  care VARCHAR,
  environmental_impact VARCHAR
);

CREATE TABLE types (
  id SERIAL PRIMARY KEY, 
  name VARCHAR
);


CREATE TABLE styles  (
  id SERIAL PRIMARY KEY, 
  name VARCHAR
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    brand_id INT REFERENCES brands(id) ON DELETE CASCADE,
    type_id INT REFERENCES types(id) ON DELETE CASCADE,
    name VARCHAR,
    default_pic VARCHAR,
    description VARCHAR,
    closing_date DATE, 
    textile_id INT REFERENCES textiles(id) ON DELETE CASCADE,
    going_to_production BOOlEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE votes  (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE wishlists (
  id SERIAL PRIMARY KEY,
  willing_to_buy BOOLEAN DEFAULT false,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  product_id INT  REFERENCES products(id) ON DELETE CASCADE,
  style_id INT REFERENCES styles(id) ON DELETE CASCADE
);

CREATE TABLE facts (
  id SERIAL PRIMARY KEY,
  fact VARCHAR
);

INSERT INTO users (email, password, firstname, lastname)
    VALUES  ('briany@gmail.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Briany', 'T'),
            ('chuck@gmail.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Chuck', 'A'),
            ('suzette@gmail.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Suzette', 'I'),
            ('amin@gmail.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Amin', 'B');

INSERT INTO brands (email, password, name, business_id)
    VALUES ('info@nike.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Nike', 1234567),
('info@levis.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Levis', 1234565),
('info@hermes.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Hermes', 1234568),
('info@louis vuitton.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Louis Vuitton', 1234569),
('info@cartier.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Cartier', 1234570),
('info@rolex.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Rolex', 1234571),
('info@uniqlo.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Uniqlo', 1234572),
('info@h&m.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'H&M', 1234573),
('info@zara.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Zara', 1234574),
('info@gucci.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Gucci', 1234575),
('info@adidas.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Adidas', 1234576),
('info@chanel.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Chanel', 1234577),
('info@swarovski.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Swarovski', 1234578),
('info@burberry.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Burberry', 1234579),
('info@tom ford.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Tom Ford', 1234580),
('info@lululemon.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Lululemon', 1234581),
('info@the north face.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'The North Face',1234582),
('info@prada.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Prada', 1234584),
('info@new balance.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'New Balance', 1234585),
('info@michael kors.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Michael Kors', 1234586),
('info@chow tai fook.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Chow Tai Fook', 1234587),
('info@under armour.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Under Armour', 1234588),
('info@tj maxx.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'TJ Maxx', 1234589),
('info@tiffany & co..com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Tiffany & Co.', 1234590),
('info@coach.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Coach', 1234591),
('info@foot locker inc..com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Foot Locker Inc.', 1234592),
('info@c&a.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'C&A', 1234594),
('info@next.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Next', 1234595),
('info@chopard.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Chopard', 1234596),
('info@dolce & gabbana.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Dolce & Gabbana', 1234597),
('info@patek philippe.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Patek Philippe',1234598),
('info@moncler.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Moncler', 1234599),
('info@christian louboutin.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Christian Louboutin', 1234600),
('info@omega.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Omega', 1234601),
('info@ray ban.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Ray Ban', 1234602),
('info@salvatore ferragamo.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Salvatore Ferragamo', 1234603),
('info@vera wang.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Vera Wang', 1234604),
('info@dior.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Dior', 1234605),
('info@hugo boss.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Hugo Boss', 1234606),
('info@armani.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Armani', 1234607),
('info@nine west.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Nine West', 1234608),
('info@fendi.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Fendi', 1234609),
('info@skechers.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Skechers', 1234610),
('info@old navy.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Old Navy', 1234611),
('info@iwc schaffhausen.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'IWC Schaffhausen', 1234612),
('info@primark.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Primark', 1234613),
('info@max mara.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Max Mara', 1234614),
('info@polo ralph lauren.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Polo Ralph Lauren', 1234615),
('info@manolo blahnik.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Manolo Blahnik',1234616),
('info@audemars piguet.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Audemars Piguet', 1234617),
('info@diesel.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Diesel', 1234618),
('info@calvin klein.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Calvin Klein', 1234619),
('info@net-a-porter.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Net-a-Porter', 1234620),
('info@furla.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Furla', 1234621),
('info@gap.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'GAP', 1234622),
('info@longines.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Longines', 1234623),
('info@forever 21.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Forever 21', 1234624),
('info@steve madden.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Steve Madden', 1234625),
('info@stuart weitzman.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Stuart Weitzman', 1234626),
('info@urban outfitters.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Urban Outfitters', 1234627),
('info@longchamp.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Longchamp', 1234628),
('info@puma.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Puma', 1234629),
('info@sisley.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Sisley', 1234630),
('info@lao feng xiang.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Lao Feng Xiang',1234631),
('info@tissot.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Tissot', 1234632),
('info@tommy hilfiger.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Tommy Hilfiger',1234633),
('info@zalando.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Zalando', 1234634),
('info@nordstrom.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Nordstrom', 1234635),
('info@asos.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'ASOS', 1234636),
('info@tory burch.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Tory Burch', 1234637),
('info@lacoste.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Lacoste', 1234638),
('info@topshop.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Topshop', 1234639),
('info@g-star.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'G-star', 1234640),
('info@aldo.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Aldo', 1234641),
('info@oakley.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Oakley', 1234642),
('info@cole haan.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Cole Haan', 1234643),
('info@jimmy choo.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Jimmy Choo', 1234644),
('info@valentino.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Valentino', 1234646),
('info@elie taharie.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Elie Taharie', 1234647),
('info@jaeger-le coultre.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Jaeger-Le Coultre', 1234648),
('info@fossil.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Fossil', 1234649),
('info@vacheron constantin.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Vacheron Constantin', 1234650),
('info@american eagle outfitters.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'American Eagle Outfitters', 1234651),
('info@elie saab.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Elie Saab', 1234652),
('info@patagonia.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Patagonia', 1234653),
('info@ted baker.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Ted Baker', 1234654),
('info@bogner.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Bogner', 1234655),
('info@new look.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'New Look', 1234656),
('info@asics.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Asics', 1234657),
('info@breguet.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Breguet', 1234658),
('info@escada.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'ESCADA', 1234659),
('info@tag heuer.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Tag Heuer', 1234660),
('info@banana republic.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Banana Republic', 1234661),
('info@desigual.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Desigual', 1234662),
('info@swatch.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Swatch', 1234663),
('info@cavalli.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Cavalli', 1234664),
('info@brunello cucinelli.com', '$2b$12$BnlkuACZiHUs8h0TLWejv.NaSyBXQGNWnczdYt8KrdDEDV9VHQ4/O', 'Brunello Cucinelli', 1234665);


INSERT INTO styles (name)
    VALUES ('red stuff');

INSERT INTO types (name)
    VALUES ('Baby Boys Shoes'),
           ('Baby Girls Shoes'),
           ('Boys Activewear'),
           ('Boys Coats & Jackets'),
           ('Boys Jeans'),
           ('Boys Newborn'),
           ('Boys Pajamas'),
           ('Boys Pants'),
           ('Boys Sets & Outfits'),
           ('Boys Shirts'),
           ('Boys Shoes'),
           ('Boys Shorts'),
           ('Boys Socks'),
           ('Boys Suits & Dress Shirts'),
           ('Boys Sweaters'),
           ('Boys Sweatshirts & Hoodies'),
           ('Boys Swimwear'),
           ('Boys Underwear'),
           ('Girls Activewear'),
           ('Girls Coats & Jackets'),
           ('Girls Dresses'),
           ('Girls Jeans'),
           ('Girls Leggings & Pants'),
           ('Girls Newborn'),
           ('Girls Pajamas'),
           ('Girls Sets & Outfits'),
           ('Girls Shoes'),
           ('Girls Shorts'),
           ('Girls Socks & Tights'),
           ('Girls Sweaters'),
           ('Girls Sweatshirts & Hoodies'),
           ('Girls Swimwear'),
           ('Girls Tops'),
           ('Girls Underwear'),
           ('Men Activewear'),
           ('Men Athletic Shoes & Sneakers'),
           ('Men Bags & Backpacks'),
           ('Men Belts & Suspenders'),
           ('Men Big & Tall'),
           ('Men Blazers & Sport Coats'),
           ('Men Boots'),
           ('Men Casual Shoes'),
           ('Men Coats & Jackets'),
           ('Men Dress Shirts'),
           ('Men Dress Shoes'),
           ('Men Hats-Gloves-Scarves'),
           ('Men Hoodies & Sweatshirts'),
           ('Men Jeans'),
           ('Men Jewelry & Cufflinks'),
           ('Men Loafers & Drivers'),
           ('Men Luggage'),
           ('Men Pajamas-Lounge-Sleepwear'),
           ('Men Pants'),
           ('Men Polos'),
           ('Men Sandals & Flip-Flops'),
           ('Men Shirts'),
           ('Men Shorts'),
           ('Men Slippers'),
           ('Men Suits & Tuxedos'),
           ('Men Sunglasses'),
           ('Men Sweaters'),
           ('Men Swimwear'),
           ('Men T-Shirts'),
           ('Men Ties-Bowties-Pocket Squares'),
           ('Men Underwear & Socks'),
           ('Men Wallets'),
           ('Men Watches'),
           ('Women Activewear'),
           ('Women Boots'),
           ('Women Bras, Panties & Lingerie'),
           ('Women Cashmere'),
           ('Women Coats'),
           ('Women Dresses'),
           ('Women Flats'),
           ('Women Handbags & Wallets'),
           ('Women Hats, Gloves & Scarves'),
           ('Women Heels & Pumps'),
           ('Women Jackets & Blazers'),
           ('Women Jeans'),
           ('Women Jewelry'),
           ('Women Jumpsuits & Rompers'),
           ('Women Pajamas, Robes & Loungewear'),
           ('Women Pants & Leggings'),
           ('Women Skirts'),
           ('Women Suits & Suit Separates'),
           ('Women Sunglasses By Sunglass Hut'),
           ('Women Sweaters'),
           ('Women Swimwear'),
           ('Women Tights, Socks, & Hosiery'),
           ('Women Tops'),
           ('Women Watches');

INSERT INTO facts(fact)
    VALUES('The apparel and footwear industries account for a combined estimate of 8% of the world’s greenhouse gas emissions, and fashion is the third highest-polluting industry in the world.'), 
           ('A 2016 McKinsey report revealed that three-fifths of all clothing items will end up in an incinerator or landfill within a year after being produced.'),
           ('If we keep this up, by 2050 the fashion industry could use more than 26 percent of the “carbon budget” associated with a 2o C pathway (a long-term goal to limit global warming to less than 2°C above pre-industrial levels).'),
           ('We don’t really wear our clothes. Worldwide, clothing utilization (how often we put something on) has decreased by 36 percent compared to 15 years ago.'),
           ('It’s estimated that less than 1 percent of the material used to produce clothing is recycled into something more. That’s about a loss of 100 billion USD worth of materials every year.'),
           ('By 2030, it’s expected that fashion waste will increase to a 148 million ton problem.'),
           ('According  the Global Fashion Agenda, 26 percent of business owners surveyed believe that low consumer willingness to pay a premium for sustainable products was the greatest barrier for them to become more sustainable.'),
           ('…But consumer attitudes for ethical fashion are increasingly favorable. Sixty percent of millennials say they want to shop more “sustainably.”'),
           ('Many brands are moving to more sustainable production methods. As of May 2018, 12.5 percent of the global fashion market has pledged to make changes by 2020.'),
           ('The clothing brand Patagonia was the first to make polyester fleece out of plastic bottles.'),
           ('Cotton, a popular material in clothing, requires high levels of water and pesticides, which cause issues in developing countries.'),
           ('About 2,000 different chemicals are used in textile processing — yet only 16 are approved by the Environmental Protection Agency.'),
           ('According to the United Nations Economic Commission for Europe, the fashion industry produces 20 percent of global wastewater.'),
           ('Only 15 percent of consumers recycle their used clothing.'),
           ('The fashion industry (including apparel and footwear) accounts for 8.1% of the world’s greenhouse gas emissions.'),
           ('As much as 20% to 35% of all primary source microplastics in the marine environment are from synthetic clothing, according to academic estimates.'),
           ('The value of the ethical clothing market increased by 19.9% in 2018, according to Ethical Consumer magazine.'),
           ('By 2030, it’s expected that there will be 148 million tons of fashion waste.'),
           ('7,000 liters of water are used in the making of a pair of jeans.'),
           ('Under 1% of the material used to produce clothing is recycled into new clothing at the end of its life.'),
           ('12.5% of global fashion companies have pledged to make changes to their process in favor of adopting more sustainable practices by 2020.'),
           ('59 major textile, apparel, and retailers – including Adidas, Dibella, Eileen Fisher, Gap Inc., H&M, Lindex, MetaWear, Target, and Timberland— aim to increase their use of Recycled Polyester (rPET) by at least 25% by 2020.'),
           ('Of 71 leading clothing retailers in the UK, 77% believed there was a likelihood of modern slavery occurring at some stage in their supply chains.'),
           ('A polyester shirt has more than double the carbon footprint of a cotton shirt (5.5 kg CO2e vs. 2.1 kg CO2e).'),
           ('One kilogram of cotton – equivalent to the weight of a shirt and pair of jeans – can take as much as 10,000–20,000 liters of water to produce.'),
           ('The fashion industry is projected to use 35% more land for fibre production by 2030—an extra 115 million hectares that could be left for biodiversity or used to grow crops to feed an expanding population.'),
           ('Textile production is a major contributor to climate change. It produces an estimated 1.2 billion tonnes of CO2 equivalent (CO2e) per year – more than international flights and maritime shipping combined.'),
           ('Worldwide clothing utilization has dropped by 36% compared to how much we used our clothes 15 years ago.'),
           ('Only 15% of people recycle their old or used clothing.'),
           ('An increase of 10% in second-hand clothing sales could deliver environmental benefits, cutting carbon emissions per tonne of clothing by 3% and water use by 4%.'),
           ('Extending the life of clothing by an extra nine months could reduce carbon, waste and water footprints by around 20–30% each.'),
           ('Approximately 1,130,000 tonnes of clothing were purchased in the UK in 2016, an increase of almost 200,000 tonnes since 2012.'),
           ('In the UK alone, around three hundred thousand tonnes of clothing still ends up in household bins every year with around 20% of this going to landfill and 80% incinerated.'),
           ('Eight to 10 percent of global greenhouse gas emissions comes from the fashion industry, which is more than the aviation and maritime shipping industries combined.'),
           ('The fashion industry produces and sells somewhere between 80 billion and 150 billion garments a year globally.'),
           ('Nearly three-fifths of all clothing produced ends up in incinerators or landfills within years of being made.'),
           ('Sales of clothing have almost doubled from one trillion dollars in 2002 to 1.8 trillion dollars in 2015.'),
           ('Fashion consumption is expected to grow, with sales of clothing projected to rise to $2.1 trillion by 2025'),
           ('Apparel consumption is expected to rise by 63%  from 62 million tons today to 102 million tons in 2030.'),
           ('The average person buys 60% more items of clothing and keeps them for about half as long as 15 years ago.'),
           ('On average a person consumes 11.4kg of apparel each year.'),
           ('30% of clothing in the average UK wardrobe has not been worn in the past year or so. This equates to around 1.7 billion items of clothing not been worn for at least a year.'),
           ('The average Australian consumer spends $2,288 on clothing and footwear per year.'),
           ('Australia is the second-largest consumers of new textiles, each person buying an average of 27kg of new textiles.'),
           ('North Americans is the largest consumers of new textiles, consuming 37kgs each.'),
           ('Western Europeans consume 22kg of new textiles each.'),
           ('The average UK household spends £1,700 on purchasing clothing annually.'),
           ('The contents of the average UK household wardrobe are worth £4,000 or more.'),
           ('The carbon emissions generated by the clothing of the average UK household is equivalent to driving an average modern car 6,000 miles.'),
           ('On average, the global water footprint of a UK household’s clothing exceeds 200,000 litres per year – enough to fill over 1,000 bathtubs.'),
           ('In the UK, the estimated average lifetime for a garment of clothing is 2.2 years, or just under two years and three months.'),
           ('Americans consume nearly 20 billion garments a year, equivalent to 62 garments each.'),
           ('Global average consumption of new textiles is 13kg per person.'),
           ('In the past 15 years, the average number of times a garment is worn before it ceases to be used has decreased by 36%.');

INSERT INTO textiles (name, pic, care, environmental_impact)
      VALUES('Cotton', 'https://image.made-in-china.com/2f0j00hukGmbePfHon/Knitting-Fabric-Solid-Cotton-Fabric-Cotton-Spandex-Fabric-for-T-Shirt-Pullover.jpg', 'Hot Water Wash — Tumble Dry Warm', 'Cotton fabric is made from yarn spun from the fibres of the cotton seedpod, called a boll. Most of the worlds cotton is grown in India and China, usually on farms that rely heavily on pesticides, fertilisers and intensive irrigation. Growing 1 kilogram of non-organic cotton lint (the raw cotton fibre) uses about 2,120 litres of water from irrigation, according to Textile Exchange, a not-for-profit group promoting sustainable practices within the industry. Cotton is generally harvested by machine, then undergoes ginning, a mechanical process that removes the fibres from their seeds. These fluffy fibres are then subject to a series of processes, such as carding and combing, to smooth and refine them until they are ready to be spun into yarn. A Textile Exchange life cycle analysis published last year found organic cotton — which is usually grown using water-conserving practices and without pesticides and fertilisers — had reduced potential for global warming, acidification, soil erosion, water consumption and non-renewable energy compared with conventional cotton production.'),
            ('Polyester, Acrylic, Nylon, Elastane', 'https://image.made-in-china.com/2f0j00hrdYJoRqHfbU/160GSM-Nylon-Polyester-Spandex-Lycra-Knitted-Swimwear-Fabric-with-Elastic-for-Swimsuits-Underwear-Sportswear-Pajamas.jpg', 'Cool Water Wash — Tumble Dry Warm or Air Dry', 'Synthetics such as polyester, acrylic, nylon and elastane are made using fossil fuels. Polyester is the most widely used fibre in clothing, accounting for nearly half the worlds fibre production, or 63,000 million tonnes each year, according to Textile Exchange. To make polyester, chemicals from petroleum are liquefied under high pressure and forced through tiny holes. As the liquid is squeezed out the holes, it solidifies into fibres. These fibres are then drawn out to make them longer and thinner, and then spun into a yarn. Sometimes other processes, such as dyeing, crimping or dulling the natural lustre of the fibre, are involved in these early stages. While synthetics are usually made from non-renewable resources, some are made from recycled materials, such as polyester made from recycled bottles. Recycled polyester reduces the need for fossil fuels and diverts plastic bottles from landfill. As technology continues to advance, polyester textile manufacturer could eventually become a closed-loop system, according to Textile Exchange. But beyond the manufacturing phase, all synthetics, recycled or not, have a longer-term environmental impact while they are being used by you, the consumer. Every time you wash your polyester clothing, it sheds microscopic fibres that travel into waterways, adding to plastic pollution in our oceans.'),
            ('Wool', 'https://www.woolme.co.uk/blog/wp-content/uploads/2013/02/wool-yarn6.jpg', 'Hand Wash — Air Dry', 'Australia is the largest wool producer in the world, with about 75 million sheep producing about 4.47 kilograms of wool per head, but the fibre holds a relatively small share of global consumption: 1.2 per cent in 2015, according to the International Wool Textile Organisation. Like cotton (and other textile fibres), wool processing involves many water and energy-intensive phases, including multiple washes to clean the fibre. This process is called scouring, which is how lanolin is recovered. Australian wool processing plants use water-saving methods such as taking the water from the last rinse to become the first wash of the next batch, said Mr Fergusson. Further processes — called carding and combing — smooth and refine the fibres prior to spinning into fibre and then weaving or knitting into fabrics. These fabrics may undergo fulling and crabbing, which use heated water to shrink and set the cloth. Because it comes from animals, wool has environmental impacts at the farming level, including land degradation from overgrazing, soil compaction, erosion and loss of organic matter from the soil. Deforestation and farms impinging on conservation areas are also problems identified by accreditation body Responsible Wool Standard. This doesnt mean wool cant be part of your wardrobe: the Bureau of International Recycling estimated if each person in the UK bought one reclaimed woollen garment, it would save nearly 1,700 million litres of water and 480 tonnes of dyeing chemicals.'),
            ('Linen', 'https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/5865279/910/683/m2/fpnw/wm1/aydzpf5xxyhtear6gbdnhzkhxsgzfx2yjnjrumhn5wozxe47zfi1sh9tjaymd51c-.jpg?1549899837&s=4a248267aa904eb93dfc09d6fd66bf9b', 'Cool Water Wash — Air Dry', 'Linen is made from bast fibres — fibres made from the stalk of a plant, usually flax but sometimes hemp (Cannabis sativa). Creating linen involves a process called water retting to break down the stalk into bundles of fibres, which are then mechanically refined and spun into a yarn. Its a thirsty process, but not as water-intensive as cotton processing. Growing these plants is also less intensive terms of water and pesticides than cotton. Hemp is not a big hitter in the global fashion industry, but has been pointed to as a more environmentally friendly option in the past. Dr Vuletich said that claim mostly stacked up.'),
            ('Silk', 'https://i.etsystatic.com/6042082/r/il/c1a6ad/1199843287/il_570xN.1199843287_3lr6.jpg', 'Hand Wash or Cool Warm Wash — Tumble Dry Cool or Air Dry', 'Silk is another highly renewable resource with less impacts than many fabrics.  You have to kill the silk worm when you boil the cocoon, but a single moth that hatches will lay hundreds of eggs.  They feed on mulberry leaves, which dont require pesticides or fertilizers to grow. The negatives are that silk is not a local resource and processing can lead to pollution.  Much of the silk available in the U.S. is from China and India.  Intensive cultivation practices and chemicals used for cleaning the silk can pollute groundwater.  When you add it up, it does take a large amount of resources to produce a small amount of silk--by some estimates, 35 pounds of silk from an acre of mulberry trees.'),
            ('Dyeing', 'https://www.sewmyplace.com/wp-content/uploads/2015/06/hand-dyed-fabrics-e1435427137962.jpg', 'No care', 'No, not a textile, but together with other finishing techniques, dyeing is the most energy-hungry part of the garment manufacture process, according to the Measuring Fashion report, accounting for 36 per cent of the greenhouse gas emissions of the whole process. The dyes themselves are also affecting the environment. A recent documentary tracked how chemical waste from dyeing was making its way into waterways. But the spotlight on these practices is already leading to change. Theres a zero-discharge initiative that a lot of the brands are realising that they need to really put pressure on suppliers in China around hazardous chemical waste into water, Dr Vuletich told the ABC last year. Mr Fergusson, who specialises in dyeing, said when he lived near dyehouses in Indonesia, the rivers used to change colour — but other dyehouses nearby treated their wastewater and used it to irrigate rice paddies. In Australia, dyehouses must meet very stringent discharge standards so they usually have an on-site treatment plant, Mr Fergusson said. The Australian industry is also making strides in new technologies, he said, including a method called cold pad-batch dyeing, which cuts down on energy needs by using cold water.'),
            ('Test for picture', 'http://localhost:3129/images/textiles/wool.jpg', 'No care', 'test');

INSERT INTO  products(brand_id, type_id, name, default_pic, description, closing_date, textile_id)
    VALUES 
      (2,	54,	'2020 - Polo', '/images/products/1582937542079-Levis-M-2.jpg',	'100% cotton Perfect for everyday use',	'2020-05-01',	1),
      (2,	63,	'2020 - Legendary T-Shirt',	'/images/products/1582937659237-Levis-M-1.jpeg',	'100% cotton Perfect for everyday life and active persons',	'2020-04-01',	1),
      (2,	48,	'501', '/images/products/1582937776179-Levis-P-M-1.jpg', '100% Cotton',	'2020-06-01', 1),
      (2,	53,	'2020 Spring', '/images/products/1582939261714-Levis-P-M-2.jpg', 'Casual', '2020-05-01', 3),
      (2,	90,	'2020 - Spring', '/images/products/1582939436910-Levis-W-1.jpg', 'Confi', '2020-03-01',	1),
      (2,	90,	'2020 - Summer', '/images/products/1582939547645-Levis-W-2.jpeg', 'Confi 100% cotton', '2020-04-01', 1),
      (2,	83,	'Stylish', '/images/products/1582939711780-Levis-2-W-2.jpg',	'Stylish', '2020-06-01', 3),
      (2,	79,	'2020 - Summer', '/images/products/1582939843745-Levis-P-W-2.jpg', 'Style',	'2020-03-01', 1);

INSERT INTO wishlists(willing_to_buy, user_id, product_id) 
    VALUES (true, 1, 2), (false, 2, 1), (true, 1, 2), (true, 1, 2), (true, 1, 2), (true, 1, 2), (true, 1, 2), (true, 1, 2), (true, 1, 2), (true, 1, 2), (true, 1, 2);

INSERT INTO votes (product_id, user_id)
  VALUES (1, 1), (1, 2), (2, 1), (2, 2), (2, 3), (2, 4);
