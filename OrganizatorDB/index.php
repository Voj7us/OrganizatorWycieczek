<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@500&family=Inconsolata:wght@200&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Organizator wycieczki</title>
</head>

<body>
    <header>
        <h1>Wylosuj plan wycieczki</h1>
    </header>
    <main>
        <div class="generateButton">
            <form action="index.php" method="post">
                <label for="place"> Miejsce: <input type="text" value="Zakopanem" id="place" disabled></label>
                <label for="length"> Długość trasy: <input type="number" min="0" max="20" name="length" id="length"
                        required> km</label>
                <label for="difficulty"> Trudność: <select name="difficulty" id="difficulty" required>
                        <option value="" selected hidden>Wybierz</option>
                        <option>Łatwa</option>
                        <option>Średnia</option>
                        <option>Trudna</option>
                    </select></label>
                <input type="submit" value="Wylosuj trasę" class="btn" name="btn">
            </form>
        </div>
        <div class="trip">
            <?php

            if (isset($_POST['btn']) && $_POST['difficulty'] && $_POST['length']) { // sprawdzenie czy wymagane pola zostały uzupełnione
                $trudnosc = $_POST['difficulty'];
                $dlugosc = $_POST['length'];        // pobranie danych i przypisanie ich do zmiennej
                $conn = new mysqli('localhost', 'root', '', 'trasy') or exit('Nie udało się połączyć z bazą danych'); // połączenie z bazą danych
                $sql = "SELECT * FROM zakopanem WHERE Trudność = '$trudnosc' AND Długość Like '%$dlugosc%' ORDER BY RAND() LIMIT 1"; // Zapytanie do bazy danych, które pobierze odpowiedni rekord na podstawie podanych warunków i sprawi że rekordy o takich samych warunkach nie będą się powtarzały
                $query = mysqli_query($conn, $sql); // wykonanie zapytania
                if ($query->num_rows > 0) {     // Jeżeli wartość zwóconych rekordów jest większa od 0 to wykonuje poniższy kod
                    while ($row = mysqli_fetch_assoc($query)) { // pętla, która zwraca wyniki w formie tablicy assocjacyjnej zapisanej w $row
                        echo '<ul> <li><b>Nazwa: </b>'.$row['Nazwa'].'</li><li><b>Długość: </b>'.$row['Długość'].'</li><li><b>Trudność: </b>'.$row['Trudność'].'</li><li><b>Punkty Orientacyjne: </b>'.$row['PunktyOrientacyjne'].'</li><li><b>Opis: </b>'.$row['Opis'].'</li></ul>';
                        // Wyświetlenie danych pobranych z bazy danych
                    }
                } else {
                    echo '<ul><p style="color: #f73131; font-size: 25px; font-weight: bold; text-shadow: 7px 4px 10px rgba(0, 0, 0, 1);">Nie znaleziono trasy spełniającej twoje oczekiwania. Poniżej podano inną równie piękną trasę.</p></ul>'; // Nadanie stylów i wywołanie napisu jeżeli nie znaleziono trasy pasującej do warunków
                    $sql1 = "SELECT * FROM zakopanem WHERE Długość <= $dlugosc OR Długość >= $dlugosc AND Trudność = '$trudnosc' ORDER BY RAND() Limit 1"; // Wygenerowanie innej trasy
                    $query2 = mysqli_query($conn, $sql1);

                    if ($query2->num_rows > 0) {
                        while ($row = mysqli_fetch_assoc($query2)) {
                            echo '<ul> <li><b>Nazwa: </b>'.$row['Nazwa'].'</li><li><b>Długość: </b>'.$row['Długość'].'</li><li><b>Trudność: </b>'.$row['Trudność'].'</li><li><b>Punkty Orientacyjne: </b>'.$row['PunktyOrientacyjne'].'</li><li><b>Opis: </b>'.$row['Opis'].'</li></ul>';
                        }
                    }
                }
            }
            ?>
        </div>
    </main>
</body>

</html>
