
create database GoodreadsDataBase
go
use GoodreadsDataBase
go

create table [User]
(
	UserId int identity(1,1) primary key ,
	Username varchar(100) unique not null, 
	[Password] varchar(100) not null,
	Email varchar(200) not null,
	FirstName varchar(100) not null,
	LastName varchar(100) not null
)

create table Author
(
	AuthorID int identity(1,1) primary key,
	FullName varchar(200) not null
)

create table Genre
(
	GenreID int identity(1,1) primary key,
	[Name] varchar(100) not null,
	Description varchar (max)
)

create table Book
(
	BookID int identity(1,1) primary key, 
	Title varchar(250) not null,
	AuthorID int foreign key references Author(AuthorID) on update cascade on delete cascade,
	GenreID int foreign key references Genre(GenreID) on update cascade on delete cascade,
	Description varchar(max) not null,
	ISBN varchar(100) not null,
	PublicationDate date not null,
	[Language] varchar(100) not null
)

create table Rating
(
	RatingID int identity(1,1) primary key,
	UserID int foreign key references [User](UserID) on update cascade on delete cascade,
	BookID int foreign key references Book(BookID) on update cascade on delete cascade,
	RatingValue int check(RatingValue between 1 and 5),
	RatingDate datetime default getdate()
)

create table Review
(
	ReviewID int identity(1,1) primary key,
	UserID int foreign key references [User](UserID) on update cascade on delete cascade,
	BookID int foreign key references Book(BookID) on update cascade on delete cascade,
	ReviewText varchar (max) not null,
	ReviewDate datetime default getdate(),
	SpoilerFlag bit default 0,
	LikesCount int default 0
)

create table UserBookshelf
(
	UserBookshelfID int identity(1,1) primary key,
	ShelfName varchar(200) not null,
	UserID int foreign key references [User](UserID) on update cascade on delete cascade,
	CreationDate datetime default getdate()
)

create table UserBookshelfBook
(
	UserBookshelfID int foreign key references UserBookshelf(UserBookshelfID) on update cascade on delete cascade,
	BookID int foreign key references Book(BookID) on update cascade on delete cascade,
	primary key (UserBookshelfID, BookID), 
	AddedOnDate datetime default getdate()
) 

insert into [User] (Username, Password, Email, FirstName, LastName) values
('maria_p', 'Pass123','maria.petrova1@example.com', 'Maria', 'Petrova' ),
('ivan_georgiev0', 'StrongPass1', 'ivan.geo2@example.com', 'Ivan','Georgiev'),
('kalinka_malinka', 'Sun987', 'kalina.st3@example.com','Kalina', 'Stoyanova'),
('nikolovv_', 'Test456!', 'petar.nik4@example.com','Petar', 'Nikolov'),
('kirilova_simona','Qwerty77@', 'simona.k5@example.com', 'Simona', 'Kirilova'),
('g_hristoff','Hello321#', 'georgi.h6@example.com', 'Georgi', 'Hristov'),
('krisi_ilieva', 'Pass111$', 'kristina.i7@example.com', 'Kristina', 'Ilieva'),
('niki_petkov', 'GGwp2024!', 'nikolay.p8@example.com', 'Nikolay', 'Petkov'),
('r_borisova_reading', 'Abc$1234','raya.b9@example.com', 'Raya','Borisova'),
('tihomir_m', 'GgX55!!', 'tihomir.m10@example.com', 'Tihomir', 'Marinov'),
('velkova_gabinka', '123Zz!aa', 'gabi.v11@example.com', 'Gabriela', 'Velkova'),
('slavovs_books', 'TryMe99$', 'val.sl12@example.com', 'Valentin', 'Slavov'),
('moni_bonboni', 'QwErTy!9 ', 'monika.r13@example.com', 'Monika', 'Radeva'),
('yanev_library', 'SunRise44%', 'des.y14@example.com', 'Desislav', 'Yanev'),
('darka_poparka', 'Skyblue22&', 'daria.p15@example.com', 'Daria', 'Petkova')


insert into Genre([Name], Description) values
('Romance', 'Books about love, relationships and happy endings.'),
('Fantasy', 'Books about mythical creatures, magic, hard to believe stories and adventure.'),
('Fiction', 'Books about semi-realistic situations, a lot of cgi and imagination.'),
('Thriller', 'Books about suspence, cliffhangers and plot twists'),
('Horror', 'Books about groosomeness, death, horrific scenes and murder.'),
('Contemporary fiction', 'Books about currently important events, contemporary problems and solutons.'),
('Bulgarian Literature', 'Books about the bulgarian past, now and future time, myths, legends and believes.')



insert into Author (FullName) values
('Ali Hazelwood'), ('Ana Huang'), ('Colleen Hoover'), ('Jojo Moyes'), ('J.K. Rowling'), 
('J.R.R. Tolkien'), ('Sarah J. Maas'), ('Patrick Rothfuss'), ('Brandon Sanderson'), 
('Frank Herbert'), ('Andy Weir'), ('William Gibson'), ('Ernest Cline'), ('Isaac Asimov'), 
('Paula Hawkins'), ('Gillian Flynn'), ('Alex Michaelides'), ('Dan Brown'), 
('Dennis Lehane'), ('Stephen King'), ('Shirley Jackson'), ('Josh Malerman'), ('Bram Stoker'), 
('John Green'), ('Sally Rooney'), ('Donna Tartt'), ('Gail Honeyman'), ('Matt Haig'), 
('Васил Попов'), ('Милен Русков'), ('Димитър Димов'), ('Иван Вазов'), ('Милен Русков')



insert into Book (Title, AuthorID, GenreID, Description, ISBN, PublicationDate, Language) values
('The Love Hypothesis', 1, 1, 'Докторантка по биология влиза във фалшива връзка с професор, която постепенно прераства в реално чувство.', '9780593336823', '20210914', 'English'), 
('Twisted Love', 2, 1, 'Студентка се сблъсква с обсебения, но потаен най-добър приятел на брат си, който се опитва да я защити от мрачните си тайни.', '9781728274867', '20220927', 'English'), 
('Twisted Games', 2, 1, 'Принцеса и нейният строг бодигард започват забранена любов, която застрашава кралския ред.', '978-1728274874', '20220927', 'English'),
('Twisted Hate', 2, 1, 'Двама заклети врагове се впускат в гореща връзка, която граничи с омраза и привличане.', '9781728274881', '20220927', 'English'),
('Twisted Lies', 2, 1, 'Моделка влиза в фалшива връзка с тихия, но опасен милиардер, който крие обсесивна страна.', '9781728274898', '20220927', 'English'),
('It Ends With Us', 3, 1, 'Млада жена се изправя пред труден избор между първата си любов и нова връзка, докато се бори да прекъсне цикъла на насилие.','9781501110368', '20160802', 'English'),
('Me Before You', 4, 1, 'Весела млада жена става болногледач на парализиран мъж, а връзката им променя живота и на двамата.', '9780718157838', '20120105', 'English'),
('Harry Potter and the Philosopher,s Stone', 5, 2, 'Момче открива, че е магьосник,и започва обучение в Хогуортс, където го очакват мистерии и опасности.', '9780747591061', '19970626', 'English'), 
('Harry Potter and the Chamber of Secrets', 5, 2, 'Хари се връща в Хогуортс и се сблъсква с древно зло, освободено в тайна камера.', '0747538484', '19980702', 'English'),
('The Hobbit', 6, 2, 'Хобитът Билбо Бегинс се присъединява към група джуджета в пътешествие за възвръщане на откраднато съкровище.', '9780345272577', '19771012', 'English'), 
('A Court of Thorns and Roses', 7, 2, 'Млада жена е отвлечена в приказен свят, след като убива фея, и открива мрака и страстта на феерийните дворове.', '9781619634442', '20150505', 'English'), 
('The Name of the Wind', 8, 2, 'Гений-музикант и маг описва живота си — от бедно детство до славата като най-опасния магьосник.', '9780756404079', '20070327', 'English'), 
('Mistborn', 9, 2, 'Група бунтовници се опитва да свали безсмъртен тиранин, използвайки магия, базирана на метали.', '076531178X', '20060717', 'English'),
('Dune', 10, 3, 'Наследник на могъща фамилия се впуска в политически и мистични конфликти около пустинната планета Аракис и нейния ценен ресурс', '0801950775', '19651001', 'English'), 
('The Martian', 11, 3, 'Астронавт остава сам на Марс и трябва да използва науката и изобретателност, за да оцелее.', '9780553418026', '20141028', 'English'),
('Project Hail Mary', 11, 3, 'Учител по природни науки се събужда сам на космически кораб със задача да спаси човечеството от гибел.', '9780593135204', '20210504', 'English'), 
('Neuromancer', 12, 3, 'Хакер е въвлечен в опасно задание в киберсвят, който поставя основите на киберпънк жанра.', '0441569560', '19840610', 'English'),
('Ready Player One', 13, 3, 'Момче се състезава в виртуална реалност за контрол над огромна дигитална империя.', '9780307887436', '20110816', 'English'), 
('Foundation', 14, 3, 'Математик предвижда падането of империя и създава план за спасяване на човешкото знание през хилядолетията.', '0345336275', '19510101', 'English'), 
('The Girl on the Train', 15, 4, 'Жена става свидетел на нещо подозрително от прозореца на влака и се заплита в опасна мистерия.', '9781594633669', '20150113', 'English'), 
('Gone Girl', 16, 4, 'Изчезването на една жена разкрива токсична връзка, лъжи и сензационна манипулация.', '9780307588364', '20120605', 'English'),
('The Silent Patient', 17, 4, 'Заможна художничка мълчи след убийството на съпруга си, а терапевт се опитва да разкрие истината.', '9781250301697', '20190205', 'English'), 
('The Da Vinci Code', 18, 4, 'Професор се оказва въвлечен в заговор, свързан с тайни общества, шифри и религиозни мистерии.', '0385504209', '20030401', 'English'), 
('Shutter Island', 19, 4, 'Двама федерални агенти разследват изчезване в болница за психично болни, но нищо не е това, което изглежда.', '9780688163174', '20030401', 'English'), 
('It', 20, 5, 'Група деца се изправя срещу древно зло, което приема формата на страховете им.', '9780670813028', '19860915', 'English'), 
('The Shining', 20, 5, 'Едно семейство остава изолирано в хотел, където бащата постепенно полудява под влияние на свръхестествени сили.', '9780385121675', '19770128', 'English'), 
('The Haunting of Hill House', 21, 5, 'Група хора живеят в обсебена къща, която ги подлудява постепенно.', '9780143122357', '20131001', 'English'),
('Bird Box', 22, 5, 'Майка и децата ѝ трябва да пътуват със завързани очи,за да избегнат мистериозни същества, които водят до самоубийство.', '9780062259660', '20140327', 'English'), 
('Dracula', 23, 5, 'Вампирски граф пътува към Англия, а група хора се опитват да го спрат.', '9780486411095', '18970601', 'English'), 
('The Fault in Our Stars', 24, 6, 'Двама болни тийнейджъри се влюбват, докато се борят с тежката си диагноза и смисъла на живота.', '9780525426000', '20120110', 'English'), 
('Normal People', 25, 6, 'Двама млади хора се влюбват и разделят многократно, изследвайки сложността на връзките и идентичността.', '9780571334643', '20190501', 'English'), 
('The Goldfinch', 26, 6, 'Момче губи майка си при атентат и животът му тръгва по тъмен път, свързан с открадната картина.', '9780316055420', '20160628', 'English'),
('Eleanor Oliphant Is Completely Fine', 27, 6, 'Социално изолирана жена се учи да общува и лекува травмите си благодарение на ново приятелство.', '9780008172145', '20180118', 'English'), 
('The Midnight Library', 28, 6, 'Жена попада в магическа библиотека, където може да изживее всички алтернативни варианти на живота си.', '9780525559481', '20200813', 'English'), 
('Мамник', 29, 7, 'Мрачен трилър, вдъхновен от български фолклор, разказващ за свръхестествена сила в малко село.', ' 9786197313581', '20220101', 'Bulgarian'), 
('Възвишение', 30, 7, 'История за българското Възраждане, разказана с хумор и архаичен език през погледа на двама четници.', '9789544917203', '20110101', 'Bulgarian'), 
('Тютюн', 31, 7, 'Сага за любов, алчност и власт на фона на капиталистическата тютюнева индустрия.', '9789542804239', '19510101', 'Bulgarian'), 
('Под игото', 32, 7, 'Епичен роман за живота на българите преди Освобождението и борбата им срещу османската власт.', '9786191516636', '18940101', 'Bulgarian'), 
('Чамкория', 33, 7, 'Шофьор на автобус през 20-те години разказва за социални напрежения, политика и лична съдба с уникален език и хумор.', '9786191863792', '19700101', 'Bulgariаn')



insert into Review(UserID, BookID, ReviewText, ReviewDate, SpoilerFlag, LikesCount) values
(1, 3, 'Loved the chemistry between characters and the development was amazing!', '2025-11-23', 0, 100),
(1, 1, 'A fun and light read, very enjoyable.', '2025-11-22', 0, 25),
(1, 2, 'Interesting plot twists, kept me engaged till the end.', '2025-11-21', 0, 26),

(2, 6, 'A heartfelt story that I could not put down.', '2025-11-20', 0, 45),
(2, 10, 'Epic adventure, Tolkien at his best.', '2025-11-19', 0, 50),
(2, 11, 'Intriguing and clever sci-fi story, very original.', '2025-11-18', 1, 1),

(3, 7, 'Such an emotional story, highly recommend!', '2025-11-23', 1, 14),
(3, 3, 'A must-read romance, very captivating.', '2025-11-22', 0, 56),
(3, 9, 'Fantasy world is detailed and immersive.', '2025-11-21', 1, 22),

(4, 20, 'Stephen King delivers pure suspense, chilling!', '2025-11-20', 1, 80),
(4, 12, 'Intense thriller with unexpected twists.', '2025-11-19', 0, 136),
(4, 4, 'Horror elements were terrifying yet thrilling.', '2025-11-18', 1, 57),

(5, 5, 'Beautifully written and emotionally moving.', '2025-11-23', 1, 37),
(5, 1, 'Romantic and fun, really liked it.', '2025-11-22', 0, 70),
(5, 6, 'Highly recommended for contemporary fiction lovers.', '2025-11-21', 1, 8),

(6, 15, 'Gripping mystery, couldn’t stop reading.', '2025-11-20', 0, 29),
(6, 16, 'Thrilling story with suspense at every turn.', '2025-11-19', 1, 40),
(6, 17, 'Unique plot and well-written characters.', '2025-11-18', 0, 48),

(7, 29, 'A chilling thriller with local folklore flavor, loved it.', '2025-11-23', 1, 90),
(7, 33, 'A very compelling read, unique Bulgarian story.', '2025-11-22', 0, 87),
(7, 30, 'Historical and immersive, highly recommend.', '2025-11-21', 0, 27),

(8, 32, 'Classic Bulgarian literature, beautifully written.', '2025-11-20', 0, 76),
(8, 31, 'Epic tale, very captivating.', '2025-11-19', 0, 46),
(8, 14, 'Well-structured and insightful, really enjoyed it.', '2025-11-18', 0 ,49),

(9, 9, 'Magical and nostalgic, loved it!', '2025-11-23', 1, 12),
(9, 10, 'Exciting adventure, could not put it down.', '2025-11-22', 1, 30),
(9, 6, 'A timeless story, highly recommended.', '2025-11-21', 0, 78),

(10, 10, 'Thrilling and exciting, perfect for a weekend read.', '2025-11-20', 1, 45),
(10, 6, 'A classic tale of fantasy and heroism.', '2025-11-19', 0, 49),
(10, 11, 'Smart and entertaining sci-fi, really enjoyed.', '2025-11-18', 1, 22),

(11, 20, 'Classic horror, tense and frightening.', '2025-11-23', 1, 11),
(11, 22, 'Unique concept, kept me on edge.', '2025-11-22', 0, 66),
(11, 23, 'Classic Dracula story, a must-read.', '2025-11-21', 1, 41),

(12, 4, 'Really scary, perfect for horror fans.', '2025-11-20', 0, 77),
(12, 21, 'Gripping story, enjoyed every chapter.', '2025-11-19', 0, 97),
(12, 12, 'Great suspense and storytelling.', '2025-11-18', 1, 36),

(13, 37, 'Fantasy masterpiece, detailed world-building.', '2025-11-23', 0, 44),
(13, 35, 'Enjoyed every page, engaging story.', '2025-11-22', 1, 49),
(13, 36, 'Captivating tale, worth reading.', '2025-11-21', 1, 38),

(14, 14, 'Historical and literary, very well-written.', '2025-11-20', 0, 44),
(14, 15, 'Epic narrative, highly recommend.', '2025-11-19', 0, 24),
(14, 33, 'Interesting cultural perspective, enjoyable.', '2025-11-18', 1, 51),

(15, 10, 'Classic sci-fi, a must for Dune fans.', '2025-11-23', 1, 32),
(15, 15, 'Foundation series is timeless.', '2025-11-22', 0, 55),
(15, 16, 'Bulgarian classic, very engaging.', '2025-11-21', 1, 78),

(6, 32, 'Powerful story, immersive.', '2025-11-20', 0, 46),
(6, 36, 'Enjoyable read, well-written.', '2025-11-19', 0, 33),
(6, 31, 'Epic historical tale, compelling.', '2025-11-18', 0, 70),

(7, 17, 'Fun romantic story, very entertaining.', '2025-11-23', 1, 62),
(7, 18, 'Enjoyed the twists and romance.', '2025-11-22', 1, 63),
(7, 19, 'Interesting characters and plot.', '2025-11-21', 0, 78),

(8, 1, 'Romantic and engaging, loved it.', '2025-11-20', 0, 64),
(8, 2, 'Exciting love story, highly recommend.', '2025-11-19', 0, 22),
(8, 3, 'Captivating plot, very entertaining.', '2025-11-18', 1, 33),

(9, 27, 'Touching story, very emotional.', '2025-11-23', 0, 18),
(9, 26, 'Beautifully written, highly recommend.', '2025-11-22', 1, 7),
(9, 23, 'Classic Dracula tale, really enjoyed.', '2025-11-21', 1, 0),

(15, 20, 'Tense and suspenseful, great writing.', '2025-11-20', 1, 10),
(15, 18, 'Fast-paced thriller, couldn’t put it down.', '2025-11-19', 0, 3),
(15, 21, 'Excellent horror story, very gripping.', '2025-11-18', 0, 11),

(11, 26, 'Poignant and emotional story, loved it.', '2025-11-23', 0, 22),
(11, 28, 'Creative and thought-provoking.', '2025-11-22', 0, 44),
(11, 27, 'Beautiful story about overcoming trauma.', '2025-11-21', 1, 14),

(12, 1, 'Fun and romantic, really enjoyable.', '2025-11-20', 1, 0),
(12, 2, 'Romantic twists, loved it.', '2025-11-19', 1, 5),
(12, 3, 'Exciting plot, highly recommend.', '2025-11-18', 0, 9),

(13, 6, 'Classic adventure, enjoyable.', '2025-11-23', 0, 22),
(13, 9, 'Interesting fantasy, well-written.', '2025-11-22', 0, 7),
(13, 11, 'Unique sci-fi world, very entertaining.', '2025-11-21', 1, 44),

(4, 22, 'Thrilling and suspenseful, kept me hooked.', '2025-11-20', 0, 60),
(4, 4, 'Intense horror story, very gripping.', '2025-11-19', 1, 8),
(4, 20, 'Classic horror, must read.', '2025-11-18', 1, 3),

(5, 29, 'Engaging Bulgarian story, loved it.', '2025-11-23', 1, 9),
(5, 32, 'Powerful and immersive tale.', '2025-11-22', 0, 10),
(5, 31, 'Classic and dramatic story, excellent.', '2025-11-21', 0, 11),

(6, 7, 'Fantasy world is magical and captivating.', '2025-11-20', 0, 88),

(7, 16, 'Thriller kept me on edge, excellent.', '2025-11-19', 0, 36),
(7, 23, 'Classic horror, well-written.', '2025-11-18', 0, 78),
(7, 21, 'Emotional and touching story.', '2025-11-17', 1, 43),

(8, 1, 'Magical story, nostalgic and fun.', '2025-11-23', 0, 8),
(8, 6, 'Epic adventure, enjoyable.', '2025-11-22', 1, 11),
(8, 15, 'Fantasy romance, very entertaining.', '2025-11-21', 1, 17),

(9, 24, 'Heartwarming story, truly enjoyed.', '2025-11-20', 1, 77),

(10, 7, 'Suspenseful and thrilling, loved it.', '2025-11-19', 1, 39),
(10, 17, 'Romance with unexpected twists.', '2025-11-18', 0, 84),

(11, 29, 'Chilling thriller, very captivating.', '2025-11-23', 0, 8),
(11, 30, 'Historical narrative, engaging.', '2025-11-22', 0, 3),
(11, 31, 'Epic Bulgarian story, highly recommended.', '2025-11-21', 1, 5),

(2, 32, 'Classic tale, very enjoyable.', '2025-11-20', 0, 15),
(2, 33, 'Unique perspective, great story.', '2025-11-19', 1, 34),

(13, 1, 'Romantic and fun, loved it.', '2025-11-23', 1, 4),
(13, 3, 'Engaging romance story, highly recommend.', '2025-11-22', 0, 55),
(13, 6, 'Powerful contemporary fiction story.', '2025-11-21', 1, 7),

(14, 2, 'Thrilling romance, very exciting.', '2025-11-20', 0, 6),
(14, 10, 'Epic fantasy adventure, highly recommend.', '2025-11-19', 1, 6),
(14, 24, 'Emotional contemporary story, enjoyed.', '2025-11-18', 1, 71),

(15, 9, 'Magical and adventurous, loved it.', '2025-11-23', 1, 9),
(15, 10, 'Classic fantasy, very enjoyable.', '2025-11-22', 1, 36),
(15, 11, 'Sci-fi adventure, highly recommended.', '2025-11-21', 0, 8),

(6, 6, 'Epic adventure, engaging.', '2025-11-20', 0, 7),

(7, 8, 'Well-written, great story.', '2025-11-19', 1, 1),

(8, 13, 'Exciting virtual world, loved it.', '2025-11-18', 1, 4),

(9, 7, 'Magical and captivating fantasy.', '2025-11-23', 0, 6),
(9, 3, 'Emotional and gripping romance.', '2025-11-22', 1, 3),
(9, 5, 'Powerful contemporary romance, very good.', '2025-11-21', 0, 5),

(10, 9, 'Magical adventure, loved it.', '2025-11-20', 1, 77),
(10, 10, 'Classic Tolkien adventure.', '2025-11-19', 1, 32),
(10, 11, 'Sci-fi classic, highly entertaining.', '2025-11-18', 1, 23),

(1, 7, 'Fantasy romance, magical.', '2025-11-23', 1, 37),

(2, 4, 'Horror masterpiece, thrilling.', '2025-11-22', 1, 36),
(2, 20, 'Classic horror, very gripping.', '2025-11-21', 0, 23),
(2, 22, 'Suspenseful thriller, excellent.', '2025-11-20', 0, 46),

(13, 29, 'Engaging Bulgarian thriller, loved it.', '2025-11-19', 0, 33),
(13, 32, 'Classic Bulgarian tale, very good.', '2025-11-18', 1, 4),
(13, 31, 'Epic story, highly recommend.', '2025-11-17', 1, 67)



insert into Rating (UserID, BookID, RatingValue, RatingDate) values

(1, 1, 5, '2023-01-05'),
(1, 3, 4, '2023-01-06'),
(1, 2, 3, '2023-01-07'),

(2, 4, 5, '2023-01-08'),
(2, 5, 5, '2023-01-09'),
(2, 2, 2, '2023-01-10'),

(3, 7, 5, '2023-01-11'),
(3, 8, 4, '2023-01-12'),
(3, 9, 5, '2023-01-13'),

(4, 10, 4, '2023-01-14'),
(4, 12, 2, '2023-01-15'),
(4, 11, 3, '2023-01-16'),

(5, 6, 5, '2023-01-17'),
(5, 5, 5, '2023-01-18'),
(5, 1, 2, '2023-01-19'),

(6, 15, 4, '2023-01-20'),
(6, 16, 5, '2023-01-21'),
(6, 14, 3, '2023-01-22'),

(7, 29, 5, '2023-01-23'),
(7, 31, 4, '2023-01-24'),
(7, 30, 5, '2023-01-25'),

(8, 32, 4, '2023-01-26'),
(8, 33, 2, '2023-01-27'),
(8, 34, 3, '2023-01-28'),

(9, 9, 5, '2023-01-29'),
(9, 10, 4, '2023-01-30'),
(9, 11, 3, '2023-01-31'),

(10, 1, 5, '2023-02-01'),
(10, 10, 4, '2023-02-02'),
(10, 12, 3, '2023-02-03'),

(11, 20, 5, '2023-02-04'),
(11, 21, 4, '2023-02-05'),
(11, 23, 3, '2023-02-06'),

(12, 24, 5, '2023-02-07'),
(12, 25, 4, '2023-02-08'),
(12, 26, 3, '2023-02-09'),

(13, 27, 5, '2023-02-10'),
(13, 28, 4, '2023-02-11'),
(13, 29, 3, '2023-02-12'),

(14, 30, 5, '2023-02-13'),
(14, 31, 4, '2023-02-14'),
(14, 32, 3, '2023-02-15'),

(15, 33, 5, '2023-02-16'),
(15, 34, 4, '2023-02-17'),
(15, 35, 3, '2023-02-18'),

(1, 36, 4, '2023-02-19'),
(2, 37, 5, '2023-02-20'),
(3, 38, 4, '2023-02-21'),
(4, 39, 5, '2023-02-22'),
(5, 15, 4, '2023-02-23'),
(6, 16, 5, '2023-02-24'),
(7, 17, 3, '2023-02-25'),
(8, 18, 2, '2023-02-26'),
(9, 19, 5, '2023-02-27'),
(10, 20, 4, '2023-02-28'),
(11, 21, 5, '2023-03-01'),
(12, 22, 4, '2023-03-02'),
(13, 23, 3, '2023-03-03'),
(14, 24, 5, '2023-03-04'),
(15, 25, 4, '2023-03-05')


 

insert into UserBookshelf (UserID, ShelfName, CreationDate) values
(1, 'Want to Read', '2024-01-05'),
(1, 'Currently Reading', '2024-01-10'),
(1, 'Read', '2024-01-15'),

(2, 'Want to Read', '2024-02-01'),
(2, 'Favorites', '2024-02-05'),
(2, 'Read', '2024-02-10'),

(3, 'Read', '2024-03-01'),
(3, 'Classics', '2024-03-05'),
(3, 'Fantasy', '2024-03-10'),

(4, 'Want to Read', '2024-04-01'),
(4, 'Horror', '2024-04-05'),
(4, 'Read', '2024-04-10'),

(5, 'Favourites', '2024-05-01'),
(5, 'Done', '2024-05-04'),
(5, 'Didn''t like', '2024-05-07'),
(5, 'Next to read', '2024-05-10'),

(6, 'Want to read', '2024-06-01'),
(6, 'Finished', '2024-06-05'),

(7, 'Currently reading', '2024-07-01'),
(7, 'Finished', '2024-07-04'),
(7, 'Want to read', '2024-07-07'),

(8, 'Loverboy', '2024-08-01'),
(8, 'Fantasy', '2024-08-05'),

(9, 'Never again', '2024-09-01'),
(9, 'Best of them all', '2024-09-04'),
(9, 'Books with maps', '2024-09-07'),

(10, 'Thriller', '2024-10-01'),
(10, 'Books with movies/series', '2024-10-05'),
(10, 'Waiting', '2024-10-10'),

(11, 'Mystery', '2024-11-01'),
(11, 'Want to own', '2024-11-04'),
(11, 'Owning', '2024-11-07'),
(11, 'From the library', '2024-11-10'),

(12, 'Booktok', '2024-12-01'),
(12, 'Bed time', '2024-12-04'),
(12, 'Want to read', '2024-12-07'),

(13, 'Read', '2024-12-15'),

(14, 'Currently reading', '2025-01-01'),
(14, 'Once upon a time', '2025-01-04'),
(14, 'Finished', '2025-01-07'),

(15, 'Romantasy', '2025-02-01'),
(15, 'Death', '2025-02-04'),
(15, 'Bulgarian books', '2025-02-07')

insert into UserBookshelfBook (UserBookshelfID, BookID, AddedOnDate) values
(1, 2, '2024-01-01'), (1, 8, '2024-01-02'), (1, 1, '2024-01-03'),
(2, 10, '2024-01-04'), (2, 13, '2024-01-05'),
(3, 7, '2024-01-06'), (3, 14, '2024-01-07'), (3, 35, '2024-01-08'),
(4, 25, '2024-01-09'), (4, 35, '2024-01-10'),
(5, 7, '2024-01-11'), (5, 6, '2024-01-12'), (5, 1, '2024-01-13'),
(6, 20, '2024-01-14'), (6, 21, '2024-01-15'), (6, 22, '2024-01-16'),
(6, 23, '2024-01-17'), (6, 24, '2024-01-18'),
(7, 35, '2024-01-19'), (7, 39, '2024-01-20'),
(8, 37, '2024-01-21'), (8, 38, '2024-01-22'),
(9, 8, '2024-01-23'), (9, 9, '2024-01-24'), (9, 10, '2024-01-25'), (9, 12, '2024-01-26'),
(10, 2, '2024-01-27'), (10, 10, '2024-01-28'), (10, 13, '2024-01-29'),
(11, 26, '2024-01-30'), (11, 28, '2024-01-31'), (11, 29, '2024-02-01'),
(12, 25, '2024-02-02'), (12, 27, '2024-02-03'),
(13, 35, '2024-02-04'),
(14, 36, '2024-02-05'), (14, 37, '2024-02-06'), (14, 39, '2024-02-07'),
(15, 14, '2024-02-08'), (15, 19, '2024-02-09'),
(16, 38, '2024-02-10'),
(17, 5, '2024-02-11'),
(18, 2, '2024-02-12'), (18, 3, '2024-02-13'), (18, 4, '2024-02-14'),
(19, 33, '2024-02-15'), (19, 31, '2024-02-16'), (19, 29, '2024-02-17'),
(20, 26, '2024-02-18'), (20, 22, '2024-02-19'), (20, 24, '2024-02-20'),
(21, 32, '2024-02-21'), (21, 34, '2024-02-22'),
(22, 2, '2024-02-23'), (22, 3, '2024-02-24'), (22, 4, '2024-02-25'),
(22, 5, '2024-02-26'), (22, 6, '2024-02-27'),
(23, 28, '2024-02-28'), (23, 13, '2024-02-29'),
(24, 28, '2024-03-01'), (24, 25, '2024-03-02'), (24, 26, '2024-03-03'),
(25, 35, '2024-03-04'), (25, 38, '2024-03-05'),
(26, 11, '2024-03-06'),
(27, 21, '2024-03-07'), (27, 29, '2024-03-08'), (27, 27, '2024-03-09'),
(28, 8, '2024-03-10'), (28, 10, '2024-03-11'), (28, 14, '2024-03-12'), (28, 18, '2024-03-13'),
(29, 30, '2024-03-14'),
(30, 20, '2024-03-15'), (30, 22, '2024-03-16'),
(31, 35, '2024-03-17'), (31, 36, '2024-03-18'), (31, 37, '2024-03-19'),
(32, 38, '2024-03-20'), (32, 39, '2024-03-21'),
(33, 6, '2024-03-22'), (33, 7, '2024-03-23'), (33, 1, '2024-03-24'),
(34, 2, '2024-03-25'), (34, 14, '2024-03-26'), (34, 30, '2024-03-27'),
(35, 8, '2024-03-28'), (35, 9, '2024-03-29'),
(36, 10, '2024-03-30'),
(37, 12, '2024-03-31'),
(38, 18, '2024-04-01'),
(39, 11, '2024-04-02'), (39, 7, '2024-04-03'), (39, 6, '2024-04-04'), (39, 1, '2024-04-05'),
(40, 8, '2024-04-06'), (40, 9, '2024-04-07'), (40, 10, '2024-04-08'),
(41, 11, '2024-04-09'),
(42, 25, '2024-04-10'), (42, 26, '2024-04-11'), (42, 28, '2024-04-12'),
(43, 35, '2024-04-13'), (43, 38, '2024-04-14'), (43, 37, '2024-04-15')




--функция за изчисляване броя на книгите в даден рафт
go
create function dbo.GetBookCountInShelf
(
    @UserBookshelfID int
)
returns int
as
begin
    declare @Count int

    select @Count = count(*)
    from UserBookshelfBook
    where UserBookshelfID = @UserBookshelfID

    return @Count
end
go

--select dbo.GetBookCountInShelf(10);


--функция за общ брой книги на даден потребител
go
create function dbo.GetUserBookCount
(
    @UserId int
)
returns int
as
begin
    declare @BookCount int;

    select @BookCount = count(*)
    from UserBookshelfBook ub
    inner join UserBookshelf us on ub.UserBookshelfID = us.UserBookshelfID
    where us.UserID = @UserId

    return @BookCount;
end
go

--SELECT dbo.GetUserBookCount(4)


--процедура за добавяне на книга към рафт 
go
create procedure AddBookToShelf
    @UserBookshelfID int,
    @BookID int
as
begin
    set nocount on;

    if not exists(
        select 1 
        from UserBookshelfBook
        where UserBookshelfID = @UserBookshelfID and BookID = @BookID
    )
    begin
        insert into UserBookshelfBook(UserBookshelfID, BookID)
        values (@UserBookshelfID, @BookID)

        print 'Book added successfully.'
    end
    else
    begin
        print 'Book is already in this bookshelf.'
    end
end
go
--EXEC AddBookToShelf 10, 29


--процедура за добавяне на рейтинг 
go
create procedure AddRating
    @UserID int,
    @BookID int,
    @Rating int
as
begin
    set nocount on;

    if exists (
        select 1 
        from Rating
        where UserID = @UserID and BookID = @BookID
    )
    begin
        raiserror('Потребителят вече е поставил рейтинг за тази книга.', 16, 1)
        return
    end

    insert into Rating(UserID, BookID, RatingValue)
    values (@UserID, @BookID, @Rating);
end
go
--EXEC AddRating 8, 29, 4



--тригер за превенция на дублиране книги на рафт (ако вече я има, да не може да се добави)
go
create trigger trg_PreventDuplicateBooks
on UserBookshelfBook
instead of insert
as
begin
    insert into UserBookshelfBook(UserBookshelfID, BookID)
    select i.UserBookshelfID, i.BookID
    from inserted i
    where not exists (
        select 1 
        from UserBookshelfBook u
        where u.UserBookshelfID = i.UserBookshelfID
        and u.BookID = i.BookID
    )
end
go


--тригер за превенция на дублирано ревю (един потребител може да пише само по едно ревю на книга)
go
create trigger TRG_PreventDuplicateReview
on Review
after insert
as
begin
    set nocount on;

    if exists (
        select 1
        from Review r
        inner join inserted i on r.UserID = i.UserID and r.BookID = i.BookID
        where r.ReviewID <> i.ReviewID
    )
    begin
        raiserror('Потребителят вече е поставил ревю за тази книга и не може да добави второ.', 16, 1)
        rollback transaction
        return
    end
end
go

