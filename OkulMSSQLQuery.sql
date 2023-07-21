use OkulMSSQL;	

-- Tablo içindeki sadece belli alanlara ilişkin verileri listelemek için - Veri tanımlama
Select Adi, Soyadi, Bolumu from Ogrenci; 

-- Verileri listelerken belli bir alandaki verilere göre sıralamak için
-- ASC -> küçükten büyüğe sıralar (default)   |    DESC -> büyükten küçüğe sıralar
Select * from Ogrenci order by Kayit_Tarihi DESC;
Select Yas from Ogrenci order by Yas ASC;

-- Tablodaki belli bir alanın bir koşula uymasına göre verileri listelemek için
Select * from Ogrenci where Yas>20;
Select Adi, Soyadi, Kayit_Tarihi from Ogrenci where Adi='Kadir';
Select Ogrenci_No, Adi, Soyadi from Ogrenci where Bolumu='MAT';

-- Tablodaki verileri birden fazla koşula göre listelemek için
Select * from Ogrenci where Yas>20 and Yas<25;
Select * from Ogrenci where Yas>20 and Bolumu='KIM';
Select Ogrenci_No, Ortalama from Ogrenci where Adi='Kemal' and Soyadi='Seçer';

-- Tablodaki verileri iki koşuldan birini sağlama durumuna göre listelemek için
Select * from Ogrenci where Adi='Kadir' or Soyadi='Seçer';
Select * from Ogrenci where Yas=20 or Yas=27;
Select * from Ogrenci where (Yas=20 or Yas=27) and Adi LIKE 'K%';

-- SQL dilinde bir tablodan kayıtları çekerken ismi A ile başlayan soyadı B ile biten tarzında sorgular yapabilmek için LIKE komutu kullanılır.*/
Select * from Ogrenci where Soyadi like 'S%';	-- S ile başlayanlar
Select Adi from Ogrenci where Adi like '%r';	-- r ile bitenler

-- SQL dilinde bir tablodan tekrarlayan kayıtları yalnız bir sefer çekmek için DISTINCT komutu kullanılır.
Select DISTINCT Adi from Ogrenci;
Select DISTINCT Yas from Ogrenci;

-- SQL dilinde bir tablodaki kayıtların toplam sayısını belirlemek için COUNT komutu kullanılır.
Select COUNT(Adi) as Ad_Sayısı from Ogrenci;
Select COUNT(Adi) as 'Ad_Sayısı', COUNT(Ortalama) as 'Ortalama_Sayısı' from Ogrenci;

-- SQL dilinde bir tablodaki kayıtlardan belli aralıktakileri seçmek için BETWEEN komutu kullanılır.
Select Yas, Kayit_Tarihi from Ogrenci where Yas BETWEEN 20 and 25;		-- 20 <= Yas <= 25
Select Ortalama from Ogrenci where Ortalama BETWEEN 60 and 80;			-- 60 <= Ortalama <= 80

-- SQL dilinde alanlardaki verileri toplamak için SUM komutu kullanılır.
Select SUM(Kredisi) 'Toplam Kredi' from Ders;
Select SUM(Ortalama) as 'Ortalama Toplamı' from Ogrenci;
Select (SUM(Ortalama) / COUNT(Ortalama)) as 'Ortalama Ortalaması' from Ogrenci;
Select (Final_Notu * 0.60) + (Vize_Notu * 0.40) from OgrenciDers;

-- SQL dilinde belli bir alandaki verilerin ortalamasını bulmak için AVG komutu kullanılır.
Select AVG(Ortalama) as 'Ortalama Ortalaması' from Ogrenci;
Select AVG(Yas) from Ogrenci;
Select AVG(Kredisi) from Ders;

-- SQL dilinde sayıları yuvarlamakamacıyla ROUND komutu kullanılır.
Select ROUND(38,5);

-- SQL dilinde en yüksek değeri bulmak için MAX komutu kullanılır.
Select MAX(Kayit_Tarihi) Son_Kayıt_Olan from Ogrenci;
Select MAX(Ortalama) from Ogrenci;

-- SQL dilinde en düşük değeri bulmak için MİN komutu kullanılır.
Select MIN(Kayit_Tarihi) İlk_Kayıt_Olan from Ogrenci;			-- MM/DD/YYYY
Select MIN(Ortalama) from Ogrenci;

-- SQL dilinde iki değer arasındaki farkı bulmak için	(x - y)
Select Final_Notu - Vize_Notu from OgrenciDers;

-- SQL dilinde iki değeri birleştirmek için	(x + y)
Select Adi + Soyadi as 'Öğrenci Adı ve Soyadı' from Ogrenci;

-- Şuan bulunduğumuz tarihi görebilmek için
Select GETDATE() [Bugünün Tarihi];		-- YYYY/MM/DD

-- Girilen tarihdeki yıl bilgisini getirmek için
Select YEAR(GETDATE()) [Yıl];
Select YEAR(Kayit_Tarihi) from Ogrenci;

-- Girilen tarihdeki ay bilgisini getirmek için
Select MONTH(GETDATE()) [Ay];
Select MONTH(Kayit_Tarihi) from Ogrenci;

-- Girilen tarihdeki gün bilgisini getirmek için
Select DAY(GETDATE()) [Gün];
Select DAY(Kayit_Tarihi) from Ogrenci;

-- Belirtilen tarihi istenilen parametreleri girerek ileri veya geri sayabiliriz.
Select DATEADD(DAY, 2, GETDATE());	-- Bugünün tarihine 2 gün ekleme
Select DATEADD(MONTH, 2, GETDATE());	-- Bugünün tarihine 2 ay ekleme
Select DATEADD(YEAR, 2, GETDATE());	-- Bugünün tarihine 2 yıl ekleme

-- İki tarih arasındaki farkı bulmak için
Select DATEDIFF(YEAR, Kayit_Tarihi, GETDATE()) from Ogrenci;	-- Kaç yıl fark var?
Select DATEDIFF(DAY, Kayit_Tarihi, GETDATE()) from Ogrenci;	-- Kaç gün fark var?
Select DATEDIFF(YEAR, '1453-05-29', GETDATE()) as "İstanbul'un Fethi Kaç Yıl Önce";	-- YYYY-MM-DD

-- Girilen tarihin doğru olup olmadığı kontrol edilebilir. 
-- Geçerli bir tarih ise 1 değilse 0 bilgisi geri dönecektir.
Select ISDATE('07.32.2023');	-- 0
Select ISDATE('02.29.2023');	-- 0
Select ISDATE('07.21.2023');	-- 1

-- Verilen sayının 'mutlak değerini' (sayının pozitif halini) geriye döndürmek için
Select ABS(-7);		-- |-7| = 7
Select ABS(-89.6);	-- |-89.6| = 89.6

-- Verilen 'ondalık sayıyı' en yakın 'üst tam sayıya' yuvarlamak için
Select CEILING(2.01);	-- Tavan
Select CEILING(2.50);
Select CEILING(2.78);

-- Verilen 'ondalık sayıyı' en yakın 'alt tam sayıya' yuvarlamak için
Select FLOOR(2.01);		-- Zemin
Select FLOOR(2.50);
Select FLOOR(2.78);

-- Matematikteki pi (π) sayısı için
Select PI() as Pi_Sayısı;

-- Verilen sayının verilen değerde 'üssünü' almak için 
Select POWER(3, 4);		-- 3 ^ 4 = 81

-- 0 - 1 aralığında rastgele sayı üretmek için
Select RAND();

-- Veriye ait 'işaret bilgisi' geriye döndürülebilir.
-- Değer negatifse -1, pozitifse 1, sıfırsa 0 değeri dönecektir.
Select SIGN(-100);	-- -1
Select SIGN(100);	--  1
Select SIGN(0);		--  0

-- Verilen sayının 'karekökünü' almak için
Select SQRT(25);	-- 5
Select SQRT(1);		-- 1

-- Verilen sayının 'karesini' almak için
Select SQUARE(17);	--289
Select SQUARE(5);	-- 25

-- Verilen değerin sayısal olup olmadığı bilgisini elde etmek için kullanılır. 
-- Sayısal ise geri 1, sayısal değilse geri 0 değerini döner.
Select ISNUMERIC('20');		-- 1
Select ISNUMERIC('20A');	-- 0

-- Verilen bir karakterin 'ASCII' tablosundaki değerini bulmak için
Select ASCII('A');	-- 65
Select ASCII('a');	-- 97

-- 0 - 255 arası girilen tam sayının 'ASCII' tablosundaki karşılığı olan karakteri bulabiliriz.
-- Girilen değer bu aralık dışında ise NULL değeri döner.
Select CHAR(98);	-- b
Select CHAR(256);	-- NULL

-- Verilen bir metnin soldan itibaren istenilen sayıda karakterini geri döndürebilmek için
Select LEFT('Klavye ve Fare', 6);	-- Klavye

-- Verilen bir metnin sağdan itibaren istenilen sayıda karakterini geri döndürebilmek için
Select RIGHT('Mustafa Kemal Atatürk', 7);	-- Atatürk

-- Bir metinin karakter uzunluğunu bulmak için
Select LEN('Atakan Turgut');	-- Boşluk dahil 13 !

-- Verilen bir metnin 'tümünü küçük harf' yapmak için
Select LOWER('ATAKAN TURGUT');

-- Verilen bir metnin 'tümünü büyük harf' yapmak için
Select UPPER('atakan turgut');

-- Verilen bir metni ters çevirmek için
Select REVERSE('atakan turgut');	-- tugrut nakata

-- -------------------------------------------------------------------------

-- INSERT: SQL'de veri tabanına kayıt eklemek için INSERT INTO deyimiyle kullanılır.
Insert into Ogrenci values (16, 'Atakan', 'Turgut', 'BMH', '2020-05-01', 22, 80);
Insert into Telefon values ('Atakan', 'Turgut', '0543 000 0000');

-- UPDATE: SQL'de veri tabanında bulunan verileri değiştirmek, güncellemek amacıyla kullanılır.
UPDATE Ogrenci set Adi='Atacan' where Ogrenci_No = 16;

-- DELETE: Veri tabanında bulunan bir tablodaki istenilen kayıtları silmek için kullanılır.
-- Delete komutunda şart kullanılmaz ise belirlenenkısım tamamen silinir.
Delete from Ogrenci where Ogrenci_No = 16;

-- CREATE TABLE: SQL'de yeni bir veri tabanı tablosu oluşturmak için kullanılır. 
CREATE TABLE Telefon (
Ad NCHAR(10),
Soyad NCHAR(10),
Telefon NCHAR(50),

PRIMARY KEY(Telefon)
);

CREATE TABLE Ornek (
Ad NCHAR(10),
Soyad NCHAR(10),
Telefon NCHAR(50),

PRIMARY KEY(Telefon)
);

-- AFTER TABLE: Tablo alanları üzerinde ekleme, silme, düzenleme gibi işlemleri kolayca yapabilmemizi sağlar.
Alter table Ogrenci
Add Cinsiyet NCHAR(10);

-- DROP TABLE: Veri tabanından tabloları kaldırmamızı sağlar.
Drop table Ornek;		-- !!!

-- JOIN	-- Tabloları birleştirmek amacıyla kullanılır.
-- Biribiri ile ilişkili olan tablolardaki verileri birleştirmek için kullanılan birleştirme komutudur.
-- Yapılacak birleştirme türüne göre farklı seçeneklere sahip bir komuttur.
-- INNER JOIN: Bu birleştirmede iki tablodaki ortak alanlar kontrol edilerek birleştirme işlemi yapılır.
Select * from Ogrenci INNER JOIN OgrenciDers
on Ogrenci.Ogrenci_No = OgrenciDers.Ogrenci_No;

-- LEFT JOIN: İlk (sol) tablodaki tüm satırları ve koşulları ile belirtilen ikinci (sağ) tablodaki satırları birleştirmek için kullanılır.
-- İlk (sol) tablodaki değer ile ikinci (sağ) tablodaki eşleşmeyen değer olursa ikinci (sağ) tablodaki değerler NULL değerini alır.
-- İlk seçilen tablodaki tüm satırları ve ikinci seçilen tablodaki eşleşen satırları birleştirmek için kullanılır.
Select * from Ogrenci LEFT JOIN OgrenciDers
on Ogrenci.Ogrenci_No = OgrenciDers.Ogrenci_No;

-- RIGHT JOIN: İkinci (sağ) tablodaki tüm satırları ve koşulları ile belirtilen ilk (sol) tablodaki satırları birleştirmek için kullanılır.
-- İkinci (sağ) tablodaki değer ile ilk (sol) tablodaki eşleşmeyen değer olursa ilk (sol) tablodaki değerler NULL değerini alır.
-- İkinci seçilen tablodaki tüm satırları ve ilk seçilen tablodaki eşleşen satırları birleştirmek için kullanılır.
Select * from Ogrenci RIGHT JOIN OgrenciDers
on Ogrenci.Ogrenci_No = OgrenciDers.Ogrenci_No;

-- UNION: UNION operatörü ile farklı tablolardaki seçeceğimiz alanları birleştirerek tek bir sütun gibi göstereceğiz.
-- Kriterlere uygun olan kayıtları bir kez dikkate alır, tekrarlı kayıtları ekrana getirmez.
Select Ogrenci_No from Ogrenci
UNION ALL
Select Ogrenci_No from OgrenciDers