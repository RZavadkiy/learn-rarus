select book.title, avtor.firstname, avtor.lastname
from book
join book_has_genre on book.isbn=book_has_genre.Book_ISBN
join genre on book_has_genre.Genre_idGenre=genre.idgenre
join book_has_avtor on book.isbn=book_has_avtor.Book_ISBN
join avtor on book_has_avtor.avtor_idavtor=avtor.idavtor
WHERE genre.n_genre = 'Фантастика'