"SELECT screenings.show_time FROM screenings LEFT JOIN films ON films.id =
    screenings.film_id
    INNER JOIN tickets ON tickets.film_id = films.id;"



    "SELECT customers.* FROM customers INNER JOIN
        tickets ON tickets.customer_id =
        customers.id WHERE tickets.film_id = $1"


        SELECT films.*, screenings.show_time, tickets.*
            FROM screenings LEFT JOIN films ON films.id =
            screenings.film_id
            INNER JOIN tickets ON tickets.film_id = films.id;

        SELECT
