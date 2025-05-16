<%@ page import="java.util.*, inputan.Film" %>
<%
    ArrayList<Film> filmList = new ArrayList<>();
    filmList.add(new Film("Inception", "Sci-Fi", 148, 50000, new String[]{"10:00", "13:00", "16:00"}));
    filmList.add(new Film("Avengers: Endgame", "Action", 181, 60000, new String[]{"11:00", "14:00", "17:00"}));
    filmList.add(new Film("Laskar Pelangi", "Drama", 120, 40000, new String[]{"09:00", "12:00", "15:00"}));
    session.setAttribute("filmList", filmList);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Film</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding-top: 70px;
        }
        .film-img {
            height: 250px;  
            object-fit: cover;
            border-radius: 10px;
        }
        .carousel-img {
            max-height: 75vh;
            width: auto;
            margin: 0 auto;
            display: block;
            object-fit: contain;
            background-color: #000;
        }
        .separator {
            height: 4px;
            background-color: #ccc;
            margin: 30px 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark fixed-top">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="#">Bioskop Mardira</a>
        <form class="d-flex" role="search" onsubmit="return false;">
            <input id="searchInput" class="form-control me-2" type="search" placeholder="Cari film..." onkeyup="filterFilms()" />
        </form>
    </div>
</nav>

<!-- Carousel -->
<div id="filmCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://m.media-amazon.com/images/I/51zUbui+gbL._AC_.jpg" class="d-block w-100 carousel-img" alt="Inception" />
        </div>
        <div class="carousel-item">
            <img src="https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SY679_.jpg" class="d-block w-100 carousel-img" alt="Avengers" />
        </div>
        <div class="carousel-item">
            <img src="https://1.bp.blogspot.com/-9T4t5U8DxnA/WKqn0wWompI/AAAAAAAABhw/MoU1MBDeY-cPVttYCQmzKsyeQQ_C-UUKgCLcB/s1600/Laskar-Pelangi.jpg" class="d-block w-100 carousel-img" alt="Laskar Pelangi" />
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#filmCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#filmCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- Garis pembatas -->
<div class="separator"></div>

<!-- Konten Film -->
<div class="container">
    <div class="row" id="filmContainer">
        <% 
        for (Film f : filmList) { 
            String titleLower = f.judul.toLowerCase();
        %>
        <div class="col-md-4 mb-4 film-card" data-title="<%= titleLower %>">
            <div class="card shadow">
                <img src="<%= f.judul.equals("Inception") ? "https://m.media-amazon.com/images/I/51zUbui+gbL._AC_.jpg"
                            : f.judul.equals("Avengers: Endgame") ? "https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SY679_.jpg"
                            : "https://1.bp.blogspot.com/-9T4t5U8DxnA/WKqn0wWompI/AAAAAAAABhw/MoU1MBDeY-cPVttYCQmzKsyeQQ_C-UUKgCLcB/s1600/Laskar-Pelangi.jpg" %>" 
                     class="card-img-top film-img" alt="<%= f.judul %>" />
                <div class="card-body">
                    <h5 class="card-title"><%= f.judul %></h5>
                    <p class="card-text">
                        <strong>Genre:</strong> <%= f.genre %><br />
                        <strong>Durasi:</strong> <%= f.durasi %> menit<br />
                        <strong>Harga:</strong> Rp <%= f.harga %><br />
                        <strong>Jam:</strong> <%= String.join(", ", f.jamTayang) %>
                    </p>
                    <p class="text-muted"><i>
                        <%= f.judul.equals("Inception") ? "Seorang pencuri spesialis mimpi menjalani misi terakhirnya."
                        : f.judul.equals("Avengers: Endgame") ? "Para Avengers melawan Thanos demi mengembalikan dunia."
                        : "Kisah inspiratif anak-anak Belitung mengejar pendidikan." %>
                    </i></p>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <div class="text-center mt-4">
        <a href="formPesan.jsp" class="btn btn-primary btn-lg">Pesan Tiket Sekarang</a>
    </div>
</div>

<!-- Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function filterFilms() {
    const input = document.getElementById('searchInput').value.toLowerCase();
    const cards = document.querySelectorAll('.film-card');
    cards.forEach(card => {
        const title = card.getAttribute('data-title');
        card.style.display = title.includes(input) ? 'block' : 'none';
    });
}
</script>

</body>
</html>
