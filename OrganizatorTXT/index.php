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
                        <option>łatwa</option>
                        <option>średnia</option>
                        <option>trudna</option>
                    </select></label>
                <input type="submit" value="Wylosuj trasę" class="btn" name="btn">
            </form>
        </div>
        <div class="trip">
            <?php
 if (isset($_POST['btn']) && $_POST['difficulty'] && $_POST['length']) { // sprawdzenie czy wymagane pola zostały uzupełnione
     $length = $_POST['length'];
     $difficulty = $_POST['difficulty'];
     $trasy = 'trasy.txt';  // pobranie danych i przypisanie ich do zmiennej
     $content = file_get_contents($trasy);  // odczytanie zawartości
     $lines = explode('===', $content); // podzielenie zawartości określonym znakiem

     $matchingTrips = [];   // utworzenie tablicy która będzie przechowywała dopasowane pary
     foreach ($lines as $line) { // utworzenie pętli, która wykna się dla każdej lini
         if (strpos($line, "<b>Długość:</b> około $length") !== false && strpos($line, "<b>Trudność:</b> $difficulty") !== false) { // utworzenie warunku który sprawdzi która linia zawiera podane dane
             $matchingTrips[] = $line; // dopisanie do tablicy
         }
     }

     if (!empty($matchingTrips)) {  // jeżeli tablica z parami nie jest pusta
         $random = rand(0, count($matchingTrips) - 1); // wylosowanie liczy spośród rekordów które spełniają warunek
         $trip = $matchingTrips[$random]; // przypisanie do zmiennej trip odpowiedniego wyniku
         echo $trip; // wyświetlenie wyniku
     } else {
         echo '<ul><p style="color: #f73131; font-size: 25px; font-weight: bold; text-shadow: 7px 4px 10px rgba(0, 0, 0, 1);">Nie znaleziono trasy spełniającej twoje oczekiwania. Poniżej podano inną równie piękną trasę.</p></ul>';
         // Nadanie stylów i wywołanie napisu jeżeli nie znaleziono trasy pasującej do warunków
         $random = rand(0, count($lines) - 1); // wylosowanie liczby sposród wszystkich tras
         $trip = $lines[$random]; // przypisanie do zmiennej trip wyniku
         echo $trip; // wyświelenie go
     }
 } else {
     echo 'Nie podano danych'; // Informacja w przypadku nie uzupełnienia każdego pola
 }
        ?>
        </div>
    </main>
</body>

</html>
