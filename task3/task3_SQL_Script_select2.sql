select avtor.firstname, avtor.lastname
from avtor
where avtor.idavtor=(select book_has_avtor.Avtor_idAvtor
from book_has_avtor
group by Avtor_idAvtor
ORDER BY count(book_has_avtor.Avtor_idAvtor) DESC LIMIT 1)